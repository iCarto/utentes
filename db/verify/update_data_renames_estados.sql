-- Verify utentes:update_data_renames_estados on pg

BEGIN;

SELECT 1/COUNT(*) FROM domains.licencia_estado where key like '%DA%';
SELECT 1/COUNT(*) FROM domains.licencia_estado where key like '%DJ%';
SELECT 1/COUNT(*) FROM domains.licencia_estado where key like '%DT%';
SELECT 1/COUNT(*) FROM domains.licencia_estado where key like '%DF%';

ROLLBACK;
