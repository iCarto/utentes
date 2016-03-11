-- Test create_table_actividades_abastecemento

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
       'actividades_abastecemento',
	ARRAY[
		'gid',	'exploracao',	'c_estimado',	'habitantes',	'dotacao'
	], 'Found expected columns for utentes.actividades_abastecemento'
);

SELECT has_table('actividades_abastecemento');
SELECT has_pk( 'actividades_abastecemento' );

-- gid
SELECT has_column( 'actividades_abastecemento', 'gid' );
SELECT col_type_is(
	'utentes',
	'actividades_abastecemento',
	'gid',
	'integer',
	'Column utentes.actividades_abastecemento.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'actividades_abastecemento',
	'gid',
	'Column utentes.actividades_abastecemento.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'actividades_abastecemento',
	'gid',
	'Column utentes.actividades_abastecemento.gid has default value'
);
SELECT col_is_pk( 'actividades_abastecemento', 'gid', 'Column gid should be the pk');

SELECT has_column(        'actividades_abastecemento', 'exploracao' );
SELECT col_type_is(       'actividades_abastecemento', 'exploracao', 'integer' );
SELECT col_not_null( 'actividades_abastecemento', 'exploracao' );
SELECT col_hasnt_default( 'actividades_abastecemento', 'exploracao' );


SELECT has_column(        'actividades_abastecemento', 'c_estimado' );
SELECT col_type_is(       'actividades_abastecemento', 'c_estimado', 'numeric(10,2)' );
SELECT col_not_null( 'actividades_abastecemento', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_abastecemento', 'c_estimado' );


SELECT has_column(        'actividades_abastecemento', 'habitantes' );
SELECT col_type_is(       'actividades_abastecemento', 'habitantes', 'integer' );
SELECT col_not_null( 'actividades_abastecemento', 'habitantes' );
SELECT col_has_default(   'actividades_abastecemento', 'habitantes' );


SELECT has_column(        'actividades_abastecemento', 'dotacao' );
SELECT col_type_is(       'actividades_abastecemento', 'dotacao', 'integer' );
SELECT col_not_null( 'actividades_abastecemento', 'dotacao' );
SELECT col_hasnt_default( 'actividades_abastecemento', 'dotacao' );




SELECT table_owner_is ( 'utentes', 'actividades_abastecemento', 'utentes' , 'utentes.actividades_abastecemento owner is utentes');
SELECT finish();

ROLLBACK;
