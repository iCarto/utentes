-- Verify utentes:move_datos_ara_table_from_utentes_squema_to_domains_squema on pg

BEGIN;

SELECT * FROM domains.datos_aras WHERE false;

ROLLBACK;
