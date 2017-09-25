-- Verify utentes:alter_table_reses_change_type_c_res on pg

BEGIN;

select 1/count(*) from information_schema.columns where table_schema='utentes' and table_name = 'actividades_reses' and column_name = 'c_res' and data_type='numeric';

ROLLBACK;
