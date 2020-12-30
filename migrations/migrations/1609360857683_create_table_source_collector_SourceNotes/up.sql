CREATE TABLE "source_collector"."SourceNotes"
(
    "SourceId" uuid        NOT NULL,
    "NotesId"  uuid        NOT NULL,
    "Details"  text        NOT NULL,
    "Stamp"    timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY ("SourceId", "NotesId")
);
