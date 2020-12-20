-- Verify utentes:create_table_cbase_unidades_weap on pg

BEGIN;

SELECT gid, name, rel_postos, geom FROM cbase.unidades_weap;
SELECT gid, name, rel_postos, geom FROM cbase_ara.unidades_weap;

ROLLBACK;
