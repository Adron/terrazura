CREATE TABLE "source_collector"."Schema"
(
    "Id"        UUID        NOT NULL DEFAULT gen_random_uuid(),
    "Stamp"     timestamptz NOT NULL DEFAULT now(),
    "SchemaMap" jsonb       NOT NULL,
    PRIMARY KEY ("Id"),
    UNIQUE ("Id")
);
