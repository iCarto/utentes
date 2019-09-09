-- Deploy utentes:adds_missing_postos_lincom_risunodo_velha to pg

BEGIN;


-- ARAZ: 'Ilha Licom', 'Ilha Risunodo'
INSERT INTO cbase.postos (nome, loc_distri, loc_provin, censo_2007, ara, geom)
    SELECT nome, nome, loc_provin, censo_2007, ara, geom FROM cbase.distritos WHERE nome IN ('Ilha Licom', 'Ilha Risunodo');

INSERT INTO cbase_ara.postos (gid, nome, loc_distri, loc_provin, censo_2007, ara, geom)
    SELECT (SELECT a.gid FROM cbase.postos a WHERE a.nome = b.nome), nome, nome, loc_provin, censo_2007, ara, geom FROM cbase_ara.distritos b WHERE nome IN ('Ilha Licom', 'Ilha Risunodo');

INSERT INTO inventario_dominios.posto (key, parent, app)
    SELECT 'Ilha Licom', 'Ilha Licom', '{Zambeze}'::text[] FROM domains.ara WHERE key = 'Zambeze'
    UNION
    SELECT 'Ilha Licom', 'Ilha Risunodo', '{Zambeze}'::text[] FROM domains.ara WHERE key = 'Zambeze';
;

INSERT INTO domains.posto (key, parent, app)
    SELECT key, key, app FROM domains.distrito WHERE key IN ('Ilha Licom', 'Ilha Risunodo');

-- ARACN: Nacala A Velha
UPDATE cbase.postos SET loc_distri = 'Nacala A Velha' WHERE loc_distri = 'Nacala-A-Velha';
UPDATE cbase_ara.postos SET loc_distri = 'Nacala A Velha' WHERE loc_distri = 'Nacala-A-Velha';
UPDATE domains.posto SET parent = 'Nacala A Velha' WHERE parent = 'Nacala-A-Velha';

REFRESH MATERIALIZED VIEW domains.domains;
COMMIT;
