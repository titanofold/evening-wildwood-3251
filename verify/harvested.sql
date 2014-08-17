-- Verify harvested

BEGIN;

SELECT op_id, pilot_id, resource_id, units
  FROM ew.harvested
 WHERE FALSE;

ROLLBACK;
