alter table "source_collector"."source_notes" add column "Stamp" timestamptz;
alter table "source_collector"."source_notes" alter column "Stamp" set default now();
alter table "source_collector"."source_notes" alter column "Stamp" drop not null;

