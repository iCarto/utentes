-- Revert utentes:aras_unification_reassing_groups from pg

BEGIN;

INSERT INTO domains.groups (key, ordering) VALUES (NULL, 0);


UPDATE
    domains.groups
SET
    key = 'Departamento Administrativo'
    , value =  'DA'
    , ordering = 2
WHERE
    key = 'Departamento de Administração e Recursos Humanos'
;


UPDATE
    domains.groups
SET
    key = 'Departamento Financeiro'
    , value = 'DF'
    , ordering = 4
WHERE
    key = 'Departamento Serviços Utente - Financeiro'
;


UPDATE
    domains.groups
SET
    key = 'Departamento Jurídico'
    , value = 'DJ'
    , ordering = 5
WHERE
    key = 'Departamento Serviços Utente - Jurídico'
;


UPDATE
    domains.groups
SET
    key = 'Departamento Técnico'
    , value = 'DT'
    , ordering = 6
WHERE
    key = 'Departamento Recursos Hídricos'
;


UPDATE
    domains.groups
SET
    key = 'Unidade ou Delegação'
    , ordering = 8
WHERE
    key = 'Divisão'
;


DROP MATERIALIZED VIEW domains.domains;
CREATE MATERIALIZED VIEW domains.domains AS
WITH tmp_query AS (
         SELECT provincia.category,
            provincia.key,
            provincia.value,
            provincia.ordering,
            provincia.parent,
            provincia.tooltip,
            provincia.app
           FROM domains.provincia
          WHERE provincia.key IS NULL OR provincia.app IS NOT NULL
        UNION
         SELECT 'utentes-provincia'::text AS text,
            provincia.key,
            provincia.value,
            provincia.ordering,
            provincia.parent,
            provincia.tooltip,
            NULL::text[] AS text
           FROM domains.provincia
        UNION
         SELECT distrito.category,
            distrito.key,
            distrito.value,
            distrito.ordering,
            distrito.parent,
            distrito.tooltip,
            distrito.app
           FROM domains.distrito
          WHERE distrito.app IS NOT NULL
        UNION
         SELECT 'utentes-distrito'::text AS text,
            distrito.key,
            distrito.value,
            distrito.ordering,
            distrito.parent,
            distrito.tooltip,
            NULL::text[] AS text
           FROM domains.distrito
        UNION
         SELECT posto.category,
            posto.key,
            posto.value,
            posto.ordering,
            posto.parent,
            posto.tooltip,
            posto.app
           FROM domains.posto
          WHERE posto.app IS NOT NULL
        UNION
         SELECT 'utentes-posto'::text AS text,
            posto.key,
            posto.value,
            posto.ordering,
            posto.parent,
            posto.tooltip,
            NULL::text[] AS text
           FROM domains.posto
        UNION
         SELECT unidade.category,
            unidade.key,
            unidade.value,
            unidade.ordering,
            unidade.parent,
            unidade.tooltip,
            unidade.app
           FROM domains.unidade
        UNION
         SELECT bacia.category,
            bacia.key,
            bacia.value,
            bacia.ordering,
            bacia.parent,
            bacia.tooltip,
            bacia.app
           FROM domains.bacia
        UNION
         SELECT subacia.category,
            subacia.key,
            subacia.value,
            subacia.ordering,
            subacia.parent,
            subacia.tooltip,
            subacia.app
           FROM domains.subacia
        UNION
         SELECT actividade.category,
            actividade.key,
            actividade.value,
            actividade.ordering,
            actividade.parent,
            actividade.tooltip,
            NULL::text[] AS text
           FROM domains.actividade
        UNION
         SELECT animal_tipo.category,
            animal_tipo.key,
            animal_tipo.value,
            animal_tipo.ordering,
            animal_tipo.parent,
            animal_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.animal_tipo
        UNION
         SELECT cultivo_tipo.category,
            cultivo_tipo.key,
            cultivo_tipo.value,
            cultivo_tipo.ordering,
            cultivo_tipo.parent,
            cultivo_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.cultivo_tipo
        UNION
         SELECT energia_tipo.category,
            energia_tipo.key,
            energia_tipo.value,
            energia_tipo.ordering,
            energia_tipo.parent,
            energia_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.energia_tipo
        UNION
         SELECT fonte_tipo.category,
            fonte_tipo.key,
            fonte_tipo.value,
            fonte_tipo.ordering,
            fonte_tipo.parent,
            fonte_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.fonte_tipo
        UNION
         SELECT industria_tipo.category,
            industria_tipo.key,
            industria_tipo.value,
            industria_tipo.ordering,
            industria_tipo.parent,
            industria_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.industria_tipo
        UNION
         SELECT licencia_estado.category,
            licencia_estado.key,
            licencia_estado.value,
            licencia_estado.ordering,
            licencia_estado.parent,
            licencia_estado.tooltip,
            licencia_estado.app
           FROM domains.licencia_estado
        UNION
         SELECT licencia_tipo_agua.category,
            licencia_tipo_agua.key,
            licencia_tipo_agua.value,
            licencia_tipo_agua.ordering,
            licencia_tipo_agua.parent,
            licencia_tipo_agua.tooltip,
            NULL::text[] AS text
           FROM domains.licencia_tipo_agua
        UNION
         SELECT pagamentos.category,
            pagamentos.key,
            pagamentos.value,
            pagamentos.ordering,
            pagamentos.parent,
            pagamentos.tooltip,
            NULL::text[] AS text
           FROM domains.pagamentos
        UNION
         SELECT "boolean".category,
            "boolean".key,
            "boolean".value,
            "boolean".ordering,
            "boolean".parent,
            "boolean".tooltip,
            NULL::text[] AS text
           FROM domains."boolean"
        UNION
         SELECT rega_tipo.category,
            rega_tipo.key,
            rega_tipo.value,
            rega_tipo.ordering,
            rega_tipo.parent,
            rega_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.rega_tipo
        UNION
         SELECT piscicultura_tipo_proc.category,
            piscicultura_tipo_proc.key,
            piscicultura_tipo_proc.value,
            piscicultura_tipo_proc.ordering,
            piscicultura_tipo_proc.parent,
            piscicultura_tipo_proc.tooltip,
            NULL::text[] AS text
           FROM domains.piscicultura_tipo_proc
        UNION
         SELECT piscicultura_gaio_subm.category,
            piscicultura_gaio_subm.key,
            piscicultura_gaio_subm.value,
            piscicultura_gaio_subm.ordering,
            piscicultura_gaio_subm.parent,
            piscicultura_gaio_subm.tooltip,
            NULL::text[] AS text
           FROM domains.piscicultura_gaio_subm
        UNION
         SELECT tanque_piscicola_tipo.category,
            tanque_piscicola_tipo.key,
            tanque_piscicola_tipo.value,
            tanque_piscicola_tipo.ordering,
            tanque_piscicola_tipo.parent,
            tanque_piscicola_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.tanque_piscicola_tipo
        UNION
         SELECT tanque_piscicola_estado.category,
            tanque_piscicola_estado.key,
            tanque_piscicola_estado.value,
            tanque_piscicola_estado.ordering,
            tanque_piscicola_estado.parent,
            tanque_piscicola_estado.tooltip,
            NULL::text[] AS text
           FROM domains.tanque_piscicola_estado
        UNION
         SELECT tanque_piscicola_esp_culti.category,
            tanque_piscicola_esp_culti.key,
            tanque_piscicola_esp_culti.value,
            tanque_piscicola_esp_culti.ordering,
            tanque_piscicola_esp_culti.parent,
            tanque_piscicola_esp_culti.tooltip,
            NULL::text[] AS text
           FROM domains.tanque_piscicola_esp_culti
        UNION
         SELECT tanque_piscicola_tipo_alim.category,
            tanque_piscicola_tipo_alim.key,
            tanque_piscicola_tipo_alim.value,
            tanque_piscicola_tipo_alim.ordering,
            tanque_piscicola_tipo_alim.parent,
            tanque_piscicola_tipo_alim.tooltip,
            NULL::text[] AS text
           FROM domains.tanque_piscicola_tipo_alim
        UNION
         SELECT tanque_piscicola_prov_alev.category,
            tanque_piscicola_prov_alev.key,
            tanque_piscicola_prov_alev.value,
            tanque_piscicola_prov_alev.ordering,
            tanque_piscicola_prov_alev.parent,
            tanque_piscicola_prov_alev.tooltip,
            NULL::text[] AS text
           FROM domains.tanque_piscicola_prov_alev
        UNION
         SELECT tanque_piscicola_fert_agua.category,
            tanque_piscicola_fert_agua.key,
            tanque_piscicola_fert_agua.value,
            tanque_piscicola_fert_agua.ordering,
            tanque_piscicola_fert_agua.parent,
            tanque_piscicola_fert_agua.tooltip,
            NULL::text[] AS text
           FROM domains.tanque_piscicola_fert_agua
        UNION
         SELECT utentes_uten_tipo.category,
            utentes_uten_tipo.key,
            utentes_uten_tipo.value,
            utentes_uten_tipo.ordering,
            utentes_uten_tipo.parent,
            utentes_uten_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.utentes_uten_tipo
        UNION
         SELECT fontes_sist_med.category,
            fontes_sist_med.key,
            fontes_sist_med.value,
            fontes_sist_med.ordering,
            fontes_sist_med.parent,
            fontes_sist_med.tooltip,
            NULL::text[] AS text
           FROM domains.fontes_sist_med
        UNION
         SELECT actividades_piscicultura_tipo_aqua.category,
            actividades_piscicultura_tipo_aqua.key,
            actividades_piscicultura_tipo_aqua.value,
            actividades_piscicultura_tipo_aqua.ordering,
            actividades_piscicultura_tipo_aqua.parent,
            actividades_piscicultura_tipo_aqua.tooltip,
            NULL::text[] AS text
           FROM domains.actividades_piscicultura_tipo_aqua
        UNION
         SELECT fontes_disp_a.category,
            fontes_disp_a.key,
            fontes_disp_a.value,
            fontes_disp_a.ordering,
            fontes_disp_a.parent,
            fontes_disp_a.tooltip,
            NULL::text[] AS text
           FROM domains.fontes_disp_a
        UNION
         SELECT licencia_tipo_lic.category,
            licencia_tipo_lic.key,
            licencia_tipo_lic.value,
            licencia_tipo_lic.ordering,
            licencia_tipo_lic.parent,
            licencia_tipo_lic.tooltip,
            licencia_tipo_lic.app
           FROM domains.licencia_tipo_lic
        UNION
         SELECT facturacao_consumo_tipo.category,
            facturacao_consumo_tipo.key,
            facturacao_consumo_tipo.value,
            facturacao_consumo_tipo.ordering,
            facturacao_consumo_tipo.parent,
            facturacao_consumo_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.facturacao_consumo_tipo
        UNION
         SELECT facturacao_fact_tipo.category,
            facturacao_fact_tipo.key,
            facturacao_fact_tipo.value,
            facturacao_fact_tipo.ordering,
            facturacao_fact_tipo.parent,
            facturacao_fact_tipo.tooltip,
            NULL::text[] AS text
           FROM domains.facturacao_fact_tipo
        UNION
         SELECT licencia_estado_renovacao.category,
            licencia_estado_renovacao.key,
            licencia_estado_renovacao.value,
            licencia_estado_renovacao.ordering,
            licencia_estado_renovacao.parent,
            licencia_estado_renovacao.tooltip,
            NULL::text[] AS text
           FROM domains.licencia_estado_renovacao
        UNION
         SELECT red_monit.category,
            red_monit.key,
            red_monit.value,
            red_monit.ordering,
            red_monit.parent,
            red_monit.tooltip,
            NULL::text[] AS text
           FROM domains.red_monit
        UNION
         SELECT sexo.category,
            sexo.key,
            sexo.value,
            sexo.ordering,
            sexo.parent,
            sexo.tooltip,
            NULL::text[] AS text
           FROM domains.sexo
        )
 SELECT tmp_query.category,
    tmp_query.key,
    tmp_query.value,
    tmp_query.ordering,
    tmp_query.parent,
    tmp_query.tooltip
   FROM tmp_query
  WHERE tmp_query.app IS NULL OR ((( SELECT ara.key
           FROM domains.ara
         LIMIT 1)) = ANY (tmp_query.app));


REFRESH MATERIALIZED VIEW domains.domains;


COMMIT;
