-- Deploy utentes:drop_constraints_for_testing to pg

BEGIN;

alter table utentes.actividades_cultivos ALTER COLUMN the_geom DROP NOT NULL;

COMMIT;
