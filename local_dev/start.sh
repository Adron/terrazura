SAPW='hasuraMSSQL1'

# Start local API and database containers.
docker-compose up -d

# Get a user defined Postgres database available for migrations and connections.
docker cp db-starters/init-postgres.sh pgdb:init-postgres.sh
docker exec pgdb chmod 700 init-postgres.sh
docker exec pgdb ./init-postgres.sh

# Cuz SQL Server doesn't always start reliably in less than a few seconds.
sleep 5

# Get a user defined SQL Server database available for migrations and connections.
docker cp db-starters/init-sqlserver.sql sqlserverdb:setup.sql
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d master -i setup.sql

cd ../migrations

sleep 3

hasura migrate apply --all-databases --endpoint http://localhost:8080
hasura metadata apply --endpoint http://localhost:8080
hasura seeds apply --database-name default --endpoint http://localhost:8080

hasura console --endpoint http://localhost:8080