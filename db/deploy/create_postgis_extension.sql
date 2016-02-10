-- Deploy utentes:create_postgis_extension to pg

BEGIN;

CREATE EXTENSION postgis;
ALTER TABLE public.geometry_columns OWNER TO utentes;
ALTER TABLE public.geography_columns OWNER TO utentes;
ALTER TABLE public.spatial_ref_sys OWNER TO utentes;

COMMIT;
