-- Deploy utentes:alter_table_quantidade_automatic to pg

BEGIN;

ALTER TABLE inventario.quantidade_agua DROP COLUMN q_extraer;

ALTER TABLE inventario.quantidade_agua ADD COLUMN nivel_agua numeric(10, 2);
ALTER TABLE inventario.quantidade_agua ADD COLUMN prof_campo numeric(10, 2);

UPDATE inventario.quantidade_agua SET
       nivel_agua = 0,
       prof_campo = 0;

ALTER TABLE inventario.quantidade_agua ALTER COLUMN nivel_agua SET NOT NULL;
ALTER TABLE inventario.quantidade_agua ALTER COLUMN prof_campo SET NOT NULL;

CREATE OR REPLACE FUNCTION inventario.calcular_quan_agua() RETURNS trigger AS $$
BEGIN
    NEW.quan_agua = GREATEST(NEW.prof_campo - NEW.nivel_agua, 0);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_quan_agua
    BEFORE INSERT OR UPDATE ON inventario.quantidade_agua
    FOR EACH ROW
    EXECUTE PROCEDURE inventario.calcular_quan_agua();


COMMIT;
