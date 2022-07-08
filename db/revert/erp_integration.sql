-- Revert utentes:erp_integration from pg

BEGIN;

DROP TABLE utentes.exploracaos_erp;

DROP TRIGGER update_updated_at ON utentes.facturacao;

ALTER TABLE utentes.facturacao DROP COLUMN updated_at;

DROP TABLE utentes.facturacao_erp;

COMMIT;
