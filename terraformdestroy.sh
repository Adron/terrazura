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
  -var 'sqluid='$SQLUID'' \
  -var 'sqlpwd='$SQLPWD'' \
  -var 'pgdatabase=terrazuradb' \
  -var 'sqlserverdb=salesregions' \
  -var 'apiport=8080'

# Run it again, since it alwasy seems to be needed.
terraform destroy \
  -var 'server=terrazuraserver' \
  -var 'username='$PUSERNAME'' \
  -var 'password='$PPASSWORD'' \
  -var 'sqluid='$SQLUID'' \
  -var 'sqlpwd='$SQLPWD'' \
  -var 'pgdatabase=terrazuradb' \
  -var 'sqlserverdb=salesregions' \
  -var 'apiport=8080'

