-- Test create_table_actividades_agricultura_rega

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
       'actividades_agricultura_rega',
	ARRAY[
		'gid',	'exploracao',	'c_estimado'
	], 'Found expected columns for utentes.actividades_agricultura_rega'
);

SELECT has_table('actividades_agricultura_rega');
SELECT has_pk( 'actividades_agricultura_rega' );

-- gid
SELECT has_column( 'actividades_agricultura_rega', 'gid' );
SELECT col_type_is(
	'utentes',
	'actividades_agricultura_rega',
	'gid',
	'integer',
	'Column utentes.actividades_agricultura_rega.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'actividades_agricultura_rega',
	'gid',
	'Column utentes.actividades_agricultura_rega.gid is not nullable'
);
SELECT col_is_pk( 'actividades_agricultura_rega', 'gid', 'Column gid should be the pk');

SELECT has_column(        'actividades_agricultura_rega', 'exploracao' );
SELECT col_type_is(       'actividades_agricultura_rega', 'exploracao', 'integer' );
SELECT col_not_null( 'actividades_agricultura_rega', 'exploracao' );
SELECT col_hasnt_default( 'actividades_agricultura_rega', 'exploracao' );


SELECT has_column(        'actividades_agricultura_rega', 'c_estimado' );
SELECT col_type_is(       'actividades_agricultura_rega', 'c_estimado', 'numeric(10,2)' );
SELECT col_not_null( 'actividades_agricultura_rega', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_agricultura_rega', 'c_estimado' );




SELECT table_owner_is ( 'utentes', 'actividades_agricultura_rega', 'utentes' , 'utentes.actividades_agricultura_rega owner is utentes');
SELECT finish();

ROLLBACK;
