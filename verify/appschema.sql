-- Verify appschema.sql

BEGIN;

SELECT pg_catalog.has_schema_privilege('ew', 'usage');

ROLLBACK;
