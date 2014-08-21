-- Deploy pilots
-- requires: appschema

BEGIN;

CREATE TABLE ew.pilots (
       id CHARACTER VARYING(10) PRIMARY KEY CHECK (id ~ '^[0-9]+$' AND id::bigint < 2100000000),
       name TEXT NOT NULL UNIQUE
);

COMMIT;
