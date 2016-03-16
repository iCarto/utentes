-- Test create_table_actividades_reses

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
       'actividades_reses',
	ARRAY[
		'gid',	'actividade',	'c_estimado',	'reses_tipo',	'reses_nro',	'c_res',	'observacio'
	], 'Found expected columns for utentes.actividades_reses'
);

SELECT has_table('actividades_reses');
SELECT has_pk( 'actividades_reses' );

SELECT has_column( 'actividades_reses', 'gid' );
SELECT col_type_is( 'utentes', 'actividades_reses', 'gid', 'integer',
	'Column utentes.actividades_reses.gid is type integer' );
SELECT col_not_null( 'utentes', 'actividades_reses', 'gid',
	'Column utentes.actividades_agricultura_rega.gid is not nullable' );
SELECT col_has_default( 'utentes', 'actividades_reses', 'gid',
	'Column utentes.actividades_agricultura_rega.gid has default value');
SELECT col_is_pk( 'actividades_reses', 'gid', 'Column gid should be the pk');




SELECT has_column(        'actividades_reses', 'actividade' );
SELECT col_type_is(       'actividades_reses', 'actividade', 'integer' );
SELECT col_not_null( 'actividades_reses', 'actividade' );
SELECT col_hasnt_default( 'actividades_reses', 'actividade' );





SELECT has_column(        'actividades_reses', 'c_estimado' );
SELECT col_type_is(       'actividades_reses', 'c_estimado', 'numeric(10,2)' );
SELECT col_not_null( 'actividades_reses', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_reses', 'c_estimado' );





SELECT has_column(        'actividades_reses', 'reses_tipo' );
SELECT col_type_is(       'actividades_reses', 'reses_tipo', 'text' );
SELECT col_not_null( 'actividades_reses', 'reses_tipo' );
SELECT col_hasnt_default( 'actividades_reses', 'reses_tipo' );





SELECT has_column(        'actividades_reses', 'reses_nro' );
SELECT col_type_is(       'actividades_reses', 'reses_nro', 'integer' );
SELECT col_not_null( 'actividades_reses', 'reses_nro' );
SELECT col_hasnt_default( 'actividades_reses', 'reses_nro' );





SELECT has_column(        'actividades_reses', 'c_res' );
SELECT col_type_is(       'actividades_reses', 'c_res', 'integer' );
SELECT col_not_null( 'actividades_reses', 'c_res' );
SELECT col_hasnt_default( 'actividades_reses', 'c_res' );





SELECT has_column(        'actividades_reses', 'observacio' );
SELECT col_type_is(       'actividades_reses', 'observacio', 'text' );
SELECT col_is_null('actividades_reses', 'observacio' );
SELECT col_hasnt_default( 'actividades_reses', 'observacio' );





SELECT table_owner_is ( 'utentes', 'actividades_reses', 'utentes' , 'utentes.actividades_reses owner is utentes');
SELECT finish();

ROLLBACK;
