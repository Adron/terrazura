ALTER TABLE "source_collector"."source" ALTER COLUMN "Stamp" TYPE timestamp with time zone;
alter table "source_collector"."source" rename column "Stamp" to "created_at";
