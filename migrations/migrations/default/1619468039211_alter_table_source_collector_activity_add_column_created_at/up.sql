alter table "source_collector"."activity" add column "created_at" timestamptz
 null default now();
