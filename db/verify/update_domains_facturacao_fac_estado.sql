-- Verify utentes:update_domains_facturacao_fac_estado.sql on pg

BEGIN;

SELECT 1/count(*) FROM domains.facturacao_fact_estado WHERE key = 'Pendente Acrescentar Consumo (DT)';
SELECT 1/count(*) FROM domains.facturacao_fact_estado WHERE key = 'Pendente Emisão Factura (DF)';
SELECT 1/count(*) FROM domains.facturacao_fact_estado WHERE key = 'Pendente Pagamento (DF)';

ROLLBACK;
