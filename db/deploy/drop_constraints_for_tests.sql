-- Deploy utentes:drop_constraints_for_tests to pg

BEGIN;

ALTER TABLE utentes.exploracaos ALTER COLUMN exp_name DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_provin DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_distri DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_posto DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN pagos DROP NOT NULL;
ALTER TABLE utentes.exploracaos DROP CONSTRAINT exploracaos_exp_name_key;

ALTER TABLE utentes.fontes ALTER COLUMN tipo_agua DROP NOT NULL;

ALTER TABLE utentes.licencias ALTER COLUMN lic_nro DROP NOT NULL;
ALTER TABLE utentes.licencias ALTER COLUMN lic_tipo DROP NOT NULL;
ALTER TABLE utentes.licencias DROP CONSTRAINT licencias_lic_nro_key;

ALTER TABLE utentes.utentes DROP CONSTRAINT utentes_nuit_key;

COMMIT;
