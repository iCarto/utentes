-- Deploy utentes:changes_for_bddunica_190520_inv_domains_loc_hidro to pg

BEGIN;

ALTER TABLE inventario_dominios.bacia ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.subacia  ADD COLUMN antigua text not null default 'nueva';
UPDATE inventario_dominios.bacia SET antigua = 'antigua';
UPDATE inventario_dominios.subacia SET antigua = 'antigua';

-- El DISTINCT es para los duplicados "Sem identificar", ...
INSERT INTO inventario_dominios.bacia (key)
    SELECT DISTINCT nome FROM cbase.bacias WHERE ara ilike (SELECT '%ARA ' || key || '%' FROM domains.ara LIMIT 1)
    ON CONFLICT ON CONSTRAINT bacia_key_key
    DO UPDATE SET antigua = 'conflicto'
;

INSERT INTO inventario_dominios.subacia (key, parent)
    SELECT subacia, nome FROM cbase.bacias WHERE ara ilike (SELECT '%ARA ' || key || '%' FROM domains.ara LIMIT 1) GROUP BY subacia, nome
    ON CONFLICT ON CONSTRAINT subacia_key_parent_key
    DO UPDATE SET antigua = 'conflicto'
;


UPDATE inventario.barragens SET bacia = 'Sinheu' , subacia = 'Sinheu' WHERE subacia = 'Sinheu/Mutamba';
UPDATE inventario.estacoes SET bacia = 'Sinheu' , subacia = 'Sinheu' WHERE subacia = 'Sinheu/Mutamba';
UPDATE inventario.exploracoes SET loc_bacia = 'Sinheu' , loc_subaci = 'Sinheu' WHERE loc_subaci = 'Sinheu/Mutamba';
UPDATE inventario.fontes SET bacia = 'Sinheu' , subacia = 'Sinheu' WHERE subacia = 'Sinheu/Mutamba';

UPDATE inventario.barragens SET bacia = 'Quinhevo' , subacia = 'Quinhevo' WHERE subacia = 'Quinhevo';
UPDATE inventario.estacoes SET bacia = 'Quinhevo' , subacia = 'Quinhevo' WHERE subacia = 'Quinhevo';
UPDATE inventario.exploracoes SET loc_bacia = 'Quinhevo' , loc_subaci = 'Quinhevo' WHERE loc_subaci = 'Quinhevo';
UPDATE inventario.fontes SET bacia = 'Quinhevo' , subacia = 'Quinhevo' WHERE subacia = 'Quinhevo';

UPDATE inventario.barragens SET bacia = 'Miézi' , subacia = 'Miézi' WHERE subacia = 'Miezi';
UPDATE inventario.estacoes SET bacia = 'Miézi' , subacia = 'Miézi' WHERE subacia = 'Miezi';
UPDATE inventario.exploracoes SET loc_bacia = 'Quinhevo' , loc_subaci = 'Miézi' WHERE loc_subaci = 'Miezi';
UPDATE inventario.fontes SET bacia = 'Miézi' , subacia = 'Miézi' WHERE subacia = 'Miezi';

UPDATE inventario.barragens SET bacia = 'Miruco' , subacia = 'Miruco' WHERE subacia = 'Miruco';
UPDATE inventario.estacoes SET bacia = 'Miruco' , subacia = 'Miruco' WHERE subacia = 'Miruco';
UPDATE inventario.exploracoes SET loc_bacia = 'Miruco' , loc_subaci = 'Miruco' WHERE loc_subaci = 'Miruco';
UPDATE inventario.fontes SET bacia = 'Miruco' , subacia = 'Miruco' WHERE subacia = 'Miruco';

UPDATE inventario.barragens SET bacia = 'Muaguide' , subacia = 'Muaguide' WHERE subacia = 'Muaguide';
UPDATE inventario.estacoes SET bacia = 'Muaguide' , subacia = 'Muaguide' WHERE subacia = 'Muaguide';
UPDATE inventario.exploracoes SET loc_bacia = 'Muaguide' , loc_subaci = 'Muaguide' WHERE loc_subaci = 'Muaguide';
UPDATE inventario.fontes SET bacia = 'Muaguide' , subacia = 'Muaguide' WHERE subacia = 'Muaguide';

