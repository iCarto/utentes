-- Deploy utentes:changes_for_bddunica_190520_ute_domains_loc_adm to pg

BEGIN;

ALTER TABLE domains.posto  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.distrito  ADD COLUMN antigua text not null default 'nueva';
UPDATE domains.distrito SET antigua = 'antigua';
UPDATE domains.posto SET antigua = 'antigua';

ALTER TABLE domains.posto  ADD COLUMN ara text;
ALTER TABLE domains.distrito  ADD COLUMN ara text;


update domains.provincia set app = '{"Zambeze"}' where key = 'Manica';

delete from domains.provincia where key is null;
delete from domains.distrito where key is null;
delete from domains.posto where key is null;

INSERT INTO domains.distrito (key, parent, ara)
    SELECT nome, loc_provin, ara FROM cbase.distritos
    ON CONFLICT ON CONSTRAINT distrito_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = EXCLUDED.ara
;

INSERT INTO domains.posto (key, parent, ara)
    SELECT nome, loc_distri, ara FROM cbase.postos
    ON CONFLICT ON CONSTRAINT posto_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = EXCLUDED.ara
;

UPDATE domains.distrito SET app = NULL WHERE key = 'Machaze' and parent = 'Manica';
UPDATE domains.distrito SET app = NULL WHERE key = 'Machanga' and parent = 'Sofala';

UPDATE domains.distrito SET app = '{"Norte","DPMAIP"}' where parent = 'Cabo Delgado' and key = 'Pemba-Metuge';
UPDATE domains.distrito SET app = '{"Norte","DPMAIP"}' where parent = 'Cabo Delgado' and key = 'Mocimboa Da Praia';
UPDATE domains.distrito SET app = '{"Norte","DPMAIP"}' where parent = 'Cabo Delgado' and key = 'Cidade De Pemba';
UPDATE domains.distrito SET app = '{"Norte","DPMAIP","Zambeze"}' where parent = 'Niassa' and key = 'Cidade De Lichinga';

UPDATE domains.posto SET app = '{"Norte","DPMAIP"}' where parent = 'Mocimboa Da Praia';
UPDATE domains.posto SET app = '{"Norte","DPMAIP"}' where parent = 'Pemba-Metuge';
UPDATE domains.posto SET app = '{"Norte","DPMAIP"}' where parent = 'Cidade De Pemba';
UPDATE domains.posto SET app = '{"Norte","DPMAIP","Zambeze"}' where parent = 'Cidade De Lichinga';


UPDATE domains.posto SET app = '{"Zambeze"}' where app is null and ara ilike '%ARA Zambeze%';
UPDATE domains.posto SET app = NULL where parent = 'Maua' and key = 'Maiaca';
UPDATE domains.posto SET app = NULL where parent = 'Machanga' and key = 'Divinhe';
UPDATE domains.posto SET app = NULL where parent = 'Machanga' and key = 'Machanga';
UPDATE domains.posto SET app = '{"Sul"}' where app is null and ara ilike '%ARA Sul%';
UPDATE domains.posto SET app = '{"Norte", "Zambeze"}' where parent = 'Lago';
UPDATE domains.posto SET app = '{"Norte", "Zambeze"}' where parent = 'Lichinga' and key = 'Chimbonila';
UPDATE domains.posto SET app = '{"Norte", "Zambeze"}' where parent = 'Lichinga' and key = 'Lione';
UPDATE domains.posto SET app = '{"Norte", "Zambeze"}' where parent = 'Ngauma' and key = 'Massangulo';
UPDATE domains.posto SET app = '{"Zambeze"}' where parent = 'Lichinga' and key = 'Meponda';
UPDATE domains.posto SET app = '{"Norte"}' where parent = 'Mecanhelas' and key = 'Chiuta';
UPDATE domains.posto SET app = NULL where parent = 'Nipepe' and key = 'Nipepe';
UPDATE domains.posto SET app = '{"Norte", "Zambeze"}' where parent = 'Sanga' and key = 'Lussimbesse';
UPDATE domains.posto SET app = NULL where parent = 'Namuno' and key = 'Hucula';
UPDATE domains.posto SET app = NULL where parent = 'Namuno' and key = 'Machoca';
UPDATE domains.posto SET app = NULL where parent = 'Chiure' and key = 'Ocua';
UPDATE domains.posto SET app = NULL where parent = 'Chiure' and key = 'Namogelia';
UPDATE domains.posto SET app = NULL where parent = 'Namuno' and key = 'N''Cumpe';
UPDATE domains.posto SET app = NULL where parent = 'Namuno' and key = 'Papai';
UPDATE domains.posto SET app = NULL where parent = 'Metarica' and key = 'Nacumua';

UPDATE utentes.exploracaos SET (loc_distri, loc_posto) = ('Cidade De Lichinga', 'Cidade De Lichinga') WHERE (loc_distri, loc_posto) = ('Cidade de Lichinga', 'Cidade de Lichinga');
UPDATE utentes.utentes SET (loc_distri, loc_posto) = ('Cidade De Lichinga', 'Cidade De Lichinga') WHERE (loc_distri, loc_posto) = ('Cidade de Lichinga', 'Cidade de Lichinga');

UPDATE utentes.exploracaos SET (loc_distri, loc_posto) = ('Cidade De Pemba', 'Cidade De Pemba') WHERE (loc_distri, loc_posto) = ('Cidade de Pemba', 'Cidade de Pemba');
UPDATE utentes.utentes SET (loc_distri, loc_posto) = ('Cidade De Pemba', 'Cidade De Pemba') WHERE (loc_distri, loc_posto) = ('Cidade de Pemba', 'Cidade de Pemba');

UPDATE utentes.exploracaos SET (loc_distri, loc_posto) = ('Mocimboa Da Praia', 'Mocimboa Da Praia') WHERE (loc_distri, loc_posto) = ('Mocimboa da Praia', 'Mocimboa da Praia');
UPDATE utentes.utentes SET (loc_distri, loc_posto) = ('Mocimboa Da Praia', 'Mocimboa Da Praia') WHERE (loc_distri, loc_posto) = ('Mocimboa da Praia', 'Mocimboa da Praia');

UPDATE utentes.exploracaos SET loc_distri = 'Mocimboa Da Praia' WHERE loc_distri = 'Mocimboa da Praia';
UPDATE utentes.utentes SET loc_distri = 'Mocimboa Da Praia' WHERE loc_distri = 'Mocimboa da Praia';

UPDATE utentes.exploracaos SET loc_distri = 'Pemba-Metuge' WHERE loc_distri = 'Pemba - Metuge';
UPDATE utentes.utentes SET loc_distri = 'Pemba-Metuge' WHERE loc_distri = 'Pemba - Metuge';


UPDATE utentes.exploracaos SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa Da Praia') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa da Praia');
UPDATE utentes.utentes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa Da Praia') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa da Praia');

UPDATE utentes.exploracaos SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE utentes.utentes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge');

UPDATE utentes.exploracaos SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Pemba') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Pemba');
UPDATE utentes.utentes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Pemba') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Pemba');

UPDATE utentes.exploracaos SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Lichinga') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Lichinga');
UPDATE utentes.utentes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Lichinga') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Lichinga');


DELETE FROM domains.distrito WHERE antigua = 'antigua';
DELETE FROM domains.posto WHERE antigua = 'antigua';

ALTER TABLE domains.distrito DROP COLUMN antigua;
ALTER TABLE domains.posto DROP COLUMN antigua;

ALTER TABLE domains.distrito DROP COLUMN ara;
ALTER TABLE domains.posto DROP COLUMN ara;

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
