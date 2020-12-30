alter table "source_collector"."NoteJot"
    add constraint "NoteJot_NoteId_fkey"
        foreign key ("NoteId")
            references "source_collector"."NoteJot"
                ("Id") on update restrict on delete restrict;
