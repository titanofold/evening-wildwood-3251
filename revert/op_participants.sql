-- Revert op_participants

BEGIN;

DROP TABLE ew.op_participants;
DROP TYPE pilot_role;

COMMIT;
