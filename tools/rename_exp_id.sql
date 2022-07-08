Esta no es una query para ser ejecutado directamente. Se proporciona a modo de ejemplo.



WITH
    ordered_exps AS (
        SELECT gid, exp_id, exp_name, row_number() OVER (ORDER BY exp_id asc)
        FROM utentes.exploracaos
        WHERE
            estado_lic = 'Utente de facto'
            AND exp_id like '%9999/UF' ORDER BY exp_id
    )
    , new_partial_codes AS (
        SELECT
            gid
            , exp_id
            , exp_name
            , -- CASE
              --   WHEN exp_name != 'Tete Ferry Sun, SA' THEN
              --       to_char(row_number + 1, 'FM000')
              --   ELSE
                    to_char(row_number, 'FM000')
              -- END AS to_char
        FROM ordered_exps
    )
    , new_codes AS (
        SELECT gid, to_char || substring(exp_id , 4) AS new_expid
        FROM new_partial_codes
    )
    , new_cult_codes AS (
        SELECT
            a.gid AS actividade
           , a.exploracao
           , b.gid AS cultivo
           , b.cult_id
           , substring(b.cult_id, 18, 3) AS partial_code
           , new_codes.new_expid || substring(b.cult_id, 17, 4) new_cult_id
        FROM
           utentes.actividades a
           JOIN utentes.actividades_cultivos b ON a.gid = b.actividade
           JOIN new_codes ON new_codes.gid = a.exploracao
    )
    , new_tanque_codes AS (
        SELECT
            a.gid AS actividade
           , a.exploracao
           , b.gid AS tanque
           , b.tanque_id
           , substring(b.tanque_id, 18, 3) AS partial_code
           , new_codes.new_expid || substring(b.tanque_id, 17, 4) new_tanque_id
        FROM
           utentes.actividades a
           JOIN utentes.actividades_tanques_piscicolas b ON a.gid = b.actividade
           JOIN new_codes ON new_codes.gid = a.exploracao
    )
    , update_exps AS (
        UPDATE utentes.exploracaos e
        SET exp_id = new_expid
        FROM new_codes
        WHERE new_codes.gid = e.gid
    )
    , update_cults AS (
        UPDATE utentes.actividades_cultivos a
        SET cult_id = new_cult_id
        FROM new_cult_codes
        WHERE new_cult_codes.cultivo = a.gid
    )
    , update_tanques AS (
        UPDATE utentes.actividades_tanques_piscicolas a
        SET tanque_id = new_tanque_id
        FROM new_tanque_codes
        WHERE new_tanque_codes.tanque = a.gid
    )
UPDATE utentes.licencias l
SET lic_nro = new_codes.new_expid || '/' || substring(tipo_agua, 1, 3)
FROM new_codes
WHERE new_codes.gid = l.exploracao;
