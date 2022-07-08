-- Deploy utentes:fixes_orthographic_errors_in_domains to pg

BEGIN;

-- Algunos de estos cambios, sobre todo los que tienen una relación key, parent
-- funcionan porque en este momento no tenemos datos. Si los tuviéramos esto no
-- funcionará por las claves fk

UPDATE domains.fonte_tipo SET key = 'Rio' WHERE key = 'Río';


UPDATE domains.bacia SET key = 'Umbeluzi' WHERE key = 'Umbelézi';
UPDATE domains.subacia SET parent = 'Umbeluzi' WHERE parent = 'Umbelézi';

UPDATE domains.bacia SET key = 'Futi' WHERE key='Fúti';
UPDATE domains.subacia SET parent = 'Futi' WHERE parent = 'Fúti';

UPDATE domains.posto set key = 'Canicado' WHERE key = 'Caniçado';

UPDATE domains.posto set key = 'Manhiça' WHERE Key = 'Manhiãa';


INSERT INTO domains.distrito (category, key, parent, app) VALUES ('distrito', 'Guijá', 'Gaza', '{Sul}');
UPDATE domains.posto SET parent = 'Guijá' WHERE parent = 'Guija';
DELETE FROM domains.distrito WHERE key = 'Guija';


INSERT INTO domains.distrito (category, key, parent, app) VALUES ('distrito', 'Chokwé', 'Gaza', '{Sul}');
UPDATE domains.posto SET parent = 'Chokwé' WHERE parent = 'Chokwe';
delete from domains.distrito where key = 'Chokwe';
update domains.posto set key = 'Chokwé' WHERE key = 'Chokwe';

UPDATE domains.rega_tipo SET key = 'Aspersão' WHERE key = 'Asperção';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
