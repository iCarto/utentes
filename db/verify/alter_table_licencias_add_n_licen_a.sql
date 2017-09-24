-- Verify utentes:alter_table_licencias_add_n_licen_a on pg

BEGIN;

SELECT n_licen_a FROM utentes.licencias WHERE false;

ROLLBACK;
