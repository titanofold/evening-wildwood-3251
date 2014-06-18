-- Revert harvestable_types_data

BEGIN;

DELETE FROM ew.harvestable_types;

COMMIT;
