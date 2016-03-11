-- Test create_table_actividades_industria

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
       'actividades_industria',
	ARRAY[
		'gid',	'exploracao',	'c_estimado',	'tipo',	'instalacio',	'efluente',	'tratamento',	'eval_impac'
	], 'Found expected columns for utentes.actividades_industria'
);

SELECT has_table('actividades_industria');
SELECT has_pk( 'actividades_industria' );

-- gid
SELECT has_column( 'actividades_industria', 'gid' );
SELECT col_type_is(
	'utentes',
	'actividades_industria',
	'gid',
	'integer',
	'Column utentes.actividades_industria.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'actividades_industria',
	'gid',
	'Column utentes.actividades_industria.gid is not nullable'
);
SELECT col_is_pk( 'actividades_industria', 'gid', 'Column gid should be the pk');

SELECT has_column(        'actividades_industria', 'exploracao' );
SELECT col_type_is(       'actividades_industria', 'exploracao', 'integer' );
SELECT col_not_null( 'actividades_industria', 'exploracao' );
SELECT col_hasnt_default( 'actividades_industria', 'exploracao' );


SELECT has_column(        'actividades_industria', 'c_estimado' );
SELECT col_type_is(       'actividades_industria', 'c_estimado', 'numeric(10,2)' );
SELECT col_is_null('actividades_industria', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_industria', 'c_estimado' );


SELECT has_column(        'actividades_industria', 'tipo' );
SELECT col_type_is(       'actividades_industria', 'tipo', 'text' );
SELECT col_is_null('actividades_industria', 'tipo' );
SELECT col_hasnt_default( 'actividades_industria', 'tipo' );


SELECT has_column(        'actividades_industria', 'instalacio' );
SELECT col_type_is(       'actividades_industria', 'instalacio', 'text' );
SELECT col_is_null('actividades_industria', 'instalacio' );
SELECT col_hasnt_default( 'actividades_industria', 'instalacio' );


SELECT has_column(        'actividades_industria', 'efluente' );
SELECT col_type_is(       'actividades_industria', 'efluente', 'text' );
SELECT col_is_null('actividades_industria', 'efluente' );
SELECT col_hasnt_default( 'actividades_industria', 'efluente' );


SELECT has_column(        'actividades_industria', 'tratamento' );
SELECT col_type_is(       'actividades_industria', 'tratamento', 'text' );
SELECT col_is_null('actividades_industria', 'tratamento' );
SELECT col_hasnt_default( 'actividades_industria', 'tratamento' );


SELECT has_column(        'actividades_industria', 'eval_impac' );
SELECT col_type_is(       'actividades_industria', 'eval_impac', 'boolean' );
SELECT col_is_null('actividades_industria', 'eval_impac' );
SELECT col_hasnt_default( 'actividades_industria', 'eval_impac' );




SELECT table_owner_is ( 'utentes', 'actividades_industria', 'utentes' , 'utentes.actividades_industria owner is utentes');
SELECT finish();

ROLLBACK;
