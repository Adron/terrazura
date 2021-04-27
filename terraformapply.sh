terraform init

terraform apply -auto-approve \
  -var 'server=terrazuraserver' \
  -var 'username='$PUSERNAME'' \
  -var 'password='$PPASSWORD'' \
  -var 'database=terrazuradb' \
  -var 'apiport=8080'

cd migrations

hasura migrate apply --all-databases
hasura metadata apply
hasura seeds apply --database-name default
