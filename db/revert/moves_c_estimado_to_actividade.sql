-- Revert utentes:moves_c_estimado_to_actividade from pg

BEGIN;

ALTER TABLE utentes.actividades_abastecemento ADD COLUMN c_estimado numeric(10, 2);
ALTER TABLE utentes.actividades_agricultura_rega ADD COLUMN c_estimado numeric(10, 2);
ALTER TABLE utentes.actividades_industria ADD COLUMN c_estimado numeric(10, 2);
ALTER TABLE utentes.actividades_pecuaria ADD COLUMN c_estimado numeric(10, 2);
ALTER TABLE utentes.actividades_piscicultura ADD COLUMN c_estimado numeric(10, 2);
ALTER TABLE utentes.actividades_produccao_energia ADD COLUMN c_estimado numeric(10, 2);
ALTER TABLE utentes.actividades_saneamento ADD COLUMN c_estimado numeric(10, 2);

UPDATE utentes.actividades_abastecemento b SET c_estimado = a.c_estimado FROM utentes.actividades a WHERE a.gid = b.gid;
UPDATE utentes.actividades_agricultura_rega b SET c_estimado = a.c_estimado FROM utentes.actividades a WHERE a.gid = b.gid;
UPDATE utentes.actividades_industria b SET c_estimado = a.c_estimado FROM utentes.actividades a WHERE a.gid = b.gid;
UPDATE utentes.actividades_pecuaria b SET c_estimado = a.c_estimado FROM utentes.actividades a WHERE a.gid = b.gid;
UPDATE utentes.actividades_piscicultura b SET c_estimado = a.c_estimado FROM utentes.actividades a WHERE a.gid = b.gid;
UPDATE utentes.actividades_produccao_energia b SET c_estimado = a.c_estimado FROM utentes.actividades a WHERE a.gid = b.gid;
UPDATE utentes.actividades_saneamento b SET c_estimado = a.c_estimado FROM utentes.actividades a WHERE a.gid = b.gid;

ALTER TABLE utentes.actividades DROP COLUMN c_estimado;

COMMIT;
