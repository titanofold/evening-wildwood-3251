-- Deploy pilots
-- requires: appschema

BEGIN;

CREATE TABLE ew.pilots (
       id CHARACTER VARYING(20) PRIMARY KEY CHECK (id ~ '^[0-9]+$'),
       name TEXT NOT NULL UNIQUE,
       password TEXT
);

COMMIT;
