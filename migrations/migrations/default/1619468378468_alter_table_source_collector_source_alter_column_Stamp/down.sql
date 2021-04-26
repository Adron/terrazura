alter table "source_collector"."source" rename column "created_at" to "Stamp";
ALTER TABLE "source_collector"."source" ALTER COLUMN "Stamp" TYPE timestamp with time zone;
