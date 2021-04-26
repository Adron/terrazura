CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "source_collector"."Formatter"
(
    "Id"           uuid        NOT NULL DEFAULT gen_random_uuid(),
    "Stamp"        timestamptz NOT NULL DEFAULT now(),
    "FormatterMap" jsonb       NOT NULL,
    PRIMARY KEY ("Id"),
    UNIQUE ("Id")
);
