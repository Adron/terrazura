terraform init

terraform apply -auto-approve \
  -var 'server=terrazuraserver' \
  -var 'username='$PUSERNAME'' \
  -var 'password='$PPASSWORD'' \
  -var 'sqluid='$SQLUID'' \
  -var 'sqlpwd='$SQLPWD'' \
  -var 'pgdatabase=terrazuradb' \
  -var 'sqlserverdb=salesregions' \
  -var 'apiport=8080'

cd migrations

hasura migrate apply --all-databases
hasura migrate apply --database-name salesregions
hasura metadata apply
hasura seeds apply --database-name default

hasura console