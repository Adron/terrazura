SAPW='hasuraMSSQL1'

echo 'Generating data file for import to SQL Server.'
node data-generation.js
echo "Generating Subhendu's sample table."
node subhendu_data_generator.js

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

echo 'The big file copy and the script copy file.'
docker cp ./kundu_table_data.csv pgdb:/kundu_table_data.csv
docker cp ./kundu-data-copy.sh pgdb:/kundu-data-copy.sh
echo 'Theoretically done. Now running the bulk import.'
docker exec pgdb chmod 700 kundu-data-copy.sh
docker exec -it pgdb psql -U postgres -d coredb -h localhost -p 5432 -f ./kundu-data-copy.sh

#docker exec -it pgdb psql -U postgres
#COPY kundu.analytics_data FROM '/kundu_table_data.csv' CSV HEADER;

# Cleanup
rm insert1.sql insert2.sql insert3.sql insert4.sql insert_reg1sales.sql insert_sys2sales.sql kundu_table_data.csv