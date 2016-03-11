-- Test create_table_actividades_piscicultura

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
-- SELECT plan(1);

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'actividades_piscicultura',
	ARRAY[
		'gid',	'c_estimado',	'area',	'v_reservas'
	], 'Found expected columns for utentes.actividades_piscicultura'
);

SELECT has_table('actividades_piscicultura');
SELECT has_pk( 'actividades_piscicultura' );

-- gid
SELECT has_column( 'actividades_piscicultura', 'gid' );
SELECT col_type_is(
	'utentes',
	'actividades_piscicultura',
	'gid',
	'integer',
	'Column utentes.actividades_piscicultura.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'actividades_piscicultura',
	'gid',
	'Column utentes.actividades_piscicultura.gid is not nullable'
);
SELECT col_is_pk( 'actividades_piscicultura', 'gid', 'Column gid should be the pk');

SELECT has_column(        'actividades_piscicultura', 'c_estimado' );
SELECT col_type_is(       'actividades_piscicultura', 'c_estimado', 'numeric(10,2)' );
SELECT col_is_null('actividades_piscicultura', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_piscicultura', 'c_estimado' );


SELECT has_column(        'actividades_piscicultura', 'area' );
SELECT col_type_is(       'actividades_piscicultura', 'area', 'numeric(10,2)' );
SELECT col_is_null('actividades_piscicultura', 'area' );
SELECT col_hasnt_default( 'actividades_piscicultura', 'area' );


SELECT has_column(        'actividades_piscicultura', 'v_reservas' );
SELECT col_type_is(       'actividades_piscicultura', 'v_reservas', 'numeric(10,2)' );
SELECT col_is_null('actividades_piscicultura', 'v_reservas' );
SELECT col_hasnt_default( 'actividades_piscicultura', 'v_reservas' );




SELECT table_owner_is ( 'utentes', 'actividades_piscicultura', 'utentes' , 'utentes.actividades_piscicultura owner is utentes');
SELECT finish();

ROLLBACK;
