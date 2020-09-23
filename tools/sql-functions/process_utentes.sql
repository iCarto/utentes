-- Recordatorio, no se puede usar -c "" con especifidades de psql, es decir no se puede
-- substituir ${LAST_EXP_GID} por :last_exp_gid


-- El group by ya está pensando para que funcione con varias licencias por
-- explotación
INSERT INTO utentes.exploracaos
(exp_id, exp_name, d_soli, pago_lic, observacio, loc_provin, loc_distri, loc_posto, loc_nucleo, loc_endere, loc_unidad, loc_bacia, loc_subaci, loc_rio, the_geom, utente, area, estado_lic, fact_tipo, cadastro_uni)
SELECT
    exp_id, exp_name, d_soli, pago_lice, observacio, loc_prov_1, loc_dist_1, loc_posto2, loc_nucl_1, loc_ende_1, loc_unidad, loc_bacia, loc_subaci, loc_rio, geom
    , (select gid from utentes.utentes u where u.nome = t.nome)
    , ST_Area(geom) / 10000, estado
    , fact_tipo
    , t.cadastro
FROM tmp_utentes t
GROUP BY
exp_id, exp_name, d_soli, pago_lice, observacio, loc_prov_1, loc_dist_1, loc_posto2, loc_nucl_1, loc_ende_1, loc_unidad, loc_bacia, loc_subaci, loc_rio, geom, (select gid from utentes.utentes u where u.nome = t.nome) , ST_Area(geom) / 10000, estado, fact_tipo, cadastro
;



-- Cojo las que tienen tipo, y también aquellas que es obligatorio que lo tengan para que se produzca un error si no lo tienen.
WITH foo AS (
    SELECT exp_id, tipo
    FROM tmp_utentes
    WHERE
        tipo IS NOT NULL
        OR
        estado IN ( SELECT key from domains.licencia_estado WHERE parent IN ('postcampo', 'post-licenciada') )
    GROUP BY exp_id, tipo
)
INSERT INTO utentes.actividades (exploracao, tipo) SELECT (SELECT e.gid FROM utentes.exploracaos e WHERE e.exp_id = foo.exp_id), tipo FROM foo;



WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, habitantes
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Abastecimento'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, habitantes
), ins AS (
    INSERT INTO utentes.actividades_abastecemento (gid, habitantes, dotacao) SELECT actividad, habitantes, 20 FROM tmp
)
UPDATE utentes.actividades actv SET c_estimado = habitantes * 20 * 30 / 1000 FROM tmp WHERE actv.gid = tmp.actividad;


WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, tipo_indus, eval_impac, instalacio
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Indústria'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, tipo_indus, eval_impac, instalacio
)
INSERT INTO utentes.actividades_industria (gid, tipo_indus, eval_impac, instalacio) SELECT actividad, tipo_indus, eval_impac, instalacio FROM tmp;


WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, eval_impac, a.energia_tipo, a.potencia
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Producção de energia'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, eval_impac, a.energia_tipo, a.potencia
)
INSERT INTO utentes.actividades_produccao_energia
    (gid, eval_impac, energia_tipo, potencia)
SELECT actividad, eval_impac, energia_tipo, potencia
FROM tmp;

WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Piscicultura'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao
)
INSERT INTO utentes.actividades_piscicultura
    (gid)
SELECT actividad
FROM tmp;


WITH tmp AS (
   SELECT c.gid as actividad, a.exp_id, c.exploracao
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Pecuária'
   GROUP BY
         c.gid              , a.exp_id, c.exploracao
)
INSERT INTO utentes.actividades_pecuaria (gid) SELECT actividad FROM tmp;


WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, area_pot, area_irri, area_medi
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Agricultura de Regadio'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, area_pot, area_irri, area_medi

)
INSERT INTO utentes.actividades_agricultura_rega (gid, area_pot, area_irri, area_medi) SELECT actividad, area_pot, area_irri, area_medi FROM tmp;

