-- Test create_table_actividades

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
       'actividades',
	ARRAY[
		'gid',	'exploracao',	'tipo'
	], 'Found expected columns for utentes.actividades'
);

SELECT has_table('actividades');
SELECT has_pk( 'actividades' );

-- gid
SELECT has_column( 'actividades', 'gid' );
SELECT col_type_is(
	'utentes',
	'actividades',
	'gid',
	'integer',
	'Column utentes.actividades.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'actividades',
	'gid',
	'Column utentes.actividades.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'actividades',
	'gid',
	'Column utentes.actividades.gid has default value'
);
SELECT col_is_pk( 'actividades', 'gid', 'Column gid should be the pk');


SELECT has_column(        'actividades', 'exploracao' );
SELECT col_type_is(       'actividades', 'exploracao', 'integer' );
SELECT col_not_null( 'actividades', 'exploracao' );
SELECT col_hasnt_default( 'actividades', 'exploracao' );


SELECT has_column(        'actividades', 'tipo' );
SELECT col_type_is(       'actividades', 'tipo', 'text' );
SELECT col_not_null( 'actividades', 'tipo' );
SELECT col_hasnt_default( 'actividades', 'tipo' );



SELECT table_owner_is ( 'utentes', 'actividades', 'utentes' , 'utentes.actividades owner is utentes');
SELECT finish();

ROLLBACK;
