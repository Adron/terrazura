create view reporting.sales_report as
SELECT CAST(identifier AS varchar(36)) as id, sale as amount, dtmark as timestamp FROM region1.region1sales WHERE shipped = 0
UNION
SELECT '' as id, amount as amount, datestamp as timestamp FROM region1.system2sales
UNION
SELECT CAST(id AS varchar(36)), amount, stamp as timestamp FROM region2.sales_period_1
UNION
SELECT CAST(id AS varchar(36)), amount, stamp as timestamp FROM region2.sales_period_2
UNION
SELECT CAST(id AS varchar(36)), amount, stamp as timestamp FROM region2.sales_period_3
UNION
SELECT CAST(id AS varchar(36)), amount, stamp as timestamp FROM region2.sales_period_4