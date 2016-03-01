-- Verify create_table_utentes

BEGIN;

SELECT gid, nome, nuit, entidade, reg_comerc, reg_zona, loc_provin, loc_distri, loc_posto, loc_nucleo
FROM utentes.utentes
WHERE FALSE;

ROLLBACK;
