alter table "source_collector"."Connection"
    add constraint "Connection_SourceId_fkey"
        foreign key ("SourceId")
            references "source_collector"."Source"
                ("Id") on update restrict on delete restrict;
