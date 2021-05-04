SAPW='hasuraMSSQL1'

# Start local API and database containers.
docker-compose up -d
echo " ***  Services started.  ***"

# Get a user defined Postgres database available for migrations and connections.
docker cp db-starters/init-postgres.sh pgdb:init-postgres.sh
docker exec pgdb chmod 700 init-postgres.sh
docker exec pgdb ./init-postgres.sh
echo " ***  Postgres initialized.  ***"

# Cuz SQL Server doesn't always start reliably in less than a few seconds.
sleep 8

# Get a user defined SQL Server database available for migrations and connections.
docker cp db-starters/init-sqlserver.sql sqlserverdb:init-sqlserver.sql
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d master -i init-sqlserver.sql
echo " ***  SQL Server initialized.  ***"

cd ../migrations

sleep 3

echo 'Migrations starting.'
hasura migrate apply --database-name default --endpoint http://localhost:8080

echo 'Metadata and seeds starting.'
hasura metadata apply --endpoint http://localhost:8080
hasura seeds apply --database-name default --endpoint http://localhost:8080

hasura console --endpoint http://localhost:8080