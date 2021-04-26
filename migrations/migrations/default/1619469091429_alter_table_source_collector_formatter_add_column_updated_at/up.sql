alter table "source_collector"."formatter" add column "updated_at" timestamptz
 null default now();

CREATE OR REPLACE FUNCTION "source_collector"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_source_collector_formatter_updated_at"
BEFORE UPDATE ON "source_collector"."formatter"
FOR EACH ROW
EXECUTE PROCEDURE "source_collector"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_source_collector_formatter_updated_at" ON "source_collector"."formatter" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
