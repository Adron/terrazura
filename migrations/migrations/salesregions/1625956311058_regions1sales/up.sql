create table region1.region1sales
(
    identifier varchar(16) not null,
    sale money not null,
    dtmark datetime default SYSUTCDATETIME() not null,
    shipped bit default 0 not null,
    city nvarchar(100)
)
