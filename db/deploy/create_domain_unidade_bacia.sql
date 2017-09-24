-- Deploy utentes:create_domain_unidade_bacia to pg



BEGIN;

ALTER TABLE utentes.exploracaos DROP CONSTRAINT exploracaos_loc_bacia_fkey;
ALTER TABLE domains.bacia DROP CONSTRAINT bacia_key_key;

CREATE TABLE domains.unidade (
    category text not null default 'unidade',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    app text[]
);

INSERT INTO domains.unidade (key, ordering, app) VALUES
(null,    0,    null),
('UGBME', null, '{Norte,DPMAIP}'),
('UGBMO', null, '{Norte,DPMAIP}'),
('UGBPE', null, '{Norte,DPMAIP}'),
('UGBRO', null, '{Norte,DPMAIP}'),
('UGBI',  null, '{Sul}'),
('UGBL',  null, '{Sul}'),
('UGBS',  null, '{Sul}'),
('UGBU',  null, '{Sul}')
;


DELETE FROM domains.bacia WHERE key = 'Outra';

INSERT INTO domains.bacia (category, key, app) VALUES
('bacia', 'Bacias Costeiras', '{Sul}'),
('bacia', 'Jangamo', '{Sul}'),
('bacia', 'Infulene', '{Sul}'),
('bacia', 'Orla Marítima', '{Sul}')
;

INSERT INTO domains.bacia (category, key, app, parent) VALUES
('bacia', 'Outra', '{Sul}', 'UGBI'),
('bacia', 'Outra', '{Sul}', 'UGBL'),
('bacia', 'Outra', '{Sul}', 'UGBS'),
('bacia', 'Outra', '{Sul}', 'UGBU')
;


INSERT INTO domains.bacia (category, key, ordering, parent, app) SELECT 'bacia', null, 0, key, app FROM domains.unidade;
delete from domains.bacia where key is null and ordering = 0 and parent is null and app is null;

INSERT INTO domains.subacia (category, key, parent, app, ordering) VALUES
('subacia', null, 'Bacias Costeiras', null, 0),
('subacia', 'Bacias Costeiras', 'Bacias Costeiras', '{Sul}', null),
('subacia', null, 'Jangamo', null, 0),
('subacia', 'Jangamo', 'Jangamo', '{Sul}', null),
('subacia', null, 'Infulene', null, 0),
('subacia', 'Infulene', 'Infulene', '{Sul}', null),
('subacia', null, 'Orla Marítima', null, 0),
('subacia', 'Orla Marítima', 'Orla Marítima', '{Sul}', null)
;


UPDATE domains.bacia SET parent = 'UGBPE' WHERE key IN ('Megaruma', 'Orla Marítima 1');
UPDATE domains.bacia SET parent = 'UGBME' WHERE key IN ('Messalo', 'Orla Marítima 2', 'Orla Marítima 3');
UPDATE domains.bacia SET parent = 'UGBMO' WHERE key = 'Montepuez';
UPDATE domains.bacia SET parent = 'UGBRO' WHERE key = 'Rovuma';
UPDATE domains.bacia SET parent = 'UGBI' WHERE key IN ('Incomati') ;
UPDATE domains.bacia SET parent = 'UGBL' WHERE key IN ('Limpopo');
UPDATE domains.bacia SET parent = 'UGBS' WHERE key IN ('Bacias Costeiras', 'Bambe', 'Chiendsele', 'Das Pedras', 'Davetave', 'Govuro', 'Inhanombe', 'Inharrime', 'Inhavumalala', 'Jangamo', 'Maducha', 'Mucambe', 'Mulalace', 'Mutamba', 'Nhangualala', 'Panga', 'Save');
UPDATE domains.bacia SET parent = 'UGBU' WHERE key IN ( 'Bembe', 'Futi', 'Infulene', 'Maputo', 'Matola', 'Orla Marítima', 'Tembe', 'Umbeluzi');


ALTER TABLE utentes.exploracaos ADD COLUMN loc_unidad text REFERENCES domains.unidade(key) ON UPDATE CASCADE ON DELETE NO ACTION;


ALTER TABLE domains.bacia ADD CONSTRAINT bacia_key_key UNIQUE (parent, key);
ALTER TABLE utentes.exploracaos ADD CONSTRAINT exploracaos_loc_bacia_fkey FOREIGN KEY (loc_unidad, loc_bacia) REFERENCES domains.bacia (parent, key) ON UPDATE CASCADE ON DELETE NO ACTION;

UPDATE utentes.exploracaos SET loc_unidad =
CASE loc_bacia
WHEN 'Megaruma' THEN 'UGBPE'
WHEN 'Messalo' THEN 'UGBME'
WHEN 'Montepuez' THEN 'UGBMO'
WHEN 'Rovuma' THEN 'UGBRO'
WHEN 'Orla Marítima 1' THEN 'UGBPE'
WHEN 'Orla Marítima 2' THEN 'UGBME'
WHEN 'Orla Marítima 3' THEN 'UGBME'
END;



COMMIT;
