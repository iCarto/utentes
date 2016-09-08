-- Verify create_schema_utentes

BEGIN;

-- SELECT 1/count(*) FROM information_schema.schemata WHERE
--        schema_name = 'utentes'
--        AND
--        schema_owner = 'utentes';

SELECT 1/count(*) FROM information_schema.schemata WHERE
       schema_name = 'utentes';

ROLLBACK;
