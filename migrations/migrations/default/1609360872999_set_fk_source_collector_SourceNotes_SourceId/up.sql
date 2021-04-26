alter table "source_collector"."SourceNotes"
    add constraint "SourceNotes_SourceId_fkey"
        foreign key ("SourceId")
            references "source_collector"."Source"
                ("Id") on update restrict on delete restrict;
