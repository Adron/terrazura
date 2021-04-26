alter table "source_collector"."source_notes" add column "created_at" timestamptz
 null default now();
