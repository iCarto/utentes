-- Verify sixhiara:create_elle on pg

BEGIN;

-- SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'elle' AND schema_owner='sixhiara_owner';
SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'elle' ;

-- SELECT 1 / pg_catalog.has_schema_privilege('sixhiara_owner', 'elle', 'usage')::int;
-- SELECT 1 / pg_catalog.has_schema_privilege('elle_read', 'elle', 'usage')::int;

-- SELECT 1/(pg_catalog.has_schema_privilege('public', 'elle', 'usage')::int - 1);


SELECT mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador
FROM elle._map
WHERE FALSE;

SELECT mapa, nombre_capa, schema, posicion, nombre_tabla
FROM elle._map_overview
WHERE FALSE;

SELECT nombre_capa, nombre_estilo, tipo, definicion, label
FROM elle._map_overview_style
WHERE FALSE;

SELECT nombre_capa, nombre_estilo, type, definicion, label
FROM elle._map_style
WHERE FALSE;

-- SELECT 1/has_table_privilege('elle_read', 'elle._map', 'SELECT')::int;
-- SELECT 1/has_table_privilege('elle_write', 'elle._map', 'INSERT, UPDATE, DELETE')::int;

-- SELECT 1/has_table_privilege('elle_read', 'elle._map_style', 'SELECT')::int;
-- SELECT 1/has_table_privilege('elle_write', 'elle._map_style', 'INSERT, UPDATE, DELETE')::int;

-- SELECT 1/has_table_privilege('elle_read', 'elle._map_overview', 'SELECT')::int;
-- SELECT 1/has_table_privilege('elle_write', 'elle._map_overview', 'INSERT, UPDATE, DELETE')::int;

-- SELECT 1/has_table_privilege('elle_read', 'elle._map_overview_style', 'SELECT')::int;
-- SELECT 1/has_table_privilege('elle_write', 'elle._map_overview_style', 'INSERT, UPDATE, DELETE')::int;

ROLLBACK;
