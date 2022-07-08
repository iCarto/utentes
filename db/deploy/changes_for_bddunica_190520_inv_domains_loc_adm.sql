-- Deploy utentes:changes_for_bddunica_190520 to pg

BEGIN;


/*
Una nueva columna para poder marcar los dominios como:
- 'nueva': Cuando no existieran previamente (sin conflicto con la unique key)
- 'conclicto': Conflicto con la unique key. Por tanto estaban antes y ahora
- 'antigua': No están en los nuevos datos y serán borrados
*/
ALTER TABLE inventario_dominios.provincia ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.posto  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.distrito  ADD COLUMN antigua text not null default 'nueva';
UPDATE inventario_dominios.provincia SET antigua = 'antigua';
UPDATE inventario_dominios.distrito SET antigua = 'antigua';
UPDATE inventario_dominios.posto SET antigua = 'antigua';


INSERT INTO inventario_dominios.provincia (key)
    SELECT nome FROM cbase.provincias WHERE ara ilike (SELECT '%ARA ' || key || '%' FROM domains.ara LIMIT 1)
    ON CONFLICT ON CONSTRAINT provincia_key_key
    DO UPDATE SET antigua = 'conflicto'
;


INSERT INTO inventario_dominios.distrito (key, parent)
    SELECT nome, loc_provin FROM cbase.distritos WHERE ara ilike (SELECT '%ARA ' || key || '%' FROM domains.ara LIMIT 1)
    ON CONFLICT ON CONSTRAINT distrito_key_parent_key
    DO UPDATE SET antigua = 'conflicto'
;


INSERT INTO inventario_dominios.posto (key, parent)
    SELECT nome, loc_distri FROM cbase.postos WHERE ara ilike (SELECT '%ARA ' || key || '%' FROM domains.ara LIMIT 1)
    ON CONFLICT ON CONSTRAINT posto_key_parent_key
    DO UPDATE SET antigua = 'conflicto'
;

UPDATE inventario.barragens SET (distrito, posto_adm) = ('Cidade De Lichinga', 'Cidade De Lichinga') WHERE (distrito, posto_adm) = ('Cidade de Lichinga', 'Cidade de Lichinga');
UPDATE inventario.estacoes SET (distrito, posto_adm) = ('Cidade De Lichinga', 'Cidade De Lichinga') WHERE (distrito, posto_adm) = ('Cidade de Lichinga', 'Cidade de Lichinga');
UPDATE inventario.exploracoes SET (loc_distri, loc_post) = ('Cidade De Lichinga', 'Cidade De Lichinga') WHERE (loc_distri, loc_post) = ('Cidade de Lichinga', 'Cidade de Lichinga');
UPDATE inventario.fontes SET (distrito, posto_adm) = ('Cidade De Lichinga', 'Cidade De Lichinga') WHERE (distrito, posto_adm) = ('Cidade de Lichinga', 'Cidade de Lichinga');

UPDATE inventario.barragens SET (distrito, posto_adm) = ('Cidade De Pemba', 'Cidade De Pemba') WHERE (distrito, posto_adm) = ('Cidade de Pemba', 'Cidade de Pemba');
UPDATE inventario.estacoes SET (distrito, posto_adm) = ('Cidade De Pemba', 'Cidade De Pemba') WHERE (distrito, posto_adm) = ('Cidade de Pemba', 'Cidade de Pemba');
UPDATE inventario.exploracoes SET (loc_distri, loc_post) = ('Cidade De Pemba', 'Cidade De Pemba') WHERE (loc_distri, loc_post) = ('Cidade de Pemba', 'Cidade de Pemba');
UPDATE inventario.fontes SET (distrito, posto_adm) = ('Cidade De Pemba', 'Cidade De Pemba') WHERE (distrito, posto_adm) = ('Cidade de Pemba', 'Cidade de Pemba');

