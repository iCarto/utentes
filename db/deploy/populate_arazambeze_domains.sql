-- Deploy utentes:populate_arazambeze_domains to pg

BEGIN;

UPDATE domains.provincia SET app = app || '{Zambeze}' WHERE key in ('Manica', 'Niassa', 'Sofala', 'Tete', 'Zambezia' );

UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE parent in ('Manica', 'Niassa', 'Sofala', 'Tete', 'Zambezia' ) AND ordering = 0;

UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Barue';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Guro';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Macossa';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Tambara';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Ilha Licom';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Ilha Risunodo';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Caia';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chemba';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cheringoma';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Maringue';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Marromeu';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Angonia';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cahora Bassa';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Changara';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chifunde';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chiuta';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cidade De Tete';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Macanga';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Magoe';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Maravia';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Moatize';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Mutarara';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Tsangano';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Zumbu';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chinde';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cidade De Quelimane';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Inhassunge';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Milange';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Mocuba';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Mopeia';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Morrumbala';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Namacurra';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Nicoadala';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Lago';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cidade de Lichinga';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Ngauma';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Sanga';
UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Lichinga';



UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Barue';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Guro';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Macossa';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Tambara';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Ilha Licom';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Ilha Risunodo';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Caia';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chemba';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cheringoma';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Maringue';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Marromeu';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Angonia';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cahora Bassa';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Changara';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chifunde';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chiuta';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cidade De Tete';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Macanga';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Magoe';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Maravia';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Moatize';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Mutarara';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Tsangano';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Zumbu';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Chinde';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cidade De Quelimane';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Inhassunge';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Milange';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Mocuba';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Mopeia';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Morrumbala';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Namacurra';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Nicoadala';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Lago';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Cidade de Lichinga';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Ngauma';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Sanga';
UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = 'Lichinga';

--with foo as (select nome, loc_provin, ara, 'xxxx', category, ordering, key, parent, app, app || '{Zambeze}' newapp from distritos_tmp full outer join domains.distrito on nome = key where ara ilike '%Zambeze%' order by loc_provin, key) update domains.distrito a set app = newapp from foo where a.key=foo.key and a.parent=foo.parent;
--update domains.distrito set app = '{Norte,Zambeze}' where key ilike '%lichinga%';
-- SELECT $$UPDATE domains.distrito SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = '$$ || key || $$';$$ FROM domains.distrito where 'Zambeze' = any(app) and ordering is null;

-- with foo as (select nome, loc_distri, ara, 'xxxx', category, ordering, key, parent, app, app || '{Zambeze}' newapp from postos_tmp full outer join domains.posto on nome = key where ara ilike '%Zambeze%' order by loc_distri, key) update domains.posto a set app = newapp from foo where a.key=foo.key and a.parent=foo.parent;
-- update domains.posto set app = '{Norte,Zambeze}' where key ilike '%lichinga%';
-- SELECT $$UPDATE domains.posto SET app = COALESCE(app, '{}') || '{Zambeze}' WHERE key = '$$ || key || $$';$$ FROM domains.distrito where 'Zambeze' = any(app) and ordering is null;



-- INSERT INTO domains.unidade (category, key, app) values ('unidade', 'Zambeze', '{Zambeze}');

-- INSERT INTO domains.bacia (category, key, parent, app) SELECT 'bacia', nome, 'Zambeze', '{Zambeze}' from bacias_tmp where ara ilike '%Zambeze%';
-- INSERT INTO domains.bacia (category, key, parent, app) values( 'bacia', null, 'Zambeze', '{Zambeze}');

-- INSERT INTO domains.subacia (category, key, parent, app) SELECT 'subacia', subacia, nome, '{Zambeze}' from bacias_tmp where ara ilike '%Zambeze%';
-- INSERT INTO domains.subacia (category, key, parent, app) SELECT 'subacia', null, nome, '{Zambeze}' from bacias_tmp where ara ilike '%Zambeze%';



INSERT INTO domains.unidade (category, key, app) values ('unidade', 'Zambeze', '{Zambeze}');

INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Zambeze', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Inhaombe', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Bacias costeiras AZ', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Lualua', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Cuacua', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Nhangone', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Inhamara', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Micelo', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Luaua', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Nhamacota', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', 'Bazar', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip, app) VALUES ('bacia', NULL, NULL, 0, 'Zambeze', NULL, '{Zambeze}');


INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Zambeze', NULL, NULL, 'Zambeze', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Inhaombe', NULL, NULL, 'Inhaombe', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Bacias costeiras AZ', NULL, NULL, 'Bacias costeiras AZ', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Lualua', NULL, NULL, 'Lualua', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Cuacua', NULL, NULL, 'Cuacua', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Nhangone', NULL, NULL, 'Nhangone', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Inhamara', NULL, NULL, 'Inhamara', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Micelo', NULL, NULL, 'Micelo', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Luaua', NULL, NULL, 'Luaua', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Nhamacota', NULL, NULL, 'Nhamacota', NULL, '{Zambeze}');
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', 'Bazar', NULL, NULL, 'Bazar', NULL, '{Zambeze}');

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Zambeze', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Inhaombe', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Bacias costeiras AZ', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Lualua', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Cuacua', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Nhangone', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Inhamara', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Micelo', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Luaua', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Nhamacota', NULL, NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip, app) VALUES ('subacia', NULL, NULL, 0, 'Bazar', NULL, NULL);


COMMIT;
