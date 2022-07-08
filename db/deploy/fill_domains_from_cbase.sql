-- Deploy utentes:fill_domains_from_cbase to pg

BEGIN;


ALTER TABLE domains.provincia  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.distrito  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.posto  ADD COLUMN antigua text not null default 'nueva';
UPDATE domains.provincia SET antigua = 'antigua';
UPDATE domains.distrito SET antigua = 'antigua';
UPDATE domains.posto SET antigua = 'antigua';
ALTER TABLE domains.provincia  ADD COLUMN ara text;
ALTER TABLE domains.distrito  ADD COLUMN ara text;
ALTER TABLE domains.posto  ADD COLUMN ara text;

UPDATE domains.provincia SET ara = 'DPMAIP, ' WHERE 'DPMAIP' = ANY(app);
UPDATE domains.distrito SET ara = 'DPMAIP, ' WHERE 'DPMAIP' = ANY(app);
UPDATE domains.posto SET ara = 'DPMAIP, ' WHERE 'DPMAIP' = ANY(app);


INSERT INTO domains.provincia as a (key, ara)
    SELECT nome, ara FROM cbase.provincias
    ON CONFLICT ON CONSTRAINT provincia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, replace(trim(unnest(string_to_array(ara, ','))), 'ARA ', '') v FROM domains.provincia), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.provincia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



INSERT INTO domains.distrito as a (key, parent, ara)
    SELECT nome, loc_provin, ara FROM cbase.distritos
    ON CONFLICT ON CONSTRAINT distrito_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, replace(trim(unnest(string_to_array(ara, ','))), 'ARA ', '') v FROM domains.distrito), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.distrito p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


INSERT INTO domains.posto as a(key, parent, ara)
    SELECT nome, loc_distri, ara FROM cbase.postos
    ON CONFLICT ON CONSTRAINT posto_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, replace(trim(unnest(string_to_array(ara, ','))), 'ARA ', '') v FROM domains.posto), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.posto p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


-- AJUSTES A MANO


DELETE FROM domains.provincia WHERE antigua = 'antigua';
DELETE FROM domains.distrito WHERE antigua = 'antigua';
DELETE FROM domains.posto WHERE antigua = 'antigua';
ALTER TABLE domains.provincia DROP COLUMN antigua;
ALTER TABLE domains.distrito DROP COLUMN antigua;
ALTER TABLE domains.posto DROP COLUMN antigua;
ALTER TABLE domains.provincia DROP COLUMN ara;
ALTER TABLE domains.distrito DROP COLUMN ara;
ALTER TABLE domains.posto DROP COLUMN ara;





ALTER TABLE domains.unidade ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.bacia ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.subacia  ADD COLUMN antigua text not null default 'nueva';
UPDATE domains.unidade SET antigua = 'antigua';
UPDATE domains.bacia SET antigua = 'antigua';
UPDATE domains.subacia SET antigua = 'antigua';
ALTER TABLE domains.unidade ADD COLUMN ara text;
ALTER TABLE domains.bacia ADD COLUMN ara text;
ALTER TABLE domains.subacia  ADD COLUMN ara text;

UPDATE domains.unidade SET ara = 'DPMAIP, ' WHERE 'DPMAIP' = ANY(app);
UPDATE domains.bacia SET ara = 'DPMAIP, ' WHERE 'DPMAIP' = ANY(app);
UPDATE domains.subacia SET ara = 'DPMAIP, ' WHERE 'DPMAIP' = ANY(app);


INSERT INTO domains.unidade as a (key, ara)
    SELECT siglas, string_agg(ara, ', ') as ara FROM cbase.unidades GROUP BY siglas
    ON CONFLICT ON CONSTRAINT unidade_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

INSERT INTO domains.unidade (key, ara) VALUES ('UGBZ', 'ARA Zambeze')
    ON CONFLICT ON CONSTRAINT unidade_key_key
    DO UPDATE SET antigua = 'conflicto', ara = EXCLUDED.ara
;

WITH foo as (select key, parent, replace(trim(unnest(string_to_array(ara, ','))), 'ARA ', '') v FROM domains.unidade), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.unidade p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



INSERT INTO domains.bacia as a (key, parent, ara)
    SELECT nome, unidade, string_agg(DISTINCT ara, ', ') as ara FROM cbase.bacias GROUP BY nome, unidade
    ON CONFLICT ON CONSTRAINT bacia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

UPDATE domains.bacia SET ara = 'ARA Norte, DPMAIP' WHERE key = 'Sem identificar' and parent = 'UGBC';
UPDATE utentes.exploracaos SET loc_bacia = 'Sem identificar' WHERE loc_bacia = 'Sem idenfiticar';

WITH foo as (select key, parent, replace(trim(unnest(string_to_array(ara, ','))), 'ARA ', '') v FROM domains.bacia), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.bacia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


INSERT INTO domains.subacia as a (key, parent, ara)
    SELECT subacia, nome, string_agg(DISTINCT ara, ', ') FROM cbase.bacias GROUP BY subacia, nome
    ON CONFLICT ON CONSTRAINT subacia_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, replace(trim(unnest(string_to_array(ara, ','))), 'ARA ', '') v FROM domains.subacia), bar AS ( select key, parent, array_agg(DISTINCT v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.subacia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


DELETE FROM domains.unidade WHERE antigua = 'antigua';
DELETE FROM domains.bacia WHERE antigua = 'antigua';
DELETE FROM domains.subacia WHERE antigua = 'antigua';
ALTER TABLE domains.unidade DROP COLUMN antigua;
ALTER TABLE domains.bacia DROP COLUMN antigua;
ALTER TABLE domains.subacia DROP COLUMN antigua;
ALTER TABLE domains.unidade DROP COLUMN ara;
ALTER TABLE domains.bacia DROP COLUMN ara;
ALTER TABLE domains.subacia DROP COLUMN ara;

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
