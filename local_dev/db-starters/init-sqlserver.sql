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
    id uniqueidentifier default newid()
        constraint sales_period_1_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar
)
    go
create table region2.sales_period_2
(
    id uniqueidentifier default newid()
        constraint sales_period_2_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar
)
go
create table region2.sales_period_3
(
    id uniqueidentifier default newid()
        constraint sales_period_3_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar
)
    go
create table region2.sales_period_4
(
    id uniqueidentifier default newid()
        constraint sales_period_4_pk
            primary key nonclustered,
    amount money default 0,
    location nvarchar
)