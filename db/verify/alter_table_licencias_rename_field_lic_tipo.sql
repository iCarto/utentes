-- Verify utentes:alter_table_licencias_rename_field_lic_tipo on pg

BEGIN;

SELECT 1/ count(*) FROM information_schema.tables WHERE table_name='licencia_tipo_agua';
SELECT tipo_agua FROM utentes.licencias WHERE FALSE;



ROLLBACK;
