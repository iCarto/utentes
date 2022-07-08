/*
No es necesario revisar los dominios, campos UNIQUE o NOT NULL, que haya un
`cadastro` de una sub tabla que no enlace. Esto lo gestionan las CONSTRAINTS
directamente.
*/


ALTER TABLE tmp_fontes_final ADD COLUMN geom geometry(point, 32737);

-- select enlace, count(*) from tmp_fontes_geoms group by enlace order by 2 asc;
-- select enlace, count(*) from tmp_fontes_final group by enlace order by 2 asc;
-- select enlace, count(*) from tmp_fontes_geoms where geom is not null group by enlace order by 2 asc;
-- select cadastro, count(*) from tmp_fontes_final group by cadastro order by 2 asc;

UPDATE tmp_fontes_geoms SET cadastro = trim(cadastro);
UPDATE tmp_fontes_final SET cadastro = trim(cadastro);
UPDATE tmp_fontes_analise SET cadastro = trim(cadastro);
UPDATE tmp_fontes_carac_hidro SET cadastro = trim(cadastro);
UPDATE tmp_fontes_litolia SET cadastro = trim(cadastro);
UPDATE tmp_fontes_quant_agua SET cadastro = trim(cadastro);

-- tmp_fontes_final
-- tmp_fontes_analise
-- tmp_fontes_carac_hidro
-- tmp_fontes_litolia
-- tmp_fontes_quant_agua

-- lo de las geometrías no se pueden pasar a saco porqué puede enlazar mal
UPDATE tmp_fontes_final a SET geom = b.geom FROM tmp_fontes_geoms b WHERE a.cadastro = b.cadastro;

DO $$
BEGIN
    PERFORM
        a.enlace
        , a.cadastro
        , b.enlace
        , b.cadastro
    FROM
        tmp_fontes_geoms b
    LEFT OUTER JOIN tmp_fontes_final a ON a.cadastro = b.cadastro
WHERE
    a.cadastro IS NULL;
    IF FOUND THEN
        RAISE EXCEPTION 'No enlaza bien';
    END IF;
END;
$$;

/*
DELETE FROM tmp_fontes_final where geom is null;
DELETE FROM tmp_fontes_analise where cadastro not in (select cadastro from tmp_fontes_final);
DELETE FROM tmp_fontes_carac_hidro where cadastro not in (select cadastro from tmp_fontes_final);
DELETE FROM tmp_fontes_litolia where cadastro not in (select cadastro from tmp_fontes_final);
DELETE FROM tmp_fontes_quant_agua where cadastro not in (select cadastro from tmp_fontes_final);
*/
