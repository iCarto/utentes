-- Revert utentes:drop_constraints_for_testing from pg

BEGIN;


alter table utentes.actividades_cultivos ALTER COLUMN the_geom SET NOT NULL;
COMMIT;
