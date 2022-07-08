-- Verify utentes:update_table_domains_licencia_estado_set_parent on pg

BEGIN;

select 1/count(*) from domains.licencia_estado where parent = 'precampo';
select 1/count(*) from domains.licencia_estado where parent = 'postcampo';

ROLLBACK;
