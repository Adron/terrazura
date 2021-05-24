#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE coredb;
    CREATE DATABASE applications;
    GRANT ALL PRIVILEGES ON DATABASE coredb TO postgres;
    GRANT ALL PRIVILEGES ON DATABASE applications TO postgres;
EOSQL