-- Deploy utentes:alter_table_reses_change_type_c_res to pg

BEGIN;

ALTER TABLE utentes.actividades_reses ALTER COLUMN c_res TYPE numeric(10, 2);
UPDATE utentes.actividades_reses SET c_res = 0.3 WHERE reses_tipo = 'Avícola (Aves)';
UPDATE utentes.actividades_reses SET c_estimado = reses_nro * c_res * 0.03 WHERE reses_tipo = 'Avícola (Aves)';

COMMIT;
