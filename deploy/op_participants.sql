-- Deploy op_participants
-- requires: ops
-- requires: pilots

BEGIN;

CREATE TYPE pilot_role AS ENUM ('Miner', 'Defender', 'Hauler', 'Orca', 'Rorqual');

CREATE TABLE ew.op_participants (
       pilot_id CHARACTER VARYING(20) NOT NULL REFERENCES ew.pilots (id),
       op_id INTEGER NOT NULL REFERENCES ew.ops (id),
       role  pilot_role NOT NULL,
       share NUMERIC(3,2) NOT NULL
);

COMMIT;
