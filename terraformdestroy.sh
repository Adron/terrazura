if [ $0 == 'export' ]
then
  echo 'Exporting Hasura metadata.'
  cd migrations
  hasura metadata export
pwd
fi

terraform destroy \
  -var 'server=terrazuraserver' \
  -var 'username='$PUSERNAME'' \
  -var 'password='$PPASSWORD'' \
  -var 'database=terrazuradb' \
  -var 'apiport=8080'

