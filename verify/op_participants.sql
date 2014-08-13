-- Verify op_participants

BEGIN;

SELECT pilot_id, op_id, role, share, paid
  FROM ew.op_participants
 WHERE FALSE;

ROLLBACK;
