# Start local API and database containers.
docker-compose up -d

cd ../migrations

sleep 5

hasura migrate apply --all-databases --endpoint http://localhost:8080
hasura metadata apply --endpoint http://localhost:8080
hasura seeds apply --database-name default --endpoint http://localhost:8080

hasura console --endpoint http://localhost:8080