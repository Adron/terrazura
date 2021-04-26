ALTER TABLE "source_collector"."schema" ALTER COLUMN "Stamp" TYPE timestamp with time zone;
alter table "source_collector"."schema" rename column "Stamp" to "created_at";
