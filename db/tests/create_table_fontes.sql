-- Test create_table_fontes

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

SELECT plan(55);

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'fontes',
	ARRAY[
		'gid',	'exploracao',	'tipo_agua',	'tipo_fonte',	'lat_lon',	'd_dado',	'c_soli',	'c_max',	'c_real',	'contador',	'metodo_est', 'observacio'
	], 'Found expected columns for utentes.fontes'
);

SELECT has_table('fontes');
SELECT has_pk( 'fontes' );


-- gid
SELECT has_column( 'fontes', 'gid' );
SELECT col_type_is(
	'utentes',
	'fontes',
	'gid',
	'integer',
	'Column utentes.fontes.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'fontes',
	'gid',
	'Column utentes.fontes.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'fontes',
	'gid',
	'Column utentes.fontes.gid has default value'
);
SELECT col_is_pk( 'fontes', 'gid', 'Column gid should be the pk');


SELECT has_column(        'fontes', 'exploracao' );
SELECT col_type_is(       'fontes', 'exploracao', 'integer' );
SELECT col_not_null( 'fontes', 'exploracao' );
SELECT col_hasnt_default( 'fontes', 'exploracao' );
SELECT fk_ok('fontes', 'exploracao', 'exploracaos', 'gid'); -- Maybe not a good test
SELECT col_is_fk('fontes', 'exploracao', 'Columns exploracao should be a fk');



SELECT has_column(        'fontes', 'tipo_agua' );
SELECT col_type_is(       'fontes', 'tipo_agua', 'text' );
SELECT col_not_null( 'fontes', 'tipo_agua' );
SELECT col_hasnt_default( 'fontes', 'tipo_agua' );


SELECT has_column(        'fontes', 'tipo_fonte' );
SELECT col_type_is(       'fontes', 'tipo_fonte', 'text' );
SELECT col_is_null('fontes', 'tipo_fonte' );
SELECT col_hasnt_default( 'fontes', 'tipo_fonte' );


SELECT has_column(        'fontes', 'lat_lon' );
SELECT col_type_is(       'fontes', 'lat_lon', 'text' );
SELECT col_is_null('fontes', 'lat_lon' );
SELECT col_hasnt_default( 'fontes', 'lat_lon' );

SELECT has_column(        'fontes', 'observacio' );
SELECT col_type_is(       'fontes', 'observacio', 'text' );
SELECT col_is_null('fontes', 'observacio' );
SELECT col_hasnt_default( 'fontes', 'observacio' );


SELECT has_column(        'fontes', 'd_dado' );
SELECT col_type_is(       'fontes', 'd_dado', 'date' );
SELECT col_is_null('fontes', 'd_dado' );
SELECT col_hasnt_default( 'fontes', 'd_dado' );


SELECT has_column(        'fontes', 'c_soli' );
SELECT col_type_is(       'fontes', 'c_soli', 'numeric(10,2)' );
SELECT col_is_null('fontes', 'c_soli' );
SELECT col_hasnt_default( 'fontes', 'c_soli' );


SELECT has_column(        'fontes', 'c_max' );
SELECT col_type_is(       'fontes', 'c_max', 'numeric(10,2)' );
SELECT col_is_null('fontes', 'c_max' );
SELECT col_hasnt_default( 'fontes', 'c_max' );


SELECT has_column(        'fontes', 'c_real' );
SELECT col_type_is(       'fontes', 'c_real', 'numeric(10,2)' );
SELECT col_is_null('fontes', 'c_real' );
SELECT col_hasnt_default( 'fontes', 'c_real' );


SELECT has_column(        'fontes', 'contador' );
SELECT col_type_is(       'fontes', 'contador', 'boolean' );
SELECT col_is_null('fontes', 'contador' );
SELECT col_hasnt_default( 'fontes', 'contador' );


SELECT has_column(        'fontes', 'metodo_est' );
SELECT col_type_is(       'fontes', 'metodo_est', 'text' );
SELECT col_is_null('fontes', 'metodo_est' );
SELECT col_hasnt_default( 'fontes', 'metodo_est' );




SELECT table_owner_is ( 'utentes', 'fontes', 'utentes' , 'utentes.fontes owner is utentes');
SELECT finish();

ROLLBACK;