UPDATE inventario.barragens SET bacia = 'Ridi' , subacia = 'Ridi' WHERE subacia = 'Ridi';
UPDATE inventario.estacoes SET bacia = 'Ridi' , subacia = 'Ridi' WHERE subacia = 'Ridi';
UPDATE inventario.exploracoes SET loc_bacia = 'Ridi' , loc_subaci = 'Ridi' WHERE loc_subaci = 'Ridi';
UPDATE inventario.fontes SET bacia = 'Ridi' , subacia = 'Ridi' WHERE subacia = 'Ridi';


UPDATE inventario.barragens SET bacia = 'Tara Quilite' , subacia = 'Tara Quilite' WHERE subacia = 'Tara-Quilite';
UPDATE inventario.estacoes SET bacia = 'Tara Quilite' , subacia = 'Tara Quilite' WHERE subacia = 'Tara-Quilite';
UPDATE inventario.exploracoes SET loc_bacia = 'Tara Quilite' , loc_subaci = 'Tara Quilite' WHERE loc_subaci = 'Tara-Quilite';
UPDATE inventario.fontes SET bacia = 'Tara Quilite' , subacia = 'Tara Quilite' WHERE subacia = 'Tara-Quilite';

UPDATE inventario.barragens SET bacia = 'Muacamula' , subacia = 'Muacamula' WHERE subacia = 'Muacamula';
UPDATE inventario.estacoes SET bacia = 'Muacamula' , subacia = 'Muacamula' WHERE subacia = 'Muacamula';
UPDATE inventario.exploracoes SET loc_bacia = 'Muacamula' , loc_subaci = 'Muacamula' WHERE loc_subaci = 'Muacamula';
UPDATE inventario.fontes SET bacia = 'Muacamula' , subacia = 'Muacamula' WHERE subacia = 'Muacamula';


UPDATE inventario.barragens SET bacia = 'Quigode' , subacia = 'Quigode' WHERE subacia = 'Quigode';
UPDATE inventario.estacoes SET bacia = 'Quigode' , subacia = 'Quigode' WHERE subacia = 'Quigode';
UPDATE inventario.exploracoes SET loc_bacia = 'Quigode' , loc_subaci = 'Quigode' WHERE loc_subaci = 'Quigode';
UPDATE inventario.fontes SET bacia = 'Quigode' , subacia = 'Quigode' WHERE subacia = 'Quigode';

with foo as (select a.gid gid, a.bacia kk, b.nome bacia, b.subacia subacia from inventario.estacoes a join cbase.bacias b on st_intersects(a.geom, b.geom) where a.bacia ilike 'Orla M%' order by gid) update inventario.estacoes e set bacia = foo.bacia, subacia = foo.subacia from foo where e.gid = foo.gid;

-- Actualizamos las del ARA-Sul. Como son datos que se generarán de nuevo
-- podemos ir un poco más agresivo con los cambios
WITH foo AS (
    select e.gid, e.bacia, e.subacia, b.nome cbase_bacia, b.subacia cbase_subacia, b.ara cbase_ara
    from inventario.estacoes e join cbase.bacias b on st_intersects(e.geom, b.geom)
    where b.ara ilike '%ARA Sul%'
)
UPDATE inventario.estacoes ie 
SET bacia = foo.cbase_bacia, subacia = foo.cbase_subacia
FROM foo
WHERE ie.gid = foo.gid
;


DELETE FROM inventario_dominios.bacia WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.subacia WHERE antigua = 'antigua';

UPDATE inventario_dominios.bacia SET app = (SELECT string_to_array(key,';') FROM domains.ara) WHERE antigua = 'nueva';
UPDATE inventario_dominios.subacia SET app = (SELECT string_to_array(key,';') FROM domains.ara) WHERE antigua = 'nueva';

ALTER TABLE inventario_dominios.bacia  DROP COLUMN antigua;
ALTER TABLE inventario_dominios.subacia  DROP COLUMN antigua;


COMMIT;
