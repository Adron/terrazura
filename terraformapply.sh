terraform apply -auto-approve \
  -var 'server=terrazuraserver' \
  -var 'username='$PUSERNAME'' \
  -var 'password='$PPASSWORD'' \
  -var 'database=terrazuradb' \
  -var 'apiport=8080'