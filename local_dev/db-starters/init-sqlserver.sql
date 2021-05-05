create database sales_regions
    go
use sales_regions
    go
create schema region2
    go
create schema region1
    go
create table region2.sales_period_1
(
    id uniqueidentifier default newid() not null
        constraint sales_period_1_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar(100),
    stamp datetime default getdate()
)
    go
create table region2.sales_period_2
(
    id uniqueidentifier default newid() not null
        constraint sales_period_2_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar(100),
    stamp datetime default getdate()
)
    go
create table region2.sales_period_3
(
    id uniqueidentifier default newid() not null
        constraint sales_period_3_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar(100),
    stamp datetime default getdate()
)
    go
create table region2.sales_period_4
(
    id uniqueidentifier default newid() not null
        constraint sales_period_4_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar(100),
    stamp datetime default getdate()
)
    go

create table region1.region1sales
(
    identifier varchar(16) not null,
    sale money not null,
    dtmark datetime default SYSUTCDATETIME() not null,
    shipped bit default 0 not null,
    city nvarchar(100)
)
    go

create unique index region1sales_identifier_uindex
    on region1.region1sales (identifier)
    go

alter table region1.region1sales
    add constraint region1sales_pk
        primary key nonclustered (identifier)
    go

create table region1.system2sales
(
    amount money not null,
    date date default CURRENT_TIMESTAMP not null,
    salenote varchar(1) not null,
    notes text
)
    go
create unique index system2sales_salenote_uindex
    on region1.system2sales (salenote)
    go
create schema reporting
    go
create view reporting.sales_report as
SELECT identifier as id, sale as amount, dtmark as timestamp FROM region1.region1sales WHERE shipped = 0
UNION
SELECT NEWID() as id, amount as amount, date as timestamp FROM region1.system2sales
UNION
SELECT id, amount, stamp as timestamp FROM region2.sales_period_1
UNION
SELECT id, amount, stamp as timestamp FROM region2.sales_period_2
UNION
SELECT id, amount, stamp as timestamp FROM region2.sales_period_3
UNION
SELECT id, amount, stamp as timestamp FROM region2.sales_period_4
    go