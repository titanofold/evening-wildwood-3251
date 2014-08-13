-- Deploy pilots
-- requires: appschema

BEGIN;

CREATE TABLE ew.pilots (
       id CHARACTER(8) PRIMARY KEY CHECK (id ~ '^[0-9]+$'),
       name TEXT NOT NULL UNIQUE,
);

COMMIT;
