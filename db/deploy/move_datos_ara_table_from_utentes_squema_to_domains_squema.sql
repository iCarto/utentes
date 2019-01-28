-- Deploy utentes:move_datos_ara_table_from_utentes_squema_to_domains_squema to pg

BEGIN;

ALTER TABLE utentes.datos_aras SET SCHEMA domains;

COMMIT;
