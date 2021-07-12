SAPW='hasuraMSSQL1'

# Start local API and database containers.
docker-compose up -d
echo " ***  Services started.  ***"

# Get a user defined Postgres database available for migrations and connections.
docker cp db-starters/init-postgres.sh pgdb:init-postgres.sh
docker exec pgdb chmod 700 init-postgres.sh
docker exec pgdb ./init-postgres.sh
echo " ***  Postgres initialized.  ***"

docker cp db-starters/init-sqlserver.sql sqlserverdb:init-sqlserver.sql
#run the setup script to create the DB and the schema in the DB
#do this in a loop because the timing for when the SQL instance is ready is indeterminate

cd ../migrations

sleep 5

echo 'Migrations starting.'
hasura migrate apply --database-name default --endpoint http://localhost:8080
hasura migrate apply --database-name salesregions --endpoint http://localhost:8080

echo 'Metadata and seeds starting.'
hasura metadata apply --endpoint http://localhost:8080
hasura seeds apply --database-name default --endpoint http://localhost:8080
hasura seeds apply --database-name salesregions --endpoint http://localhost:8080

# Environment variables set on the server for the connection strings.
#   HASURA_GRAPHQL_DATABASE_URL
#   HASURA_SQLSERVER_URL