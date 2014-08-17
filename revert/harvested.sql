-- Revert harvested

BEGIN;

DROP INDEX ew.harvested_op_id_idx;
DROP TABLE ew.harvested;

COMMIT;
