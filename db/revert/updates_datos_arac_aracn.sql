-- Revert utentes:updates_datos_arac_aracn from pg

BEGIN;

DELETE FROM domains.datos_aras WHERE id IN ('ARAC', 'ARACN');

COMMIT;
