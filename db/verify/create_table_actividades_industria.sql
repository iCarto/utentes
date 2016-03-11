-- Verify create_table_actividades_industria

BEGIN;

SELECT gid, exploracao, c_estimado, tipo, instalacio, efluente, tratamento, eval_impac
FROM utentes.actividades_industria
WHERE FALSE;

ROLLBACK;
