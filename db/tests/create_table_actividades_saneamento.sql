-- Test create_table_actividades_saneamento

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
       'actividades_saneamento',
	ARRAY[
		'gid',	'exploracao',	'c_estimado',	'habitantes'
	], 'Found expected columns for utentes.actividades_saneamento'
);

SELECT has_table('actividades_saneamento');
SELECT has_pk( 'actividades_saneamento' );

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

SELECT has_column(        'actividades_saneamento', 'exploracao' );
SELECT col_type_is(       'actividades_saneamento', 'exploracao', 'integer' );
SELECT col_not_null( 'actividades_saneamento', 'exploracao' );
SELECT col_hasnt_default( 'actividades_saneamento', 'exploracao' );


SELECT has_column(        'actividades_saneamento', 'c_estimado' );
SELECT col_type_is(       'actividades_saneamento', 'c_estimado', 'numeric(10,2)' );
SELECT col_is_null('actividades_saneamento', 'c_estimado' );
SELECT col_hasnt_default( 'actividades_saneamento', 'c_estimado' );


SELECT has_column(        'actividades_saneamento', 'habitantes' );
SELECT col_type_is(       'actividades_saneamento', 'habitantes', 'integer' );
SELECT col_is_null('actividades_saneamento', 'habitantes' );
SELECT col_hasnt_default( 'actividades_saneamento', 'habitantes' );




SELECT table_owner_is ( 'utentes', 'actividades_saneamento', 'utentes' , 'utentes.actividades_saneamento owner is utentes');
SELECT finish();

ROLLBACK;
