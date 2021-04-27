CREATE TABLE "railroad_systems"."operators" ("id" varchar NOT NULL DEFAULT gen_unique_short_id(), "train_id" varchar NOT NULL, "railroad_id" varchar NOT NULL, "details" text, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("railroad_id") REFERENCES "railroad_systems"."railroads"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("train_id") REFERENCES "railroad_systems"."trains"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"), UNIQUE ("train_id", "railroad_id"));
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
CREATE TRIGGER "set_railroad_systems_operators_updated_at"
BEFORE UPDATE ON "railroad_systems"."operators"
FOR EACH ROW
EXECUTE PROCEDURE "railroad_systems"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_railroad_systems_operators_updated_at" ON "railroad_systems"."operators" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
