-- Verify utentes:alter_table_exploracaos_add_new_column_bol_an_agua on pg

BEGIN;

SELECT bol_an_agua FROM utentes.exploracaos WHERE false;

ROLLBACK;
