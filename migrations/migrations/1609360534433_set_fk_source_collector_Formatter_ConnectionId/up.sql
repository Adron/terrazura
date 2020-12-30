alter table "source_collector"."Formatter"
    add constraint "Formatter_ConnectionId_fkey"
        foreign key ("ConnectionId")
            references "source_collector"."Connection"
                ("Id") on update restrict on delete restrict;
