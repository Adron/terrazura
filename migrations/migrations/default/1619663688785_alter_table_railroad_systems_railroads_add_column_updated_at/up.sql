alter table "railroad_systems"."railroads" add column "updated_at" timestamptz
 null default now();

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
CREATE TRIGGER "set_railroad_systems_railroads_updated_at"
BEFORE UPDATE ON "railroad_systems"."railroads"
FOR EACH ROW
EXECUTE PROCEDURE "railroad_systems"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_railroad_systems_railroads_updated_at" ON "railroad_systems"."railroads" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
