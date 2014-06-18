-- Verify harvestable_types_data

BEGIN;

SELECT
	CASE WHEN COUNT(*) = 85 THEN 1
	     ELSE 0
	END
  FROM ew.harvestable_types;

ROLLBACK;
