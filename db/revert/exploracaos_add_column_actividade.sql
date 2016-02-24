-- Revert exploracaos_add_column_actividade

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN actividade;

COMMIT;
