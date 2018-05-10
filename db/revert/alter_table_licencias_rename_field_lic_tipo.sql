-- Revert utentes:alter_table_licencias_rename_field_lic_tipo from pg

BEGIN;

ALTER TABLE domains.licencia_tipo_agua RENAME TO licencia_tipo;
UPDATE domains.licencia_tipo SET category='licencia_tipo';
ALTER TABLE domains.licencia_tipo RENAME CONSTRAINT licencia_tipo_agua_key_key TO licencia_tipo_key_key;

ALTER TABLE utentes.licencias RENAME COLUMN tipo_agua TO lic_tipo;

ALTER TABLE utentes.licencias DROP CONSTRAINT IF EXISTS licencias_tipo_agua_fkey;

ALTER TABLE utentes.licencias
   ADD CONSTRAINT licencias_lic_tipo_fkey
   FOREIGN KEY (lic_tipo)
   REFERENCES domains.licencia_tipo(key) ON UPDATE CASCADE;

COMMIT;
