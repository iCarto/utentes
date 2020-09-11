-- Verify utentes:alter_table_utentes_fontes_with_inventario_columns on pg

BEGIN;

-- Ya no hay datos con tip_fonte = 'Outros'
DO $$
BEGIN
    PERFORM true
       FROM inventario.fontes
        WHERE tip_fonte = 'Outros';
    IF FOUND THEN
        RAISE EXCEPTION 'Outros found in inventario';
    END IF;

    PERFORM true
       FROM utentes.fontes
        WHERE tipo_fonte = 'Outros';
    IF FOUND THEN
        RAISE EXCEPTION 'Outros found in inventario';
    END IF;
END;
$$;


SELECT key from domains.red_monit WHERE false;

-- red_monit es NOT NULL
SELECT 1/count(*)
FROM information_schema.columns
WHERE table_schema = 'inventario' AND table_name = 'fontes' and column_name = 'red_monit' AND is_nullable = 'NO';

SELECT 1/count(*)
FROM information_schema.columns
WHERE table_schema = 'utentes' AND table_name = 'fontes' and column_name = 'red_monit' AND is_nullable = 'NO';

-- La tabla tip_fonte ha sido borrada. Y por tanto la FK también
SELECT 1/(count(*)-1) FROM information_schema.tables
WHERE table_schema = 'inventario_dominios' AND table_name='tip_fonte';



SELECT
    red_monit
   , bombeo
   , prof_pozo
   , diametro
FROM utentes.fontes
WHERE false
;

-- red_monit está en la vista de dominios
SELECT 1/count(*) FROM domains.domains WHERE category = 'red_monit';

ROLLBACK;
