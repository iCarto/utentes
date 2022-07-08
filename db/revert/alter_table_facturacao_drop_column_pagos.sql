-- Revert utentes:alter_table_facturacao_drop_column_pagos from pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN pagos boolean;
ALTER TABLE utentes.facturacao ADD COLUMN pagos boolean;

COMMIT;
