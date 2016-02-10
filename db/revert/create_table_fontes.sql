-- Revert create_table_fontes

BEGIN;

DROP TABLE utentes.fontes;

COMMIT;
