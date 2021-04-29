if [ $1 == 'export' ]
then
  echo 'Exporting Hasura metadata.'
  cd ../migrations
  hasura metadata export --endpoint http://localhost:8080
  cd ../local_dev
pwd
fi

docker-compose down
docker volume rm local_dev_db_data