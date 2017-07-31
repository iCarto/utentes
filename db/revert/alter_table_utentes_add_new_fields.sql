-- Revert utentes:alter_table_utentes_add_new_fields from pg

BEGIN;


-- uncomment this line if reverting during development
ALTER TABLE utentes.utentes ADD COLUMN entidade;
UPDATE utentes.utentes SET entidade = uten_tipo;

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
