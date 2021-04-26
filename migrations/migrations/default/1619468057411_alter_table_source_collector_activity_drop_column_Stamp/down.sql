alter table "source_collector"."activity" add column "Stamp" timestamptz;
alter table "source_collector"."activity" alter column "Stamp" set default now();
alter table "source_collector"."activity" alter column "Stamp" drop not null;

