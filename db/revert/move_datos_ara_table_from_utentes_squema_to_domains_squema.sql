-- Revert utentes:move_datos_ara_table_from_utentes_squema_to_domains_squema from pg

BEGIN;

ALTER TABLE domains.datos_aras SET SCHEMA utentes;

COMMIT;
