-- Deploy utentes:moves_c_estimado_to_actividade to pg

BEGIN;

ALTER TABLE utentes.actividades ADD COLUMN c_estimado numeric(10, 2);

UPDATE utentes.actividades a SET c_estimado = b.c_estimado
FROM (
    SELECT gid, c_estimado FROM utentes.actividades_abastecemento
    UNION
        SELECT gid, c_estimado FROM utentes.actividades_agricultura_rega
    UNION
        SELECT gid, c_estimado FROM utentes.actividades_industria
    UNION
        SELECT gid, c_estimado FROM utentes.actividades_pecuaria
    UNION
        SELECT gid, c_estimado FROM utentes.actividades_piscicultura
    UNION
        SELECT gid, c_estimado FROM utentes.actividades_produccao_energia
    UNION
        SELECT gid, c_estimado FROM utentes.actividades_saneamento
) b
WHERE b.gid = a.gid
;


ALTER TABLE utentes.actividades_abastecemento DROP COLUMN c_estimado;
ALTER TABLE utentes.actividades_agricultura_rega DROP COLUMN c_estimado;
ALTER TABLE utentes.actividades_industria DROP COLUMN c_estimado;
ALTER TABLE utentes.actividades_pecuaria DROP COLUMN c_estimado;
ALTER TABLE utentes.actividades_piscicultura DROP COLUMN c_estimado;
ALTER TABLE utentes.actividades_produccao_energia DROP COLUMN c_estimado;
ALTER TABLE utentes.actividades_saneamento DROP COLUMN c_estimado;


COMMIT;
