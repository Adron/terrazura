alter table "source_collector"."schema" rename column "created_at" to "Stamp";
ALTER TABLE "source_collector"."schema" ALTER COLUMN "Stamp" TYPE timestamp with time zone;
