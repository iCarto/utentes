-- Verify utentes:alter_table_fuentes_add_sist_med_del_contador on pg

BEGIN;

-- Exception if sist_med field doesn't exist in utentes.fontes
SELECT sist_med FROM utentes.fontes WHERE FALSE;

-- Exception if table domains.fontes_sist_med doesn't been created
SELECT * from domains.fontes_sist_med WHERE FALSE;

-- Exception if the view doesn't have data of domains.fontes_sist_med
SELECT count(*) FROM domains.domains WHERE category='sistema_medicao';

ROLLBACK;
