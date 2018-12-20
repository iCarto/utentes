-- Verify utentes:alter_table_exploracaos_add_cadastro_uni on pg

BEGIN;

SELECT cadastro_uni FROM utentes.exploracaos WHERE FALSE;
SELECT cadastro FROM utentes.fontes WHERE FALSE;

ROLLBACK;
