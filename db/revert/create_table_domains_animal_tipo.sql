-- Revert create_table_domains_animal_tipo

BEGIN;

DROP TABLE domains.animal_tipo;

COMMIT;
