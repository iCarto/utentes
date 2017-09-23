-- Revert utentes:fixes_orthographic_errors_in_domains from pg

BEGIN;

UPDATE domains.fonte_tipo SET key = 'Río' WHERE key = 'Rio';

UPDATE domains.bacia SET key = 'Umbelézi' WHERE key = 'Umbeluzi';
UPDATE domains.subacia SET parent = 'Umbelézi' WHERE parent = 'Umbeluzi';

UPDATE domains.bacia SET key = 'Fúti' WHERE key = 'Futi';
UPDATE domains.subacia SET parent = 'Fúti' WHERE parent = 'Futi';

UPDATE domains.posto set key = 'Caniçado' WHERE key = 'Canicado';

UPDATE domains.posto set key = 'Manhiãa' WHERE Key = 'Manhiça';


INSERT INTO domains.distrito (category, key, parent, app) VALUES ('distrito', 'Guija', 'Gaza', '{Sul}');
UPDATE domains.posto SET parent = 'Guija' WHERE parent = 'Guijá';
DELETE FROM domains.distrito WHERE key = 'Guijá';


INSERT INTO domains.distrito (category, key, parent, app) VALUES ('distrito', 'Chokwe', 'Gaza', '{Sul}');
UPDATE domains.posto SET parent = 'Chokwe' WHERE parent = 'Chokwé';
delete from domains.distrito where key = 'Chokwé';

update domains.posto set key = 'Chokwe' WHERE key = 'Chokwé';

UPDATE domains.rega_tipo SET key = 'Asperção' WHERE key = 'Aspersão';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
