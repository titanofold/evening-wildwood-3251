-- Deploy harvestable_types
-- requires: appschema

BEGIN;

SET client_min_messages = 'warning';

CREATE TABLE ew.harvestable_types (
       id     CHARACTER VARYING(5) PRIMARY KEY NOT NULL,
       name   TEXT 		   UNIQUE NOT NULL,
       volume NUMERIC 		   NOT NULL
);

COMMIT;
