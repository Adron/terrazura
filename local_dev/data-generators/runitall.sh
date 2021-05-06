SAPW='hasuraMSSQL1'

echo 'Generating data file for import to SQL Server.'
node data-generation.js

echo 'Copying files to SQL Server.'
docker cp ./insert1.sql sqlserverdb:/insert1.sql
docker cp ./insert2.sql sqlserverdb:/insert2.sql
docker cp ./insert3.sql sqlserverdb:/insert3.sql
docker cp ./insert4.sql sqlserverdb:/insert4.sql
docker cp ./insert_reg1sales.sql sqlserverdb:/insert_reg1sales.sql
docker cp ./insert_sys2sales.sql sqlserverdb:/insert_sys2sales.sql

echo 'Inserting data.'
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d sales_regions -i insert1.sql
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d sales_regions -i insert2.sql
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d sales_regions -i insert3.sql
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d sales_regions -i insert4.sql
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d sales_regions -i insert_reg1sales.sql
docker exec sqlserverdb /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SAPW -d sales_regions -i insert_sys2sales.sql
