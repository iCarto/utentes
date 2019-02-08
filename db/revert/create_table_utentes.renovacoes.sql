-- Revert utentes:create_table_utentes.renovacoes from pg

BEGIN;

DROP TABLE utentes.renovacoes;

COMMIT;
