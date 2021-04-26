CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "source_collector"."NoteJot"
(
    "Id"      uuid        NOT NULL DEFAULT gen_random_uuid(),
    "Stamp"   timestamptz NOT NULL DEFAULT now(),
    "NoteId"  uuid        NOT NULL,
    "Details" text        NOT NULL,
    PRIMARY KEY ("Id"),
    UNIQUE ("Id")
);
