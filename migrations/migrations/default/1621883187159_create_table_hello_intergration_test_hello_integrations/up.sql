CREATE TABLE "hello_intergration_test"."hello_integrations" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "message" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("message"));
CREATE OR REPLACE FUNCTION "hello_intergration_test"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_hello_intergration_test_hello_integrations_updated_at"
BEFORE UPDATE ON "hello_intergration_test"."hello_integrations"
FOR EACH ROW
EXECUTE PROCEDURE "hello_intergration_test"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_hello_intergration_test_hello_integrations_updated_at" ON "hello_intergration_test"."hello_integrations" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
