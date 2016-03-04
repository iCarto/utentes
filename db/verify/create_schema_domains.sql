-- Verify create_schema_domains

BEGIN;

SELECT 1/count(*) FROM information_schema.schemata WHERE
       schema_name = 'domains'
       AND
       schema_owner = 'utentes';

ROLLBACK;