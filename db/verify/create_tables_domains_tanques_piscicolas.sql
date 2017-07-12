-- Verify utentes:create_tables_domains_tanques_piscicolas on pg

BEGIN;

SELECT * FROM domains.tanque_piscicola_tipo WHERE false;
SELECT * FROM domains.tanque_piscicola_estado WHERE false;
SELECT * FROM domains.tanque_piscicola_esp_culti WHERE false;
SELECT * FROM domains.tanque_piscicola_tipo_alim WHERE false;
SELECT * FROM domains.tanque_piscicola_prov_alev WHERE false;
SELECT * FROM domains.tanque_piscicola_fert_agua WHERE false;

ROLLBACK;
