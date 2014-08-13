-- Verify pilots

BEGIN;

SELECT id, name
  FROM ew.pilots
 WHERE FALSE;

ROLLBACK;
