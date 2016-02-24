-- Deploy exploracaos_add_column_actividade
-- requires: create_table_exploracaos

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN actividade text  ;

COMMIT;
