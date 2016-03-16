-- Verify create_table_actividades_industria

BEGIN;

SELECT gid, c_estimado, tipo_indus, instalacio, efluente, tratamento, eval_impac
FROM utentes.actividades_industria
WHERE FALSE;

ROLLBACK;
