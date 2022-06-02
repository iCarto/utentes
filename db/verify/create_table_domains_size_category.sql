-- Verify utentes:create_table_domains_size_category on pg

BEGIN;

SELECT category, consumo_range,  consumo_tipo, fact_tipo FROM domains.size_category WHERE false;

ROLLBACK;
