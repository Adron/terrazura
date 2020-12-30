CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "source_collector"."Source"
(
    "Id"      uuid        NOT NULL DEFAULT gen_random_uuid(),
    "Stamp"   timestamptz NOT NULL DEFAULT now(),
    "Name"    text        NOT NULL,
    "Uri"     text        NOT NULL,
    "Details" text,
    PRIMARY KEY ("Id"),
    UNIQUE ("Id"),
    UNIQUE ("Uri")
);
