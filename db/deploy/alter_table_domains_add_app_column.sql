-- Deploy utentes:alter_table_domains_licencia_estado_add_app to pg

BEGIN;

ALTER TABLE domains.licencia_estado ADD COLUMN app TEXT[];
UPDATE domains.licencia_estado SET app = ARRAY['Norte', 'Sul'] WHERE key IS NOT NULL;
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES
('licencia_estado', 'Desconhecido', NULL, 1, NULL, NULL, ARRAY['DPMAIP']);

ALTER TABLE domains.provincia ADD COLUMN app TEXT[];
update domains.provincia set app = string_to_array(ara, ';');
ALTER TABLE domains.provincia DROP COLUMN ara;
DELETE FROM domains.provincia WHERE key is null;
INSERT INTO domains.provincia (category, key, ordering) VALUES ('provincia', NULL, 0);
UPDATE domains.provincia SET app = array_append(app, 'DPMAIP') where key = 'Cabo Delgado';
UPDATE domains.provincia SET parent = null;


ALTER TABLE domains.distrito ADD COLUMN app TEXT[];
update domains.distrito set app = string_to_array(ara, ';');
ALTER TABLE domains.distrito DROP COLUMN ara CASCADE;
update domains.distrito set app = array_append(app, 'DPMAIP') where parent = 'Cabo Delgado';


ALTER TABLE domains.posto ADD COLUMN app TEXT[];
update domains.posto set app = string_to_array(ara, ';');
ALTER TABLE domains.posto DROP COLUMN ara;
update domains.posto set app = array_append(app, 'DPMAIP') where parent IN ( select key from domains.distrito where parent = 'Cabo Delgado' );


ALTER TABLE domains.bacia ADD COLUMN app TEXT[];
update domains.bacia set app = string_to_array(ara, ';');
UPDATE domains.bacia set app = ARRAY['Norte', 'DPMAIP'] WHERE ara = 'Norte';
ALTER TABLE domains.bacia DROP COLUMN ara;
DELETE FROM domains.bacia WHERE key is null;
INSERT INTO domains.bacia (category, key, ordering, parent, app) VALUES ('bacia', null, 0, null, null);
UPDATE domains.bacia SET parent = null;


ALTER TABLE domains.subacia ADD COLUMN app TEXT[];
update domains.subacia set app = string_to_array(ara, ';');
UPDATE domains.subacia set app = ARRAY['Norte', 'DPMAIP'] WHERE ara = 'Norte';
ALTER TABLE domains.subacia DROP COLUMN ara;

COMMIT;
