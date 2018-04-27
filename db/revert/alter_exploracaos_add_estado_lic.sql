-- Revert utentes:alter_exploracaos_add_estado_lic from pg

BEGIN;

-- not reverting the update of 2016-021

ALTER TABLE utentes.exploracaos DROP COLUMN estado_lic;

COMMIT;
