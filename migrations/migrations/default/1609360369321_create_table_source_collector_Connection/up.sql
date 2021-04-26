CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "source_collector"."Connection"
(
    "Id"         uuid        NOT NULL DEFAULT gen_random_uuid(),
    "Stamp"      timestamptz NOT NULL DEFAULT now(),
    "ActivityId" uuid        NOT NULL,
    "SourceId"   uuid        NOT NULL,
    PRIMARY KEY ("Id"),
    UNIQUE ("Id")
);
