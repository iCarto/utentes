-- Verify create_table_utentes

BEGIN;

SELECT gid, nome, nuit, entidade, reg_comerc, reg_zona
FROM utentes.utentes
WHERE FALSE;

ROLLBACK;
