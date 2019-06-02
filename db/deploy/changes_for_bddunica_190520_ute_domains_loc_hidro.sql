-- Deploy utentes:changes_for_bddunica_190520_ute_domains_loc_hidro to pg

BEGIN;


ALTER TABLE domains.bacia ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.subacia  ADD COLUMN antigua text not null default 'nueva';
UPDATE domains.bacia SET antigua = 'antigua';
UPDATE domains.subacia SET antigua = 'antigua';
ALTER TABLE domains.bacia ADD COLUMN ara text;
ALTER TABLE domains.subacia  ADD COLUMN ara text;

delete from domains.unidade where key is null;
delete from domains.bacia where key is null;
delete from domains.subacia where key is null;


INSERT INTO domains.unidade (key, app) VALUES ('UGBMM', '{"Norte","DPMAIP"}'), ('UGBC', '{"Norte","DPMAIP"}'), ('UGBR', '{"Norte","DPMAIP"}');

UPDATE domains.bacia SET app = '{"Norte", "DPMAIP"}' WHERE ara = 'ARA Norte';
UPDATE domains.bacia SET app = '{"Sul"}' WHERE ara = 'ARA Sul';
UPDATE domains.bacia SET app = '{"Zambeze"}' WHERE ara = 'ARA Zambeze';

UPDATE domains.bacia SET parent = 'UGBZ' WHERE ara = 'ARA Zambeze';


INSERT INTO domains.bacia (key, parent, app) VALUES
('Messalo', 'UGBMM', '{"Norte","DPMAIP"}'),
('Montepuez', 'UGBMM', '{"Norte","DPMAIP"}'),
('Rovuma', 'UGBR', '{"Norte","DPMAIP"}'),
('Megaruma', 'UGBC', '{"Norte","DPMAIP"}'),
('Miruco', 'UGBC', '{"Norte","DPMAIP"}'),
('Muaguide', 'UGBC', '{"Norte","DPMAIP"}'),
('Ridi', 'UGBC', '{"Norte","DPMAIP"}'),
('Meapia', 'UGBC', '{"Norte","DPMAIP"}'),
('Muizi', 'UGBC', '{"Norte","DPMAIP"}'),
('Metori', 'UGBC', '{"Norte","DPMAIP"}'),
('Metava', 'UGBC', '{"Norte","DPMAIP"}'),
('Pemba', 'UGBC', '{"Norte","DPMAIP"}'),
('Tara Quilite', 'UGBC', '{"Norte","DPMAIP"}'),
('Tari', 'UGBC', '{"Norte","DPMAIP"}'),
('Miézi', 'UGBC', '{"Norte","DPMAIP"}'),
('Muacamula', 'UGBC', '{"Norte","DPMAIP"}'),
('Messingue', 'UGBC', '{"Norte","DPMAIP"}'),
('Sicoro', 'UGBC', '{"Norte","DPMAIP"}'),
('Nanhomo', 'UGBC', '{"Norte","DPMAIP"}'),
('Diquide', 'UGBC', '{"Norte","DPMAIP"}'),
('Buizili', 'UGBC', '{"Norte","DPMAIP"}'),
('Chafi', 'UGBC', '{"Norte","DPMAIP"}'),
('Muenha', 'UGBC', '{"Norte","DPMAIP"}'),
('Quigode', 'UGBC', '{"Norte","DPMAIP"}'),
('Mipama', 'UGBC', '{"Norte","DPMAIP"}'),
('Nango', 'UGBC', '{"Norte","DPMAIP"}'),
('Sinheu', 'UGBC', '{"Norte","DPMAIP"}'),
('Quinhevo', 'UGBC', '{"Norte","DPMAIP"}'),
('Bundaze', 'UGBC', '{"Norte","DPMAIP"}'),
('Mepuira', 'UGBC', '{"Norte","DPMAIP"}'),
('Necumbi', 'UGBC', '{"Norte","DPMAIP"}'),
('Macanga', 'UGBC', '{"Norte","DPMAIP"}'),
('Uncudi', 'UGBC', '{"Norte","DPMAIP"}'),
('Meranvi', 'UGBC', '{"Norte","DPMAIP"}'),
('Sem idenfiticar', 'UGBC', '{"Norte","DPMAIP"}'),
('Bacias costeiras', 'UGBC', '{"Norte","DPMAIP"}'),
('Incomati', 'UGBI', '{"Sul"}'),
('Limpopo', 'UGBL', '{"Sul"}'),
('Chiendsele', 'UGBS', '{"Sul"}'),
('Das Pedras', 'UGBS', '{"Sul"}'),
('Davetave', 'UGBS', '{"Sul"}'),
('Govuro', 'UGBS', '{"Sul"}'),
('Inhanombe', 'UGBS', '{"Sul"}'),
('Inharrime', 'UGBS', '{"Sul"}'),
('Inhavumalala', 'UGBS', '{"Sul"}'),
('Maducha', 'UGBS', '{"Sul"}'),
('Mucambe', 'UGBS', '{"Sul"}'),
('Mulalace', 'UGBS', '{"Sul"}'),
('Mutamba', 'UGBS', '{"Sul"}'),
('Nhametando', 'UGBS', '{"Sul"}'),
('Panga', 'UGBS', '{"Sul"}'),
('Save', 'UGBS', '{"Sul"}'),
('Sem identificar', 'UGBS', '{"Sul"}'),
('Bacias costeiras', 'UGBS', '{"Sul"}'),
('Bacias endorreicas', 'UGBS', '{"Sul"}'),
('Umbelúzi', 'UGBU', '{"Sul"}'),
('Fúti', 'UGBU', '{"Sul"}'),
('Maputo', 'UGBU', '{"Sul"}'),
('Matola', 'UGBU', '{"Sul"}'),
('Infulene', 'UGBU', '{"Sul"}'),
('Tembe', 'UGBU', '{"Sul"}'),
('Sem identificar', 'UGBU', '{"Sul"}'),
('Bacias costeiras', 'UGBU', '{"Sul"}')
ON CONFLICT ON CONSTRAINT bacia_key_key
    DO UPDATE SET antigua = 'conflicto';

