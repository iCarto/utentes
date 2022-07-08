-- Verify create_table_settings

BEGIN;

SELECT property, value
FROM utentes.settings
WHERE FALSE;

ROLLBACK;
