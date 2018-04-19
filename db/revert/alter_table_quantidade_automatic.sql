-- Revert utentes:alter_table_quantidade_automatic from pg

BEGIN;

ALTER TABLE inventario.quantidade_agua ADD COLUMN q_extraer numeric(10,2);
ALTER TABLE inventario.quantidade_agua DROP COLUMN nivel_agua;
ALTER TABLE inventario.quantidade_agua DROP COLUMN prof_campo;


DROP TRIGGER calcular_quan_agua ON inventario.quantidade_agua;
DROP FUNCTION inventario.calcular_quan_agua();

COMMIT;
