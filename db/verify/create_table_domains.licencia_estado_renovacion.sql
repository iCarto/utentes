-- Verify utentes:create_table_domains.licencia_estado_renovacion on pg

BEGIN;

SELECT * from domains.licencia_estado_renovacao where false;

ROLLBACK;
