-- Test create_table_actividades_cultivos

\set ECHO none
\set QUIET 1
-- Turn off echo and keep things quiet.

-- Format the output for nice TAP.
\pset format unaligned
\pset tuples_only true
\pset pager

-- Revert all changes on failure.
\set ON_ERROR_ROLLBACK 1
\set ON_ERROR_STOP true
\set QUIET 1

-- Load the TAP functions.
SET client_min_messages TO warning;
CREATE EXTENSION IF NOT EXISTS pgtap;
RESET client_min_messages;

BEGIN;
SELECT no_plan();

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'actividades_cultivos',
	ARRAY[
		'gid',	'cult_id', 'actividade',	'c_estimado',	'cultivo',	'rega',	'eficiencia',	'area',	'observacio',	'the_geom'
	], 'Found expected columns for utentes.actividades_cultivos'
);

SELECT has_table('actividades_cultivos');
SELECT has_pk( 'actividades_cultivos' );
SELECT has_column( 'actividades_cultivos', 'gid' );
SELECT col_type_is( 'utentes', 'actividades_cultivos', 'gid', 'integer',
	'Column utentes.actividades_cultivos.gid is type integer' );
SELECT col_not_null( 'utentes', 'actividades_cultivos', 'gid',
	'Column utentes.actividades_agricultura_rega.gid is not nullable' );
SELECT col_has_default( 'utentes', 'actividades_cultivos', 'gid',
	'Column utentes.actividades_agricultura_rega.gid has default value');
SELECT col_is_pk( 'actividades_cultivos', 'gid', 'Column gid should be the pk');


SELECT has_column( 'actividades_cultivos', 'cult_id' );
SELECT col_type_is( 'utentes', 'actividades_cultivos', 'cult_id', 'text',
	'Column utentes.actividades_cultivos.cult_id is type text' );
SELECT col_not_null( 'utentes', 'actividades_cultivos', 'cult_id',
	'Column utentes.actividades_cultivos.cult_id is not nullable' );
SELECT col_hasnt_default( 'actividades_cultivos', 'cult_id' );
SELECT col_is_unique( 'actividades_cultivos', 'cult_id', 'Column culd_id  should be unique');



SELECT has_column(        'actividades_cultivos', 'actividade' );
SELECT col_type_is(       'actividades_cultivos', 'actividade', 'integer' );
SELECT col_not_null( 'actividades_cultivos', 'actividade' );
SELECT col_hasnt_default( 'actividades_cultivos', 'actividade' );




SELECT has_column(        'actividades_cultivos', 'c_estimado' );
SELECT col_type_is(       'actividades_cultivos', 'c_estimado', 'numeric(10,2)' );
SELECT col_not_null( 'actividades_cultivos', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_cultivos', 'c_estimado' );




SELECT has_column(        'actividades_cultivos', 'cultivo' );
SELECT col_type_is(       'actividades_cultivos', 'cultivo', 'text' );
SELECT col_not_null( 'actividades_cultivos', 'cultivo' );
SELECT col_hasnt_default( 'actividades_cultivos', 'cultivo' );




SELECT has_column(        'actividades_cultivos', 'rega' );
SELECT col_type_is(       'actividades_cultivos', 'rega', 'text' );
SELECT col_not_null( 'actividades_cultivos', 'rega' );
SELECT col_hasnt_default( 'actividades_cultivos', 'rega' );




SELECT has_column(        'actividades_cultivos', 'eficiencia' );
SELECT col_type_is(       'actividades_cultivos', 'eficiencia', 'numeric(10,2)' );
SELECT col_not_null( 'actividades_cultivos', 'eficiencia' );
SELECT col_hasnt_default( 'actividades_cultivos', 'eficiencia' );




SELECT has_column(        'actividades_cultivos', 'area' );
SELECT col_type_is(       'actividades_cultivos', 'area', 'numeric(10,2)' );
SELECT col_is_null( 'actividades_cultivos', 'area' );
SELECT col_hasnt_default( 'actividades_cultivos', 'area' );




SELECT has_column(        'actividades_cultivos', 'observacio' );
SELECT col_type_is(       'actividades_cultivos', 'observacio', 'text' );
SELECT col_is_null('actividades_cultivos', 'observacio' );
SELECT col_hasnt_default( 'actividades_cultivos', 'observacio' );




SELECT has_column(        'actividades_cultivos', 'the_geom' );
SELECT col_type_is(       'actividades_cultivos', 'the_geom', 'geometry(MultiPolygon,32737)' );
SELECT col_hasnt_default( 'actividades_cultivos', 'the_geom' );




SELECT table_owner_is ( 'utentes', 'actividades_cultivos', 'utentes' , 'utentes.actividades_cultivos owner is utentes');
SELECT finish();

ROLLBACK;
