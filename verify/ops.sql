-- Verify ops

BEGIN;

SELECT id, foreman, start, finish
  FROM ew.ops
 WHERE FALSE;

ROLLBACK;
