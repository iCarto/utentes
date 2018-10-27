-- Verify utentes:alter_table_exploracaos_add_lic_imp on pg

BEGIN;

SELECT lic_imp FROM utentes.exploracaos WHERE false;

ROLLBACK;
