-- Verify utentes:alter_exploracaos_add_column_d_ultima_entrega_doc on pg

BEGIN;

SELECT d_ultima_entrega_doc FROM utentes.exploracaos WHERE false;

ROLLBACK;
