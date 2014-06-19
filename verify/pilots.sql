-- Verify pilots

BEGIN;

SELECT id, name, password
  FROM ew.pilots
 WHERE FALSE;

ROLLBACK;
