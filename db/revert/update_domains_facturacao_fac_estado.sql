-- Revert utentes:update_domains_facturacao_fac_estado.sql from pg

BEGIN;

update domains.facturacao_fact_estado set key = 'Pendente Acrescentar Consumo (R. Cad DT)' where key = 'Pendente Acrescentar Consumo (DT)';
update domains.facturacao_fact_estado set key = 'Pendente Emisão Factura (D. Fin)' where key = 'Pendente Emisão Factura (DF)';
update domains.facturacao_fact_estado set key = 'Pendente Pagamento (Utente)' where key = 'Pendente Pagamento (DF)';

COMMIT;
