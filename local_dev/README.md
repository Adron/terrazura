# NOTE: local_dev is in flux, I've got some refactors coming for it real soon. -Adron

Sample SQL Server ODBC Connection Strings:

* Driver={ODBC Driver 17 for SQL Server};Server=myServerAddress;Database=myDataBase;UID=myUsername;PWD=myPassword;
* Driver={ODBC Driver 17 for SQL Server};Server=myServerAddress;Database=myDataBase;Trusted_Connection=yes;
* Driver={ODBC Driver 17 for SQL Server};Server=serverName\instanceName;Database=myDataBase;Trusted_Connection=yes;

export MSSQL_PASSWORD=hasuraSSQL1

docker run -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$MSSQL_PASSWORD" \
-p 127.0.0.1:1433:1433 -d mcr.microsoft.com/mssql/server:2019-CU8-ubuntu-16.04

docker exec -it interesting_colden /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_PASSWORD