UPDATE inventario.barragens SET (provincia, distrito, posto_adm) = ('Cabo Delgado', 'Mocimboa Da Praia', 'Mocimboa Da Praia') WHERE (distrito, posto_adm) = ('Mocimboa da Praia', 'Mocimboa da Praia');
UPDATE inventario.estacoes SET (distrito, posto_adm) = ('Mocimboa Da Praia', 'Mocimboa Da Praia') WHERE (distrito, posto_adm) = ('Mocimboa da Praia', 'Mocimboa da Praia');
UPDATE inventario.exploracoes SET (loc_distri, loc_post) = ('Mocimboa Da Praia', 'Mocimboa Da Praia') WHERE (loc_distri, loc_post) = ('Mocimboa da Praia', 'Mocimboa da Praia');
UPDATE inventario.fontes SET (distrito, posto_adm) = ('Mocimboa Da Praia', 'Mocimboa Da Praia') WHERE (distrito, posto_adm) = ('Mocimboa da Praia', 'Mocimboa da Praia');

UPDATE inventario.barragens SET distrito = 'Mocimboa Da Praia' WHERE distrito = 'Mocimboa da Praia';
UPDATE inventario.estacoes SET distrito = 'Mocimboa Da Praia' WHERE distrito = 'Mocimboa da Praia';
UPDATE inventario.exploracoes SET loc_distri = 'Mocimboa Da Praia' WHERE loc_distri = 'Mocimboa da Praia';
UPDATE inventario.fontes SET distrito = 'Mocimboa Da Praia' WHERE distrito = 'Mocimboa da Praia';

UPDATE inventario.barragens SET distrito = 'Pemba-Metuge' WHERE distrito = 'Pemba - Metuge';
UPDATE inventario.estacoes SET distrito = 'Pemba-Metuge' WHERE distrito = 'Pemba - Metuge';
UPDATE inventario.exploracoes SET loc_distri = 'Pemba-Metuge' WHERE loc_distri = 'Pemba - Metuge';
UPDATE inventario.fontes SET distrito = 'Pemba-Metuge' WHERE distrito = 'Pemba - Metuge';



UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Mocimboa Da Praia') WHERE (provincia, distrito) = ('Cabo Delgado', 'Mocimboa da Praia');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa Da Praia') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa da Praia');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Mocimboa Da Praia') WHERE (provincia, distrito) = ('Cabo Delgado', 'Mocimboa da Praia');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Cidade De Pemba') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade de Pemba');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade De Pemba') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade de Pemba');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Pemba') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Pemba');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade De Pemba') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade de Pemba');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Cidade De Lichinga') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade de Lichinga');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade De Lichinga') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade de Lichinga');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Lichinga') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Lichinga');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade De Lichinga') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade de Lichinga');


-- Problema ARA-Sul. No importa el ROLLBACK, porque los de inventario son datos que se van a hacer nuevos
-- No importa ARA-Zambeze porque no tiene datos de inventario (Manica corresponde a ARAZ)
-- esto es para mantener cierto control sobre las incidencias
-- distrito Save
WITH foo AS (
    select e.gid, provincia, distrito, posto_adm, p.nome cbase_posto, p.loc_distri cbase_distri, p.loc_provin cbase_provin, p.ara cbase_ara
    from inventario.estacoes e join cbase.postos p on st_intersects(e.geom, p.geom)
    where provincia = 'Manica'
)
UPDATE inventario.estacoes ie SET
    provincia = foo.cbase_provin, distrito = foo.cbase_distri, posto_adm = foo.cbase_posto
FROM foo
WHERE ie.gid = foo.gid;

WITH foo AS (
    select e.gid, provincia, distrito, posto_adm, p.nome cbase_posto, p.loc_distri cbase_distri, p.loc_provin cbase_provin, p.ara cbase_ara
    from inventario.fontes e join cbase.postos p on st_intersects(e.geom, p.geom)
    where provincia = 'Manica'
)
UPDATE inventario.fontes ie SET
    provincia = foo.cbase_provin, distrito = foo.cbase_distri, posto_adm = foo.cbase_posto
