-- Deploy utentes:revebue_water_allocation_integration to pg

BEGIN;


CREATE ROLE integrations_role WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT NOLOGIN NOREPLICATION;
GRANT USAGE ON SCHEMA public TO integrations_role;
GRANT SELECT ON public.spatial_ref_sys TO integrations_role;

CREATE SCHEMA integrations AUTHORIZATION :"owner";
REVOKE ALL ON SCHEMA integrations from PUBLIC;
GRANT USAGE ON SCHEMA integrations TO integrations_role;


CREATE USER revubue WITH
       NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION NOBYPASSRLS
       INHERIT
       LOGIN
       PASSWORD NULL
       CONNECTION LIMIT 1
       IN ROLE integrations_role
;

CREATE OR REPLACE VIEW integrations.water_allocation_revubue AS

        SELECT
            u.nome as nome_utente
            , u.uten_tipo as tipo_utente
            , e.exp_id as numero_exploracao
            , e.exp_name as nome_exploracao
            , (utentes.exp_id_part(e.exp_id)).year as ano
            , e.loc_provin as provincia
            , e.loc_distri as distrito
            , e.loc_posto as posto
            , e.loc_nucleo as bairro
            , e.loc_divisao as divisao
            , e.loc_bacia as bacia
            , e.loc_subaci as subacia
            , a.tipo as actividade

            , CASE WHEN (sub.tipo_agua IS NOT NULL) AND (sup.tipo_agua IS NOT NULL) THEN 'Ambas' ELSE COALESCE(sub.tipo_agua, sup.tipo_agua) END as tipo_agua

            , sub.lic_nro as numero_licenca_sub
            , sub.estado as estado_licenca_sub
            , sub.c_real_tot as consumo_real_sub
            , sub.c_licencia as consumo_licenciado_sub
            , sub.consumo_tipo as tipo_consumo_sub

            , sup.lic_nro as numero_licenca_sup
            , sup.estado as estado_licenca_sup
            , sup.c_real_tot as consumo_real_sup
            , sup.c_licencia as consumo_licenciado_sup
            , sup.consumo_tipo as tipo_consumo_sup

            , ST_Y(ST_Transform(ST_Centroid(e.the_geom), 4326)) as latitute
            , ST_X(ST_Transform(ST_Centroid(e.the_geom), 4326)) as longitude

        FROM utentes.exploracaos e
        JOIN utentes.utentes u ON e.utente = u.gid
        JOIN utentes.actividades a ON e.gid = a.exploracao
        LEFT JOIN (
             SELECT lic_nro, tipo_agua, estado, c_licencia, c_real_tot, consumo_tipo, exploracao FROM utentes.licencias WHERE tipo_agua = 'Subterrânea'
        ) as sub ON e.gid = sub.exploracao
        LEFT JOIN (
             SELECT lic_nro, tipo_agua, estado, c_licencia, c_real_tot, consumo_tipo, exploracao FROM utentes.licencias WHERE tipo_agua = 'Superficial'
        ) as sup ON e.gid = sup.exploracao

        WHERE
            e.estado_lic IN ('Licenciada', 'Utente de facto', 'Utente de usos comuns')
            AND
            (
                e.loc_subaci = 'Revubué'
                OR
                e.loc_posto IN ('Domue', 'Furancungo', 'Kambulatsitsi', 'Kazula', 'Moatize', 'Ntengo-Wambalame', 'Tsangano', 'Ulongoé', 'Zobue')
            )

;

GRANT SELECT ON integrations.water_allocation_revubue TO revubue;

COMMIT;
