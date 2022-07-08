-- Verify sixhiara:create_postgis_extension on pg

BEGIN;

-- If postgis not exists the function no exists so an error will be raised
SELECT postgis_version();

ROLLBACK;
