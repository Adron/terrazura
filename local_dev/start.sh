SAPW='hasuraMSSQL1'

# Start local API and database containers.
docker compose up -d
echo " ***  Services started.  ***"

# Get a user defined Postgres database available for migrations and connections.
docker cp db-starters/init-postgres.sh pgdb:init-postgres.sh
docker exec pgdb chmod 700 init-postgres.sh
docker exec pgdb ./init-postgres.sh
echo " ***  Postgres initialized.  ***"

docker cp db-starters/init-sqlserver.sql sqlserverdb:init-sqlserver.sql
#run the setup script to create the DB and the schema in the DB
#do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..50};
do
    docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d master -i init-sqlserver.sql
    if [ $? -eq 0 ]
    then
        # Get a user defined SQL Server database available for migrations and connections.
        echo " ***  SQL Server initialized.  ***"
        break
    else
        echo "not ready yet... waiting."
        sleep 1
    fi
done

cd ../migrations

sleep 2

echo 'Migrations starting.'
hasura migrate apply --database-name default --endpoint http://localhost:8080

echo 'Metadata and seeds starting.'
hasura metadata apply --endpoint http://localhost:8080
hasura seeds apply --database-name default --endpoint http://localhost:8080

cd ../local_dev/data-generators
./runitall.sh

cd ../../migrations

# hasura console --endpoint http://localhost:8080

# cd ../../local_dev/tertiary-graphql-servers
# node server.js
