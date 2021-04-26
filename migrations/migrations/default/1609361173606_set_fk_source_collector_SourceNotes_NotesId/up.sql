alter table "source_collector"."SourceNotes"
    add constraint "SourceNotes_NotesId_fkey"
        foreign key ("NotesId")
            references "source_collector"."NoteJot"
                ("Id") on update restrict on delete restrict;
