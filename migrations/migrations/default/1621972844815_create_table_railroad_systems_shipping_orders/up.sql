CREATE TABLE "railroad_systems"."shipping_orders" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "order" varchar NOT NULL, "weight" bigint NOT NULL, "car_loads" int NOT NULL, "request_date" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "notes" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("order"));
CREATE OR REPLACE FUNCTION "railroad_systems"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_railroad_systems_shipping_orders_updated_at"
BEFORE UPDATE ON "railroad_systems"."shipping_orders"
FOR EACH ROW
EXECUTE PROCEDURE "railroad_systems"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_railroad_systems_shipping_orders_updated_at" ON "railroad_systems"."shipping_orders" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
