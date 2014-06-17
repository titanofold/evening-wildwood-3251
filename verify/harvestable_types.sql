-- Verify harvestable_types

BEGIN;

SELECT harvest_type, unit_volume
  FROM ew.harvestable_types
 WHERE FALSE;

ROLLBACK;
