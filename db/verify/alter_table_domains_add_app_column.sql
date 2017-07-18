-- Verify utentes:alter_table_domains_licencia_estado_add_app on pg

BEGIN;


SELECT app FROM domains.licencia_estado WHERE FALSE;
SELECT app FROM domains.provincia WHERE FALSE;
SELECT app FROM domains.distrito WHERE FALSE;
SELECT app FROM domains.posto WHERE FALSE;
SELECT app FROM domains.bacia WHERE FALSE;
SELECT app FROM domains.subacia WHERE FALSE;

ROLLBACK;
