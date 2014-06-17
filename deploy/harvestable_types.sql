-- Deploy harvestable_types
-- requires: appschema

BEGIN;

SET client_min_messages = 'warning';

CREATE TABLE ew.harvestable_types (
       harvest_type TEXT PRIMARY KEY NOT NULL,
       unit_volume  DECIMAL NOT NULL
);

COMMIT;
