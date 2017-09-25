-- Revert utentes:alter_table_reses_change_type_c_res from pg

BEGIN;

ALTER TABLE utentes.actividades_reses ALTER COLUMN c_res TYPE integer;
UPDATE utentes.actividades_reses SET c_res = 0 WHERE reses_tipo = 'Avícola (Aves)';
UPDATE utentes.actividades_reses SET c_estimado = 0 WHERE reses_tipo = 'Avícola (Aves)';

COMMIT;
