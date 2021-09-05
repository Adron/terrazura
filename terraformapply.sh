terraform init

terraform apply \
  -var 'server=terrazuraserver' \
  -var 'username='$PUSERNAME'' \
  -var 'password='$PPASSWORD'' \
  -var 'sqluid='$SQLUID'' \
  -var 'sqlpwd='$SQLPWD'' \
  -var 'pgdatabase=terrazuradb' \
  -var 'sqlserverdb=salesregions' \
  -var 'apiport=8080'

cd migrations

echo "Preparing to migrate database schemas."
sleep 5

hasura migrate apply --all-databases

sleep 5

hasura metadata apply
hasura seeds apply --database-name default

hasura console
