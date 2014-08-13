-- Deploy op_participants
-- requires: ops
-- requires: pilots

BEGIN;

CREATE TYPE pilot_role AS ENUM ('Miner', 'Defender', 'Hauler', 'Orca', 'Rorqual');

CREATE TABLE ew.op_participants (
       op_id INTEGER NOT NULL REFERENCES ew.ops (id),
       pilot_id CHARACTER VARYING(20) NOT NULL REFERENCES ew.pilots (id),
       role  pilot_role NOT NULL,
       share NUMERIC(3,2) NOT NULL,
       paid BOOLEAN DEFAULT FALSE,
       PRIMARY KEY (op_id, pilot_id)
);

COMMIT;
