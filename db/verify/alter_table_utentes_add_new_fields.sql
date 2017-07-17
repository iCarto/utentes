-- Verify utentes:alter_table_utentes_add_new_fields on pg

BEGIN;

SELECT * FROM domains.utentes_uten_tipo WHERE false;

SELECT uten_tipo, uten_gere, uten_memb, uten_mulh, contacto, email, telefone
FROM utentes.utentes
where false;

ROLLBACK;
