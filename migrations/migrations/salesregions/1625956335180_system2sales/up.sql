create table region1.system2sales
(
    amount money not null,
    datestamp date default CURRENT_TIMESTAMP not null,
    salenote varchar(1) not null,
    notes text
)