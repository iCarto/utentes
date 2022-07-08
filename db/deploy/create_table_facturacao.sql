-- Deploy utentes:create_table_facturacao to pg

BEGIN;

CREATE TABLE domains.facturacao_fact_estado (
    category text not null default 'facturacao_fact_estado',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    app text[]
);
INSERT INTO domains.facturacao_fact_estado (key, ordering) VALUES
       (null, 0),
       ('Pendente Acrescentar Consumo (R. Cad DT)', 1),
       ('Pendente Emisão Factura (D. Fin)', 2),
       ('Pendente Pagamento (Utente)', 3),
       ('Pagada', 4),
       ('Não facturable', 5);



CREATE TABLE domains.facturacao_fact_tipo (
    category text not null default 'facturacao_fact_tipo',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    app text[]
);
INSERT INTO domains.facturacao_fact_tipo (key, ordering) VALUES
       (null, 0),
       ('Mensal', 1),
       ('Trimestral', 2),
       ('Anual', 3);


CREATE TABLE domains.facturacao_consumo_tipo (
    category text not null default 'facturacao_consumo_tipo',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    app text[]
);
INSERT INTO domains.facturacao_consumo_tipo (key, ordering) VALUES
       (null, 0),
       ('Fixo', null),
       ('Variável', null);



ALTER TABLE utentes.exploracaos ADD COLUMN fact_estado TEXT NOT NULL REFERENCES domains.facturacao_fact_estado(key) ON UPDATE CASCADE DEFAULT 'Não facturable';
UPDATE utentes.exploracaos SET fact_estado = 'Pagada' WHERE estado_lic IN ('Licenciada', 'Irregular', 'Utente de facto');
ALTER TABLE utentes.exploracaos ALTER COLUMN fact_estado SET NOT NULL;
ALTER TABLE utentes.exploracaos ADD COLUMN fact_tipo text not null references domains.facturacao_fact_tipo(key) ON UPDATE CASCADE DEFAULT 'Mensal'; -- Mensal/Trimestral/Anual
ALTER TABLE utentes.exploracaos ADD COLUMN pago_lic BOOLEAN NOT NULL DEFAULT false;

ALTER TABLE utentes.licencias ADD COLUMN consumo_tipo TEXT NOT NULL REFERENCES domains.facturacao_consumo_tipo(key) ON UPDATE CASCADE DEFAULT 'Variável'; -- Fixo/Variável,
ALTER TABLE utentes.licencias ADD COLUMN consumo_fact NUMERIC(10, 2);
alter table utentes.licencias ALTER COLUMN iva TYPE NUMERIC(10, 2);
alter table utentes.licencias ALTER COLUMN iva SET DEFAULT 12.75;

CREATE OR REPLACE FUNCTION utentes.calcular_pagos_licencias()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW.pago_mes := NEW.taxa_fixa + (COALESCE(NEW.consumo_fact, 0) * NEW.taxa_uso);
    NEW.pago_iva := NEW.pago_mes * (1 + NEW.iva/100);
    RETURN NEW;
END;
$function$;


