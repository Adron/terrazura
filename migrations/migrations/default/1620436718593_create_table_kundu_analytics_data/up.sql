CREATE TABLE "kundu"."analytics_data" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "country" varchar NOT NULL, "ip" varchar NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE OR REPLACE FUNCTION "kundu"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_kundu_analytics_data_updated_at"
BEFORE UPDATE ON "kundu"."analytics_data"
FOR EACH ROW
EXECUTE PROCEDURE "kundu"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_kundu_analytics_data_updated_at" ON "kundu"."analytics_data" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
