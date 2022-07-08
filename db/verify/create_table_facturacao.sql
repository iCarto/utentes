-- Verify utentes:create_table_facturacao on pg

BEGIN;

SELECT category, key, value, ordering, parent, tooltip, app FROM domains.facturacao_fact_estado WHERE false;
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.facturacao_fact_tipo WHERE false;
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.facturacao_consumo_tipo WHERE false;

SELECT fact_estado, fact_tipo, pago_lic FROM utentes.exploracaos WHERE false;
SELECT consumo_tipo, consumo_fact FROM utentes.licencias WHERE false;

SELECT * from utentes.facturacao;

ROLLBACK;