CREATE TABLE utentes.facturacao (
       gid SERIAL PRIMARY KEY,
       exploracao int not null references utentes.exploracaos(gid) ON UPDATE CASCADE ON DELETE CASCADE,
       created_at timestamp not null default now(),
       ano text not null default to_char(now(), 'YYYY'),
       mes text not null default to_char(now(), 'MM'),
       observacio jsonb DEFAULT '[{"created_at": null, "autor": null, "text": null, "state": null}]',
       fact_estado text not null references domains.facturacao_fact_estado(key) ON UPDATE CASCADE DEFAULT 'Pendiente introducir consumo',
       fact_tipo text not null references domains.facturacao_fact_tipo(key) ON UPDATE CASCADE DEFAULT 'Mensal', -- Mensal/Trimestral/Anual
       pago_lic boolean,
       pagos boolean,  -- exploracaos.pagos

       c_licencia_sup numeric(10,2),
       c_licencia_sub numeric(10,2),

       consumo_tipo_sup TEXT NOT NULL REFERENCES domains.facturacao_consumo_tipo(key) ON UPDATE CASCADE DEFAULT 'Variável', -- Fixo/Variável,
       consumo_fact_sup numeric(10,2),
       taxa_fixa_sup numeric(10,2),
       taxa_uso_sup numeric(10,2),
       pago_mes_sup numeric(10,2), -- = taxa_fixa_sup + (taxa_uso_sup * consumo_fact_sup)
       pago_iva_sup numeric(10,2), -- = pago_mes_sup * (1 + iva/100)
       iva_sup numeric(10,2),      -- = iva

       consumo_tipo_sub TEXT NOT NULL REFERENCES domains.facturacao_consumo_tipo(key) ON UPDATE CASCADE DEFAULT 'Variável', -- Fixo/Variável,
       consumo_fact_sub numeric(10,2),
       taxa_fixa_sub numeric(10,2),
       taxa_uso_sub numeric(10,2),
       pago_mes_sub numeric(10,2), -- = taxa_fixa_sub + (taxa_uso_sub * consumo_fact_sup)
       pago_iva_sub numeric(10,2), -- = pago_iva_sub  = pago_mes_sub * (1 + iva/100)
       iva_sub numeric(10,2),      -- = iva

       iva numeric(10,2),

       pago_mes numeric(10,2),    -- = pago_mes_sup + pago_mes_sub
       pago_iva numeric(10,2),    -- = pago_iva_sup + pago_iva_sub

       UNIQUE (exploracao, ano, mes)
);

