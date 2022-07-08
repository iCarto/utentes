-- Deploy utentes:create_table_cbase_unidades_weap to pg

BEGIN;

CREATE TABLE cbase.unidades_weap (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    objid integer,
    basinid integer,
    name character varying(80),
    numcells bigint,
    area_km2 double precision,
    pourptlon double precision,
    pourptlat double precision,
    headfptlon double precision,
    headfptlat double precision,
    ldrawriver character varying(1),
    riverid integer,
    lriverend character varying(1),
    inflowlon double precision,
    inflowlat double precision,
    minelev integer,
    maxelev integer,
    avgelev integer,
    rel_postos text[],
    ara text NOT NULL,
    geom public.geometry(MultiPolygon,32737)
);

CREATE INDEX ON cbase.unidades_weap USING GIST (geom);
REVOKE ALL ON TABLE cbase.unidades_weap FROM PUBLIC;
GRANT SELECT ON TABLE cbase.unidades_weap TO :base_user;


CREATE TABLE cbase_ara.unidades_weap (
    gid int PRIMARY KEY REFERENCES cbase.unidades_weap(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    objid integer,
    basinid integer,
    name character varying(80),
    numcells bigint,
    area_km2 double precision,
    pourptlon double precision,
    pourptlat double precision,
    headfptlon double precision,
    headfptlat double precision,
    ldrawriver character varying(1),
    riverid integer,
    lriverend character varying(1),
    inflowlon double precision,
    inflowlat double precision,
    minelev integer,
    maxelev integer,
    avgelev integer,
    rel_postos text[],
    ara text NOT NULL,
    geom public.geometry(MultiPolygon,32737)
);

CREATE INDEX ON cbase_ara.unidades_weap USING GIST (geom);
REVOKE ALL ON TABLE cbase_ara.unidades_weap FROM PUBLIC;
GRANT SELECT ON TABLE cbase_ara.unidades_weap TO :base_user;

COMMIT;
