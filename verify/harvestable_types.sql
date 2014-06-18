-- Verify harvestable_types

BEGIN;

SELECT id, name, volume
  FROM ew.harvestable_types
 WHERE FALSE;

ROLLBACK;