-- Para tmp_cultivos
WITH tmp AS (
    SELECT
        a.enlace,
        c.gid as actividade,
        b.exp_id as exp_id,
        a.cult_id,
        a.cultivo,
        a.rega,
        CASE a.rega WHEN 'Aspersão' THEN 0.76 WHEN 'Gota a gota' THEN 0.85 WHEN 'Gravidade' THEN 0.62 WHEN 'Regional' THEN NULL ELSE NULL END as eficiencia,
        a.area,
        a.observacio,
        a.geom,
        row_number() OVER (PARTITION BY a.enlace)
        FROM tmp_cultivos a JOIN (SELECT exp_id, enlace FROM tmp_utentes GROUP BY exp_id, enlace) u ON a.enlace = u.enlace JOIN utentes.exploracaos b ON u.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
        ORDER BY a.enlace
)
INSERT INTO utentes.actividades_cultivos(actividade, cult_id, c_estimado, cultivo, rega, eficiencia, area, observacio, the_geom)
SELECT
       actividade
       -- , exp_id || '/' || trim(to_char(row_number, '000'))
       , cult_id
       , COALESCE(
           CASE rega
               WHEN 'Regional' THEN area * 10000 / 12
               ELSE (area * 30 * 86400 * 0.21) / (1000 * eficiencia)
           END,
           0
       )
       , cultivo
       , rega
       , eficiencia
       , area
       , observacio
       , geom
FROM tmp;



UPDATE utentes.actividades_agricultura_rega a SET n_cul_tot = (SELECT count(*) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid); -- no editable por usuario
UPDATE utentes.actividades_agricultura_rega a SET area_medi = (SELECT sum(area) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid) WHERE area_medi IS NULL; -- editable, pero tiene sentido sin filtrado extra
WITH tmp AS (
    SELECT sum(c_estimado) c_estimado, actividade FROM utentes.actividades_cultivos GROUP BY actividade
)
UPDATE utentes.actividades a SET c_estimado = tmp.c_estimado FROM tmp WHERE tmp.actividade = a.gid; -- no editable por usuario



UPDATE utentes.exploracaos e SET
    c_estimado = a.c_estimado
    FROM utentes.actividades a
    WHERE e.gid = a.exploracao AND e.gid > :last_exp_gid;




-- Según como enlace esto, por enlace, por exp_id, por todo, hay que ajustar
-- la query de INSERT INTO fontes y la query de utentes_sin_fontes
/*
WITH
    match AS (
        SELECT t.enlace, t.exp_id, t.exp_name
        FROM
            tmp_fontes t
            JOIN
            (SELECT enlace, exp_id, exp_name FROM tmp_utentes GROUP BY enlace, exp_id, exp_name) u
            ON t.enlace = u.enlace AND t.exp_id = u.exp_id AND t.exp_name = u.exp_name
    )
    , contaje1 AS (

        SELECT count(*) FROM match
    )
    , contaje2 AS (
        SELECT count(*) FROM tmp_fontes
    )
SELECT CASE WHEN (SELECT count(*) FROM match) = (SELECT count(*) FROM tmp_fontes) THEN 1 ELSE (SELECT 1)/0 END;
;
*/
-- No deshacer el join con tmp_utentes porque permite filtrar los que se hayan
-- eliminado del excel original
INSERT INTO utentes.fontes
    (cadastro, tipo_agua, tipo_fonte, red_monit, d_dado, bombeo, lat_lon, sist_med, metodo_est, c_max, prof_pozo, diametro, c_real, c_soli,  observacio
    , exploracao)
SELECT
    t.cadastro, t.tipo_agua, t.tipo_fonte, t.red_monit, t.d_dado, t.bombeo, t.lat_lon, t.sist_med, t.metodo_est, t.c_max, t.prof_pozo, t.diametro, t.c_real, t.c_soli,  t.observacio
    , e.gid
    -- , t.enlace
FROM
    tmp_fontes t
    JOIN
    (SELECT enlace, exp_id FROM tmp_utentes GROUP BY enlace, exp_id) u
    ON t.enlace = u.enlace AND t.exp_id = u.exp_id
    -- ON t.exp_id = u.exp_id
    JOIN utentes.exploracaos e ON u.exp_id = e.exp_id;


/*
Calcular para licencias c_soli_int y c_real_int. A partir de los datos
del excel. Sólo se hace cuando no tiene fuentes asociadas. Si tiene fuentes se dejan a
cero.
*/

ALTER TABLE tmp_utentes ADD COLUMN c_real_int numeric(10,2);
ALTER TABLE tmp_utentes ADD COLUMN c_soli_int numeric(10,2);

