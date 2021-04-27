CREATE TABLE "railroad_systems"."trains" ("id" varchar NOT NULL DEFAULT gen_unique_short_id(), "name" varchar NOT NULL, "historical_start" date NOT NULL, "historical_end" date NOT NULL, "description" text NOT NULL, "notes" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("id"));
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
CREATE TRIGGER "set_railroad_systems_trains_updated_at"
BEFORE UPDATE ON "railroad_systems"."trains"
FOR EACH ROW
EXECUTE PROCEDURE "railroad_systems"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_railroad_systems_trains_updated_at" ON "railroad_systems"."trains" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
