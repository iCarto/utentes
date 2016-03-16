-- Test create_table_actividades_pecuaria

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
       'actividades_pecuaria',
	ARRAY[
		'gid',	'c_estimado'
	], 'Found expected columns for utentes.actividades_pecuaria'
);

SELECT has_table('actividades_pecuaria');
SELECT has_pk( 'actividades_pecuaria' );

SELECT has_column( 'actividades_pecuaria', 'gid' );
SELECT col_type_is( 'utentes', 'actividades_pecuaria', 'gid', 'integer',
	'Column utentes.actividades_pecuaria.gid is type integer' );
SELECT col_not_null( 'utentes', 'actividades_pecuaria', 'gid',
	'Column utentes.actividades_agricultura_rega.gid is not nullable' );
SELECT col_is_pk( 'actividades_pecuaria', 'gid', 'Column gid should be the pk');




SELECT has_column(        'actividades_pecuaria', 'c_estimado' );
SELECT col_type_is(       'actividades_pecuaria', 'c_estimado', 'numeric(10,2)' );
SELECT col_not_null( 'actividades_pecuaria', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_pecuaria', 'c_estimado' );





SELECT table_owner_is ( 'utentes', 'actividades_pecuaria', 'utentes' , 'utentes.actividades_pecuaria owner is utentes');
SELECT finish();

ROLLBACK;
