--
-- ute_domains_loc_adm
--

ALTER TABLE domains.provincia  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.distrito  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.posto  ADD COLUMN antigua text not null default 'nueva';
UPDATE domains.provincia SET antigua = 'antigua';
UPDATE domains.distrito SET antigua = 'antigua';
UPDATE domains.posto SET antigua = 'antigua';
ALTER TABLE domains.provincia  ADD COLUMN ara text;
ALTER TABLE domains.distrito  ADD COLUMN ara text;
ALTER TABLE domains.posto  ADD COLUMN ara text;



INSERT INTO domains.provincia as a (key, ara)
    SELECT nome, ara FROM cbase.provincias
    ON CONFLICT ON CONSTRAINT provincia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH
foo as (
    select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.provincia
)
, bar AS (
    select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent
)
update domains.provincia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



INSERT INTO domains.distrito as a (key, parent, ara)
    SELECT nome, loc_provin, ara FROM cbase.distritos
    ON CONFLICT ON CONSTRAINT distrito_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.distrito), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.distrito p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


INSERT INTO domains.posto as a(key, parent, ara)
    SELECT nome, loc_distri, ara FROM cbase.postos
    ON CONFLICT ON CONSTRAINT posto_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.posto), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.posto p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');







--
-- inv_domains_loc_adm
--

ALTER TABLE inventario_dominios.provincia  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.distrito  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.posto  ADD COLUMN antigua text not null default 'nueva';
UPDATE inventario_dominios.provincia SET antigua = 'antigua';
UPDATE inventario_dominios.distrito SET antigua = 'antigua';
UPDATE inventario_dominios.posto SET antigua = 'antigua';
ALTER TABLE inventario_dominios.provincia  ADD COLUMN ara text;
ALTER TABLE inventario_dominios.distrito  ADD COLUMN ara text;
ALTER TABLE inventario_dominios.posto  ADD COLUMN ara text;



INSERT INTO inventario_dominios.provincia as a (key, ara)
    SELECT nome, ara FROM cbase.provincias
    ON CONFLICT ON CONSTRAINT provincia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH
foo as (
    select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.provincia
)
, bar AS (
    select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent
)
update inventario_dominios.provincia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



INSERT INTO inventario_dominios.distrito as a (key, parent, ara)
    SELECT nome, loc_provin, ara FROM cbase.distritos
    ON CONFLICT ON CONSTRAINT distrito_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.distrito), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update inventario_dominios.distrito p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


INSERT INTO inventario_dominios.posto as a(key, parent, ara)
    SELECT nome, loc_distri, ara FROM cbase.postos
    ON CONFLICT ON CONSTRAINT posto_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.posto), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update inventario_dominios.posto p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');

--
-- Update inventario and utente data for new locations
--

/* REPLACE THIS: UPDATE DATA FOR NEW LOCATIONS */




--
-- clean up ute_domains_loc_adm
--

DELETE FROM domains.provincia WHERE antigua = 'antigua';
DELETE FROM domains.distrito WHERE antigua = 'antigua';
DELETE FROM domains.posto WHERE antigua = 'antigua';
ALTER TABLE domains.provincia DROP COLUMN antigua;
ALTER TABLE domains.distrito DROP COLUMN antigua;
ALTER TABLE domains.posto DROP COLUMN antigua;
ALTER TABLE domains.provincia DROP COLUMN ara;
ALTER TABLE domains.distrito DROP COLUMN ara;
ALTER TABLE domains.posto DROP COLUMN ara;


--
-- clean up inv_domains_loc_adm
--


DELETE FROM inventario_dominios.provincia WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.distrito WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.posto WHERE antigua = 'antigua';
ALTER TABLE inventario_dominios.provincia DROP COLUMN antigua;
ALTER TABLE inventario_dominios.distrito DROP COLUMN antigua;
ALTER TABLE inventario_dominios.posto DROP COLUMN antigua;
ALTER TABLE inventario_dominios.provincia DROP COLUMN ara;
ALTER TABLE inventario_dominios.distrito DROP COLUMN ara;
ALTER TABLE inventario_dominios.posto DROP COLUMN ara;

DELETE FROM inventario_dominios.provincia WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);
DELETE FROM inventario_dominios.distrito WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);
DELETE FROM inventario_dominios.posto WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);


REFRESH MATERIALIZED VIEW domains.domains;

