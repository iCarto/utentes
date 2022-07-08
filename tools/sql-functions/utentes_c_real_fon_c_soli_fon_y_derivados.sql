/*
Actualizamos en utentes.licencias los datos de c_soli_fon, c_real_fon, c_soli_tot y
c_real_tot a partir de utentes.fontes. Teniendo en cuenta segmentar por tipo_agua

Como consecuencia también se actualiza en utentes.exploracaos c_licencia, c_real, c_soli
a partir de utentes.licencias. c_licencia lo hacemos por completar, si sólo actualizamos
las fuentes no sería necesario

Seguramente debería ser un trigger
*/

WITH tmp AS (
    SELECT exploracao, tipo_agua, sum(COALESCE(c_soli, 0)) as con_soli, sum(COALESCE(c_real, 0)) as con_real
    FROM utentes.fontes
    WHERE exploracao > :last_exp_gid
    GROUP BY exploracao, tipo_agua
)
    UPDATE utentes.licencias l SET c_soli_fon = con_soli, c_real_fon = con_real FROM tmp WHERE l.exploracao = tmp.exploracao AND l.tipo_agua = tmp.tipo_agua
;


UPDATE utentes.licencias SET
    c_soli_tot = COALESCE(c_soli_int, 0) + COALESCE(c_soli_fon, 0),
    c_real_tot = COALESCE(c_real_int, 0) + COALESCE(c_real_fon, 0)
WHERE exploracao > :last_exp_gid
;

-- WITH lics AS (SELECT exploracao, sum(COALESCE(c_licencia, 0)) AS c_li, sum(COALESCE(c_soli_tot, 0)) as c_sol_t, sum(COALESCE(c_real_tot, 0)) as c_r_t FROM utentes.licencias GROUP BY exploracao), result AS  (SELECT e.gid, (e.c_licencia - lics.c_li) licenciado, (e.c_soli - lics.c_sol_t) solicitado, (e.c_real - c_r_t) as creal FROM utentes.exploracaos e JOIN lics ON e.gid = lics.exploracao) SELECT * FROM result WHERE licenciado != 0 OR solicitado != 0 OR creal != 0;

WITH tmp AS (
    SELECT exploracao, sum(COALESCE(c_licencia, 0)) AS c_li, sum(COALESCE(c_soli_tot, 0)) as c_sol_t, sum(COALESCE(c_real_tot, 0)) as c_r_t FROM utentes.licencias GROUP BY exploracao
)
UPDATE utentes.exploracaos e SET
    c_licencia = c_li,
    c_soli = c_sol_t,
    c_real = c_r_t
FROM tmp
WHERE
    tmp.exploracao = e.gid
    AND e.gid > :last_exp_gid
;
