-- Revert utentes:create_domain_unidade_bacia from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP CONSTRAINT exploracaos_loc_bacia_fkey;
ALTER TABLE domains.bacia DROP CONSTRAINT bacia_key_key;

ALTER TABLE utentes.exploracaos DROP CONSTRAINT exploracaos_loc_unidad_fkey;

DELETE FROM domains.bacia WHERE key = 'Outra' AND parent IN ('UGBI', 'UGBL', 'UGBS', 'UGBU');
UPDATE domains.bacia SET parent = null;

DELETE FROM domains.subacia WHERE parent IN ('Bacias Costeiras', 'Jangamo', 'Infulene', 'Orla Marítima');

DELETE FROM domains.bacia WHERE key is null and ordering = 0;

DELETE FROM domains.bacia WHERE key IN ('Bacias Costeiras', 'Jangamo', 'Infulene', 'Orla Marítima');

INSERT INTO domains.bacia (category, key, app, ordering) VALUES
('bacia', 'Outra', '{Sul}', null),
('bacia', null, null, 0);

DROP TABLE domains.unidade;

ALTER TABLE domains.bacia ADD CONSTRAINT bacia_key_key UNIQUE(key);
ALTER TABLE utentes.exploracaos ADD CONSTRAINT exploracaos_loc_bacia_fkey FOREIGN KEY (loc_bacia) REFERENCES domains.bacia(key) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE utentes.exploracaos DROP COLUMN loc_unidad;

COMMIT;
