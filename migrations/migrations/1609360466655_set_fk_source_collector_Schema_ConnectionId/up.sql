alter table "source_collector"."Schema"
    add constraint "Schema_ConnectionId_fkey"
        foreign key ("ConnectionId")
            references "source_collector"."Connection"
                ("Id") on update restrict on delete restrict;