INSERT INTO domains.bacia(key, parent, app) values ('Mecumbi', 'UGBC', '{"Norte","DPMAIP"}');

UPDATE domains.subacia set app = '{"Norte","DPMAIP", "Sul"}', antigua='conflicto' WHERE key = 'Sem identificar' and parent = 'Sem identificar';
UPDATE domains.subacia set app = '{"Norte","DPMAIP", "Sul", "Zambeze"}', antigua='conflicto' WHERE key = 'Bacias costeiras' and parent = 'Bacias costeiras';
INSERT INTO domains.subacia (key, parent, app) VALUES

-- ('Sem identificar', 'Sem idenfiticar', '{"Norte","DPMAIP"}'),
-- ('Sem identificar', 'Sem identificar', '{"Sul"}'),
-- ('Bacias Costeiras', 'Bacias Costeiras', '{"Norte","DPMAIP"}'),
-- ('Bacias costeiras', 'Bacias costeiras', '{"Sul"}'),
-- ('Sem identificar', 'Sem identificar', '{"Sul"}'),
-- ('Bacias costeiras', 'Bacias costeiras', '{"Sul"}')

('Metori', 'Metori', '{"Norte","DPMAIP"}'),
('Metava', 'Metava', '{"Norte","DPMAIP"}'),
('Chafi', 'Chafi', '{"Norte","DPMAIP"}'),
('Nanhomo', 'Nanhomo', '{"Norte","DPMAIP"}'),
('Megaruma', 'Megaruma', '{"Norte","DPMAIP"}'),
('Montepuez', 'Montepuez', '{"Norte","DPMAIP"}'),
('Rovuma', 'Rovuma', '{"Norte","DPMAIP"}'),
('Pemba', 'Pemba', '{"Norte","DPMAIP"}'),
('Miruco', 'Miruco', '{"Norte","DPMAIP"}'),
('Ridi', 'Ridi', '{"Norte","DPMAIP"}'),
('Miézi', 'Miézi', '{"Norte","DPMAIP"}'),
('Muaguide', 'Muaguide', '{"Norte","DPMAIP"}'),
('Necumbi', 'Necumbi', '{"Norte","DPMAIP"}'),
('Tara Quilite', 'Tara Quilite', '{"Norte","DPMAIP"}'),
('Muizi', 'Muizi', '{"Norte","DPMAIP"}'),
('Mepuira', 'Mepuira', '{"Norte","DPMAIP"}'),
('Macanga', 'Macanga', '{"Norte","DPMAIP"}'),
('Mipama', 'Mipama', '{"Norte","DPMAIP"}'),
('Meranvi', 'Meranvi', '{"Norte","DPMAIP"}'),
('Quigode', 'Quigode', '{"Norte","DPMAIP"}'),
('Meapia', 'Meapia', '{"Norte","DPMAIP"}'),
('Mecumbi', 'Mecumbi', '{"Norte","DPMAIP"}'),
('Nango', 'Nango', '{"Norte","DPMAIP"}'),
('Sinheu', 'Sinheu', '{"Norte","DPMAIP"}'),
('Uncudi', 'Uncudi', '{"Norte","DPMAIP"}'),
('Quinhevo', 'Quinhevo', '{"Norte","DPMAIP"}'),
('Bundaze', 'Bundaze', '{"Norte","DPMAIP"}'),
('Muenha', 'Muenha', '{"Norte","DPMAIP"}'),
('Sicoro', 'Sicoro', '{"Norte","DPMAIP"}'),
('Muacamula', 'Muacamula', '{"Norte","DPMAIP"}'),
('Messingue', 'Messingue', '{"Norte","DPMAIP"}'),
('Diquide', 'Diquide', '{"Norte","DPMAIP"}'),
('Buizili', 'Buizili', '{"Norte","DPMAIP"}'),
('Tari', 'Tari', '{"Norte","DPMAIP"}'),
('Messalo', 'Messalo', '{"Norte","DPMAIP"}'),

