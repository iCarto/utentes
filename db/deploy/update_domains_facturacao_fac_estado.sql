-- Deploy utentes:update_domains_facturacao_fac_estado.sql to pg

BEGIN;

update domains.facturacao_fact_estado set key = 'Pendente Acrescentar Consumo (DT)' where key = 'Pendente Acrescentar Consumo (R. Cad DT)';
update domains.facturacao_fact_estado set key = 'Pendente Emisão Factura (DF)' where key = 'Pendente Emisão Factura (D. Fin)';
update domains.facturacao_fact_estado set key = 'Pendente Pagamento (DF)' where key = 'Pendente Pagamento (Utente)';

COMMIT;
