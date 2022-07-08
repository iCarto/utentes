-- Revert utentes:alter_table_domains_licencia_estado_add_app from pg

BEGIN;

ALTER TABLE domains.licencia_estado DROP COLUMN app;
DELETE FROM domains.licencia_estado WHERE key = 'Desconhecido';

ALTER TABLE domains.provincia ADD COLUMN ara TEXT;
update domains.provincia set ara = app[1];
ALTER TABLE domains.provincia DROP COLUMN app;

DELETE FROM domains.provincia where key is null;
INSERT INTO domains.provincia (category, key, ordering, parent, ara) values
    ('provincia', null, 0, null, 'Norte'),
    ('provincia', null, 0, null, 'Sur'),
    ('provincia', null, 0, null, null);


ALTER TABLE domains.distrito ADD COLUMN ara TEXT;
update domains.distrito set ara = app[1];
ALTER TABLE domains.distrito DROP COLUMN app;

ALTER TABLE domains.posto ADD COLUMN ara TEXT;
update domains.posto set ara = app[1];
ALTER TABLE domains.posto DROP COLUMN app;

ALTER TABLE domains.bacia ADD COLUMN ara TEXT;
update domains.bacia set ara = app[1];
ALTER TABLE domains.bacia DROP COLUMN app;
DELETE FROM domains.bacia WHERE key is null;
INSERT INTO domains.bacia (category, key, ordering, ara) VALUES
    ('bacia', null, 0, 'Norte'),
    ('bacia', null, 0, 'Sul');

ALTER TABLE domains.subacia ADD COLUMN ara TEXT;
update domains.subacia set ara = app[1];
ALTER TABLE domains.subacia DROP COLUMN app;

COMMIT;