FROM foo
WHERE ie.gid = foo.gid;

-- Otros ARA-Sul
WITH foo AS (
    select e.gid, provincia, distrito, posto_adm, p.nome cbase_posto, p.loc_distri cbase_distri, p.loc_provin cbase_provin, p.ara cbase_ara
    from inventario.barragens e join cbase.postos p on st_intersects(e.geom, p.geom)
    where distrito = 'Chokwe'
)
UPDATE inventario.barragens ie SET
    provincia = foo.cbase_provin, distrito = foo.cbase_distri, posto_adm = foo.cbase_posto
FROM foo
WHERE ie.gid = foo.gid;


WITH foo AS (
    select e.gid, provincia, distrito, posto_adm, p.nome cbase_posto, p.loc_distri cbase_distri, p.loc_provin cbase_provin, p.ara cbase_ara
    from inventario.estacoes e join cbase.postos p on st_intersects(e.geom, p.geom)
    where distrito IN ('Chokwe', 'Cidade de Xai Xai', 'Guija', 'Xai Xai', 'Cidade de Inhambane', 'Cidade de Maxixe', 'Cidade da Matola', 'Cidade de Maputo', 'Chibuto', 'Matutuine', 'Manhiça', 'Bilene')
)
UPDATE inventario.estacoes ie SET
    provincia = foo.cbase_provin, distrito = foo.cbase_distri, posto_adm = foo.cbase_posto
FROM foo
WHERE ie.gid = foo.gid;

WITH foo AS (
    select e.gid, provincia, distrito, posto_adm, p.nome cbase_posto, p.loc_distri cbase_distri, p.loc_provin cbase_provin, p.ara cbase_ara
    from inventario.fontes e join cbase.postos p on st_intersects(e.geom, p.geom)
        where distrito IN ('Chokwe', 'Cidade de Xai Xai', 'Guija', 'Xai Xai', 'Cidade de Inhambane', 'Cidade de Maxixe', 'Cidade da Matola', 'Cidade de Maputo', 'Chibuto', 'Matutuine', 'Manhiça', 'Bilene')
)
UPDATE inventario.fontes ie SET
    provincia = foo.cbase_provin, distrito = foo.cbase_distri, posto_adm = foo.cbase_posto
FROM foo
WHERE ie.gid = foo.gid;


UPDATE inventario.fontes SET provincia = 'Maputo', distrito = 'Cidade Da Matola', posto_adm = 'Cidade Da Matola' WHERE distrito = 'Cidade da Matola';
UPDATE inventario.fontes SET provincia = 'Maputo', distrito = 'Cidade De Maputo', posto_adm = 'Cidade De Maputo' WHERE distrito = 'Cidade de Maputo';


-- Estas fuentes eran de "test" en el ARA-Sul y pueden ignorarse
DELETE FROM inventario.fontes f WHERE f.provincia = 'Sofala' AND (SELECT key from domains.ara LIMIT 1) = 'Sul';

DELETE FROM inventario_dominios.provincia WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.distrito WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.posto WHERE antigua = 'antigua';

UPDATE inventario_dominios.provincia SET app = (SELECT string_to_array(key,';') FROM domains.ara) WHERE antigua = 'nueva';
UPDATE inventario_dominios.distrito SET app = (SELECT string_to_array(key,';') FROM domains.ara) WHERE antigua = 'nueva';
UPDATE inventario_dominios.posto SET app = (SELECT string_to_array(key,';') FROM domains.ara) WHERE antigua = 'nueva';


ALTER TABLE inventario_dominios.provincia DROP COLUMN antigua;
ALTER TABLE inventario_dominios.posto DROP COLUMN antigua;
ALTER TABLE inventario_dominios.distrito  DROP COLUMN antigua;


COMMIT;
