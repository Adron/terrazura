alter table "railroad_systems"."shipping_orders" add column "created_at" timestamptz
 null default now();
