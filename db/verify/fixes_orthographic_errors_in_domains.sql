-- Verify utentes:fixes_orthographic_errors_in_domains on pg

BEGIN;

SELECT 1/count(*) FROM domains.domains WHERE key = 'Rio';
SELECT 1/count(*) FROM domains.bacia WHERE key = 'Umbeluzi';
SELECT 1/count(*) FROM domains.bacia WHERE key = 'Futi';
SELECT 1/count(*) FROM domains.posto WHERE key = 'Canicado';
SELECT 1/count(*) FROM domains.posto WHERE key = 'Manhiça';
SELECT 1/count(*) FROM domains.distrito WHERE key = 'Guijá';
SELECT 1/count(*) FROM domains.posto WHERE key = 'Chokwé';
SELECT 1/count(*) FROM domains.domains WHERE key = 'Aspersão';

ROLLBACK;
