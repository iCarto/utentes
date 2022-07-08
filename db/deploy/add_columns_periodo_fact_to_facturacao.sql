-- Deploy utentes:add_column_periodo_fact_to_facturacao to pg

BEGIN;

ALTER TABLE utentes.facturacao ADD COLUMN periodo_fact DATERANGE;


WITH
    foo as (
        SELECT gid, to_date(ano || mes || '01', 'YYYYMMDD') as d, ano , mes, fact_tipo, CASE fact_tipo WHEN 'Trimestral' THEN '3 months'::interval WHEN 'Mensal' THEN '1 month'::interval WHEN 'Anual' THEN '1 year'::interval END as period FROM utentes.facturacao
    ), bar as (
       SELECT *, (d - period)::date as startperiod, (d - '1 day'::interval)::date as endperiod FROM foo
    ), to_update AS (
       SELECT *, daterange(startperiod, endperiod, '[]') as the_range FROM bar ORDER BY ano, mes, fact_tipo
    )
UPDATE utentes.facturacao f SET periodo_fact = the_range FROM to_update WHERE f.gid = to_update.gid
;


ALTER TABLE utentes.facturacao ALTER COLUMN periodo_fact SET NOT NULL;


-- ALTER TABLE utentes.facturacao ADD COLUMN periodo_fact_real DATERANGE;
-- UPDATE utentes.facturacao SET periodo_fact_real = periodo_fact;
-- ALTER TABLE utentes.facturacao ALTER COLUMN periodo_fact_real SET NOT NULL;


COMMIT;
