-- Verify utentes:alter_table_licencias_add_field_tipo_lic on pg

BEGIN;

SELECT tipo_lic FROM utentes.licencias WHERE false;

SELECT 1/ count(*) FROM information_schema.tables WHERE table_name='licencia_tipo_lic';

ROLLBACK;