-- AVISO IMPORTANTE
-- Esta query hay que revisarla a mano
WITH utentes_and_fontes AS (
    SELECT
        u.exp_id
        -- , e.gid as exp_gid
        , f.gid AS tmp_fonte_gid
        , f.tipo_agua as tipo_agua_fonte, f.tipo_fonte, f.d_dado, f.sist_med, f.c_real, f.c_soli, f.lat_lon, f.observacio
        , f.exp_id as fonte_exp_id
        , u.enlace
        , u.estado, u.d_emissao, u.d_validade, u.tipo_lic, u.tipo_agua tipo_agua_utente, u.n_licen_a, u.taxa_fixa, u.taxa_uso, u.pago_mes, u.iva, u.pago_iva, u.consumo_tipo, u.c_licencia, u.tipo_lic as workaround_tipo_lic, u.c_factura as consumo_fact
        , u.c_real AS utente_c_real
        , u.c_soli AS utente_c_soli

    FROM
        tmp_utentes u
        -- FULL OUTER JOIN tmp_utentes u ON t.enlace = u.enlace AND t.exp_id = u.exp_id AND t.exp_name = u.exp_name
        FULL OUTER JOIN tmp_fontes f ON u.exp_id = f.exp_id AND u.tipo_agua = f.tipo_agua
        -- JOIN utentes.exploracaos e ON u.exp_id = e.exp_id
), utentes_sin_fontes AS (
    SELECT
        u.exp_id, u.enlace, u.utente_c_real, u.utente_c_soli, u.tipo_agua_fonte, u.tipo_agua_utente
        -- , u.exp_gid
    FROM utentes_and_fontes u
    WHERE u.tmp_fonte_gid IS NULL
)
UPDATE tmp_utentes t SET
    c_real_int = u.utente_c_real
    , c_soli_int = u.utente_c_soli
FROM utentes_sin_fontes u
WHERE
    t.enlace = u.enlace
    AND t.tipo_agua = u.tipo_agua_utente
;

/* Insertamos en Licencias */

WITH tmp AS (
    SELECT
        exp_id, estado, d_emissao, d_validade, tipo_lic, tipo_agua, n_licen_a, taxa_fixa, taxa_uso, pago_mes, iva, pago_iva, consumo_tipo as consumo_tipo, c_licencia, tipo_lic as workaround_tipo_lic, c_factura as consumo_fact
        , c_real_int
        , c_soli_int
        , row_number() OVER (PARTITION BY exp_id)
    FROM tmp_utentes
    WHERE
       tipo_agua IS NOT NULL
       OR
       estado IN ( SELECT key from domains.licencia_estado WHERE parent IN ('postcampo', 'post-licenciada') )
    ORDER BY exp_id
)
INSERT INTO utentes.licencias (exploracao, lic_nro, tipo_agua, estado, d_emissao, d_validade, c_licencia, iva, taxa_fixa, taxa_uso, pago_mes, pago_iva, n_licen_a, tipo_lic, consumo_tipo, consumo_fact, c_real_int, c_soli_int)
SELECT
    (SELECT gid FROM utentes.exploracaos e WHERE e.exp_id = tmp.exp_id),
    exp_id || '/' || substring(tipo_agua, 0, 4),
    tipo_agua,
    estado,
    d_emissao,
    d_validade,
    c_licencia,
    iva, -- 12.75
    taxa_fixa,
    taxa_uso, -- CASE tipo_agua WHEN 'Subterrânea' THEN 0.6 ELSE NULL END,
    pago_mes,
    pago_iva,
    n_licen_a,
    workaround_tipo_lic, --'Licença',
    consumo_tipo,
    consumo_fact
    , c_real_int
    , c_soli_int
FROM tmp
ORDER BY 1;


UPDATE utentes.licencias SET taxa_fixa = 0 where taxa_fixa is null AND exploracao > :last_exp_gid;
UPDATE utentes.licencias SET taxa_uso = 0 where taxa_uso is null AND exploracao > :last_exp_gid;
UPDATE utentes.actividades SET c_estimado = 0 WHERE c_estimado IS NULL AND exploracao > :last_exp_gid;
UPDATE utentes.exploracaos SET c_estimado = 0 WHERE c_estimado IS NULL AND gid > :last_exp_gid;
