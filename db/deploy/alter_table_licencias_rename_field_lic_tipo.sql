-- Deploy utentes:alter_table_licencias_rename_field_lic_tipo to pg

BEGIN;

ALTER TABLE domains.licencia_tipo RENAME TO licencia_tipo_agua;
UPDATE domains.licencia_tipo_agua SET category='licencia_tipo_agua';
ALTER TABLE domains.licencia_tipo_agua RENAME CONSTRAINT licencia_tipo_key_key TO licencia_tipo_agua_key_key;

ALTER TABLE utentes.licencias RENAME COLUMN lic_tipo TO tipo_agua;

ALTER TABLE utentes.licencias DROP CONSTRAINT IF EXISTS licencias_lic_tipo_fkey;

ALTER TABLE utentes.licencias
   ADD CONSTRAINT licencias_tipo_agua_fkey
   FOREIGN KEY (tipo_agua)
   REFERENCES domains.licencia_tipo_agua(key) ON UPDATE CASCADE;

COMMIT;
