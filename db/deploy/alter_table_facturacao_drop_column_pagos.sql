-- Deploy utentes:alter_table_facturacao_drop_column_pagos to pg

BEGIN;

ALTER TABLE utentes.facturacao DROP COLUMN pagos;
ALTER TABLE utentes.exploracaos DROP COLUMN pagos;

COMMIT;
