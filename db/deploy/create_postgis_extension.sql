-- Deploy sixhiara:create_postgis_extension to pg

BEGIN;

CREATE EXTENSION postgis;

ALTER VIEW public.geometry_columns OWNER TO sixhiara_owner;
ALTER VIEW public.geography_columns OWNER TO sixhiara_owner;
ALTER TABLE public.spatial_ref_sys OWNER TO sixhiara_owner;

COMMIT;
