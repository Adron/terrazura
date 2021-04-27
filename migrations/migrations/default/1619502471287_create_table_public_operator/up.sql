CREATE TABLE "public"."operator" ("id" varchar NOT NULL DEFAULT gen_unique_short_id(), "train_id" varchar NOT NULL, "railraod_id" varchar NOT NULL, "details" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_operator_updated_at"
BEFORE UPDATE ON "public"."operator"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_operator_updated_at" ON "public"."operator" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
