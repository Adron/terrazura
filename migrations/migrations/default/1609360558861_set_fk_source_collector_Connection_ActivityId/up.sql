alter table "source_collector"."Connection"
    add constraint "Connection_ActivityId_fkey"
        foreign key ("ActivityId")
            references "source_collector"."Activity"
                ("Id") on update restrict on delete restrict;
