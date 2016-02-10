-- Verify utentes:create_postgis_extension on pg

BEGIN;

-- If postgis not exists the function no exists so an error will be raised
SELECT ST_GeomFromText('LINESTRING(-71.160281 42.258729,-71.160837 42.259113,-71.161144 42.25932)');

ROLLBACK;
