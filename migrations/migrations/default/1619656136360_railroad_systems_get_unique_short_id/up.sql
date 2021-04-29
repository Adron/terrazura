CREATE OR REPLACE FUNCTION railroad_systems.gen_unique_short_id() returns text
    language plpgsql
as $$
DECLARE
    id text;
BEGIN
    id := encode(gen_random_bytes(6), 'base64');
    id := replace(id, '/', '_');
    id := replace(id, '+', '_');
    RETURN id;
END;
$$;

alter function railroad_systems.gen_unique_short_id() owner to postgres;
