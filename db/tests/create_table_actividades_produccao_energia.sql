-- Test create_table_actividades_produccao_energia

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
       'actividades_produccao_energia',
	ARRAY[
		'gid',	'exploracao',	'c_estimado',	'tipo',	'alt_agua',	'potencia',	'equipo',	'eval_impac'
	], 'Found expected columns for utentes.actividades_produccao_energia'
);

SELECT has_table('actividades_produccao_energia');
SELECT has_pk( 'actividades_produccao_energia' );

-- gid
SELECT has_column( 'actividades_produccao_energia', 'gid' );
SELECT col_type_is(
	'utentes',
	'actividades_produccao_energia',
	'gid',
	'integer',
	'Column utentes.actividades_produccao_energia.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'actividades_produccao_energia',
	'gid',
	'Column utentes.actividades_produccao_energia.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'actividades_produccao_energia',
	'gid',
	'Column utentes.actividades_produccao_energia.gid has default value'
);
SELECT col_is_pk( 'actividades_produccao_energia', 'gid', 'Column gid should be the pk');

SELECT has_column(        'actividades_produccao_energia', 'exploracao' );
SELECT col_type_is(       'actividades_produccao_energia', 'exploracao', 'integer' );
SELECT col_not_null( 'actividades_produccao_energia', 'exploracao' );
SELECT col_hasnt_default( 'actividades_produccao_energia', 'exploracao' );


SELECT has_column(        'actividades_produccao_energia', 'c_estimado' );
SELECT col_type_is(       'actividades_produccao_energia', 'c_estimado', 'numeric(10,2)' );
SELECT col_is_null('actividades_produccao_energia', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_produccao_energia', 'c_estimado' );


SELECT has_column(        'actividades_produccao_energia', 'tipo' );
SELECT col_type_is(       'actividades_produccao_energia', 'tipo', 'text' );
SELECT col_is_null('actividades_produccao_energia', 'tipo' );
SELECT col_hasnt_default( 'actividades_produccao_energia', 'tipo' );


SELECT has_column(        'actividades_produccao_energia', 'alt_agua' );
SELECT col_type_is(       'actividades_produccao_energia', 'alt_agua', 'numeric(10,2)' );
SELECT col_is_null('actividades_produccao_energia', 'alt_agua' );
SELECT col_hasnt_default( 'actividades_produccao_energia', 'alt_agua' );


SELECT has_column(        'actividades_produccao_energia', 'potencia' );
SELECT col_type_is(       'actividades_produccao_energia', 'potencia', 'numeric(10,2)' );
SELECT col_is_null('actividades_produccao_energia', 'potencia' );
SELECT col_hasnt_default( 'actividades_produccao_energia', 'potencia' );


SELECT has_column(        'actividades_produccao_energia', 'equipo' );
SELECT col_type_is(       'actividades_produccao_energia', 'equipo', 'text' );
SELECT col_is_null('actividades_produccao_energia', 'equipo' );
SELECT col_hasnt_default( 'actividades_produccao_energia', 'equipo' );


SELECT has_column(        'actividades_produccao_energia', 'eval_impac' );
SELECT col_type_is(       'actividades_produccao_energia', 'eval_impac', 'boolean' );
SELECT col_is_null('actividades_produccao_energia', 'eval_impac' );
SELECT col_hasnt_default( 'actividades_produccao_energia', 'eval_impac' );




SELECT table_owner_is ( 'utentes', 'actividades_produccao_energia', 'utentes' , 'utentes.actividades_produccao_energia owner is utentes');
SELECT finish();

ROLLBACK;