UPDATE utentes.facturacao SET observacio = '[{"created_at": null, "autor": null, "text": null, "state": null}]';

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
         SELECT 'utentes-provincia'::text,
            provincia.key,
            provincia.value,
            provincia.ordering,
            provincia.parent,
            provincia.tooltip,
            NULL::text[]
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
         SELECT 'utentes-distrito'::text,
            distrito.key,
            distrito.value,
            distrito.ordering,
            distrito.parent,
            distrito.tooltip,
            NULL::text[]
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
         SELECT 'utentes-posto'::text,
            posto.key,
            posto.value,
            posto.ordering,
            posto.parent,
            posto.tooltip,
            NULL::text[]
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
            NULL::text[]
           FROM domains.actividade
        UNION
         SELECT animal_tipo.category,
            animal_tipo.key,
            animal_tipo.value,
            animal_tipo.ordering,
            animal_tipo.parent,
            animal_tipo.tooltip,
            NULL::text[]
           FROM domains.animal_tipo
        UNION
         SELECT cultivo_tipo.category,
            cultivo_tipo.key,
            cultivo_tipo.value,
            cultivo_tipo.ordering,
            cultivo_tipo.parent,
            cultivo_tipo.tooltip,
            NULL::text[]
           FROM domains.cultivo_tipo
        UNION
         SELECT energia_tipo.category,
            energia_tipo.key,
            energia_tipo.value,
            energia_tipo.ordering,
            energia_tipo.parent,
            energia_tipo.tooltip,
            NULL::text[]
           FROM domains.energia_tipo
        UNION
         SELECT fonte_tipo.category,
            fonte_tipo.key,
            fonte_tipo.value,
            fonte_tipo.ordering,
            fonte_tipo.parent,
            fonte_tipo.tooltip,
            NULL::text[]
           FROM domains.fonte_tipo
        UNION
         SELECT industria_tipo.category,
            industria_tipo.key,
            industria_tipo.value,
            industria_tipo.ordering,
            industria_tipo.parent,
            industria_tipo.tooltip,
            NULL::text[]
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
            NULL::text[]
           FROM domains.licencia_tipo_agua
        UNION
         SELECT pagamentos.category,
            pagamentos.key,
            pagamentos.value,
            pagamentos.ordering,
            pagamentos.parent,
            pagamentos.tooltip,
            NULL::text[]
           FROM domains.pagamentos
        UNION
         SELECT "boolean".category,
            "boolean".key,
            "boolean".value,
            "boolean".ordering,
            "boolean".parent,
            "boolean".tooltip,
            NULL::text[]
           FROM domains."boolean"
        UNION
         SELECT rega_tipo.category,
            rega_tipo.key,
            rega_tipo.value,
            rega_tipo.ordering,
            rega_tipo.parent,
            rega_tipo.tooltip,
            NULL::text[]
           FROM domains.rega_tipo
        UNION
         SELECT piscicultura_tipo_proc.category,
            piscicultura_tipo_proc.key,
            piscicultura_tipo_proc.value,
            piscicultura_tipo_proc.ordering,
            piscicultura_tipo_proc.parent,
            piscicultura_tipo_proc.tooltip,
            NULL::text[]
           FROM domains.piscicultura_tipo_proc
        UNION
         SELECT piscicultura_gaio_subm.category,
            piscicultura_gaio_subm.key,
            piscicultura_gaio_subm.value,
            piscicultura_gaio_subm.ordering,
            piscicultura_gaio_subm.parent,
            piscicultura_gaio_subm.tooltip,
            NULL::text[]
           FROM domains.piscicultura_gaio_subm
        UNION
         SELECT tanque_piscicola_tipo.category,
            tanque_piscicola_tipo.key,
            tanque_piscicola_tipo.value,
            tanque_piscicola_tipo.ordering,
            tanque_piscicola_tipo.parent,
            tanque_piscicola_tipo.tooltip,
            NULL::text[]
           FROM domains.tanque_piscicola_tipo
        UNION
         SELECT tanque_piscicola_estado.category,
            tanque_piscicola_estado.key,
            tanque_piscicola_estado.value,
            tanque_piscicola_estado.ordering,
            tanque_piscicola_estado.parent,
            tanque_piscicola_estado.tooltip,
            NULL::text[]
           FROM domains.tanque_piscicola_estado
        UNION
         SELECT tanque_piscicola_esp_culti.category,
            tanque_piscicola_esp_culti.key,
            tanque_piscicola_esp_culti.value,
            tanque_piscicola_esp_culti.ordering,
            tanque_piscicola_esp_culti.parent,
            tanque_piscicola_esp_culti.tooltip,
            NULL::text[]
           FROM domains.tanque_piscicola_esp_culti
        UNION
         SELECT tanque_piscicola_tipo_alim.category,
            tanque_piscicola_tipo_alim.key,
            tanque_piscicola_tipo_alim.value,
            tanque_piscicola_tipo_alim.ordering,
            tanque_piscicola_tipo_alim.parent,
            tanque_piscicola_tipo_alim.tooltip,
            NULL::text[]
           FROM domains.tanque_piscicola_tipo_alim
        UNION
         SELECT tanque_piscicola_prov_alev.category,
            tanque_piscicola_prov_alev.key,
            tanque_piscicola_prov_alev.value,
            tanque_piscicola_prov_alev.ordering,
            tanque_piscicola_prov_alev.parent,
            tanque_piscicola_prov_alev.tooltip,
            NULL::text[]
           FROM domains.tanque_piscicola_prov_alev
        UNION
         SELECT tanque_piscicola_fert_agua.category,
            tanque_piscicola_fert_agua.key,
            tanque_piscicola_fert_agua.value,
            tanque_piscicola_fert_agua.ordering,
            tanque_piscicola_fert_agua.parent,
            tanque_piscicola_fert_agua.tooltip,
            NULL::text[]
           FROM domains.tanque_piscicola_fert_agua
        UNION
         SELECT utentes_uten_tipo.category,
            utentes_uten_tipo.key,
            utentes_uten_tipo.value,
            utentes_uten_tipo.ordering,
            utentes_uten_tipo.parent,
            utentes_uten_tipo.tooltip,
            NULL::text[]
           FROM domains.utentes_uten_tipo
        UNION
         SELECT fontes_sist_med.category,
            fontes_sist_med.key,
            fontes_sist_med.value,
            fontes_sist_med.ordering,
            fontes_sist_med.parent,
            fontes_sist_med.tooltip,
            NULL::text[]
           FROM domains.fontes_sist_med
       UNION
       SELECT category, key, value, ordering, parent, tooltip, app FROM domains.licencia_tipo_lic
       UNION
       SELECT category, key, value, ordering, parent, tooltip, NULL::text[] FROM domains.facturacao_consumo_tipo
       UNION
       SELECT category, key, value, ordering, parent, tooltip, NULL::text[] FROM domains.facturacao_fact_tipo
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

COMMIT;
