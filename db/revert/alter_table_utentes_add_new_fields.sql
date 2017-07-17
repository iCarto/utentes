-- Revert utentes:alter_table_utentes_add_new_fields from pg

BEGIN;


ALTER TABLE utentes.utentes
DROP COLUMN uten_tipo,
DROP COLUMN uten_gere,
DROP COLUMN uten_memb,
DROP COLUMN uten_mulh,
DROP COLUMN contacto,
DROP COLUMN email,
DROP COLUMN telefone;

DROP TABLE domains.utentes_uten_tipo;

COMMIT;
