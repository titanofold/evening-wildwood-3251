-- Deploy harvested
-- requires: pilots
-- requires: ops
-- requires: op_participants
-- requires: harvestable_types

BEGIN;

CREATE TABLE ew.harvested (
    op_id INTEGER NOT NULL,
    pilot_id CHARACTER VARYING(10) NOT NULL,
    resource_id CHARACTER VARYING(5) REFERENCES ew.harvestable_types(id) NOT NULL,
    units INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (op_id, pilot_id) REFERENCES ew.op_participants (op_id, pilot_id)
);

CREATE INDEX harvested_op_id_idx ON ew.harvested (op_id);

COMMIT;
