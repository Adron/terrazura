create database sales_data
    go
use sales_data
go
grant connect on database :: sales_data to dbo
go
grant view any column encryption key definition, view any column master key definition on database :: sales_data to [public]
go
create table reg_2_sales_extraction
(
    identifier varchar default newid() not null
        constraint reg_2_sales_extraction_pk
            primary key nonclustered,
    sales money,
    timedatemark datetime default getdate()
)
    go

create table table_name
(
    id uniqueidentifier default newid() not null
        constraint table_name_pk
            primary key nonclustered,
    stamp datetime default getdate(),
    amount money,
    location nvarchar
)
    go

