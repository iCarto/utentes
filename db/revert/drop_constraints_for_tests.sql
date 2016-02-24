-- Revert utentes:drop_constraints_for_tests from pg

BEGIN;

ALTER TABLE utentes.exploracaos ALTER COLUMN exp_name SET NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_provin SET NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_distri SET NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_posto SET NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN pagos SET NOT NULL;
ALTER TABLE utentes.exploracaos ADD CONSTRAINT exploracaos_exp_name_key UNIQUE (exp_name);

ALTER TABLE utentes.fontes ALTER COLUMN tipo_agua SET NOT NULL;

ALTER TABLE utentes.licencias ALTER COLUMN lic_nro SET NOT NULL;
ALTER TABLE utentes.licencias ALTER COLUMN lic_tipo SET NOT NULL;
ALTER TABLE utentes.licencias ADD CONSTRAINT licencias_lic_nro_key UNIQUE (lic_nro);

ALTER TABLE utentes.utentes ADD CONSTRAINT utentes_nuit_key UNIQUE (nuit);

COMMIT;
