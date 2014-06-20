-- Deploy ops
-- requires: appschema
-- requires: pilots

BEGIN;

CREATE TABLE ew.ops (
       id      SERIAL PRIMARY KEY,
       foreman CHARACTER VARYING(20) REFERENCES ew.pilots (id),
       start   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp,
       finish  TIMESTAMP WITH TIME ZONE
);

COMMIT;
