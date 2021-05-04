create table region2.sales_period_2
(
    id uniqueidentifier default newid() not null
        constraint sales_period_2_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar,
    stamp datetime default getdate()
)