('Bacias endorreicas', 'Bacias endorreicas', '{"Sul"}'),
('Chiendsele', 'Chiendsele', '{"Sul"}'),
('Das Pedras', 'Das Pedras', '{"Sul"}'),
('Davetave', 'Davetave', '{"Sul"}'),
('Fúti', 'Fúti', '{"Sul"}'),
('Govuro', 'Govuro', '{"Sul"}'),
('Incomati', 'Incomati', '{"Sul"}'),
('Infulene', 'Infulene', '{"Sul"}'),
('Inhanombe', 'Inhanombe', '{"Sul"}'),
('Inharrime', 'Inharrime', '{"Sul"}'),
('Inhavumalala', 'Inhavumalala', '{"Sul"}'),
('Limpopo', 'Limpopo', '{"Sul"}'),
('Maducha', 'Maducha', '{"Sul"}'),
('Maputo', 'Maputo', '{"Sul"}'),
('Matola', 'Matola', '{"Sul"}'),
('Mucambe', 'Mucambe', '{"Sul"}'),
('Mulalace', 'Mulalace', '{"Sul"}'),
('Mutamba', 'Mutamba', '{"Sul"}'),
('Nhametando', 'Nhametando', '{"Sul"}'),
('Panga', 'Panga', '{"Sul"}'),
('Tembe', 'Tembe', '{"Sul"}'),
('Umbelúzi', 'Umbelúzi', '{"Sul"}'),
('Save', 'Save', '{"Sul"}')

ON CONFLICT ON CONSTRAINT subacia_key_parent_key
    DO UPDATE SET antigua = 'conflicto';


/*
No se puede ejecutar por eso va a mano el insert
INSERT INTO domains.subacia (key, parent, ara)
    SELECT subacia, nome, ara FROM cbase.bacias
    ON CONFLICT ON CONSTRAINT subacia_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = EXCLUDED.ara
;
*/



UPDATE utentes.exploracaos SET loc_unidad = 'UGBC' WHERE loc_bacia IN ('Megaruma');
UPDATE utentes.exploracaos SET loc_unidad = 'UGBMM' WHERE loc_bacia IN ('Messalo', 'Montepuez');
UPDATE utentes.exploracaos SET loc_unidad = 'UGBR' WHERE loc_bacia IN ('Rovuma');



UPDATE utentes.exploracaos SET  loc_unidad='UGBC', loc_bacia = 'Bundaze', loc_subaci = 'Bundaze' WHERE loc_subaci = 'Bundaze-Monga';
UPDATE utentes.exploracaos SET loc_unidad='UGBC', loc_bacia = 'Nango', loc_subaci = 'Nango' WHERE loc_subaci = 'Nango/Mepuira';
UPDATE utentes.exploracaos SET loc_unidad='UGBC', loc_bacia = 'Tara Quilite', loc_subaci = 'Tara Quilite' WHERE loc_subaci = 'Tara-Quilite';
UPDATE utentes.exploracaos SET loc_unidad = 'UGBC', loc_bacia = 'Pemba', loc_subaci = 'Pemba' WHERE loc_subaci = 'Pemba';
UPDATE utentes.exploracaos SET loc_unidad = 'UGBC', loc_bacia = 'Miézi', loc_subaci = 'Miézi' WHERE loc_subaci = 'Miezi';
UPDATE utentes.exploracaos SET loc_unidad = 'UGBC', loc_bacia = 'Bacias costeiras', loc_subaci = 'Bacias costeiras' WHERE loc_bacia = 'Orla Marítima 2' and loc_subaci = 'S/N';
UPDATE utentes.exploracaos SET loc_unidad = 'UGBC', loc_bacia = 'Pemba', loc_subaci = 'Pemba' WHERE exp_id = '040/ARAN/2016';


WITH foo AS (
    SELECT e.gid, e.loc_unidad, e.loc_bacia, e.loc_subaci, b.nome nueva_bacia, b.subacia nueva_subacia, d.parent as nueva_unidad
    FROM utentes.exploracaos e join cbase.bacias b ON st_intersects(e.the_geom, b.geom) left join (SELECT key, parent FROM domains.bacia g WHERE (SELECT h.key FROM domains.ara h LIMIT 1) = ANY(g.app)) d on b.nome = d.key
    WHERE e.loc_bacia ilike 'Orla%'
)
UPDATE utentes.exploracaos ee SET
    loc_unidad = foo.nueva_unidad
    , loc_bacia = foo.nueva_bacia
    , loc_subaci = foo.nueva_subacia
FROM foo
WHERE ee.gid = foo.gid
;



DELETE FROM domains.bacia WHERE antigua = 'antigua' AND parent != 'UGBZ';
DELETE FROM domains.subacia WHERE antigua = 'antigua' AND app != '{"Zambeze"}';

ALTER TABLE domains.bacia  DROP COLUMN antigua;
ALTER TABLE domains.subacia  DROP COLUMN antigua;
ALTER TABLE domains.bacia  DROP COLUMN ara;
ALTER TABLE domains.subacia  DROP COLUMN ara;

DELETE FROM domains.unidade WHERE key IN ('UGBME', 'UGBMO', 'UGBPE', 'UGBRO');

REFRESH MATERIALIZED VIEW domains.domains;


COMMIT;
