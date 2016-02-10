-- Test create_table_licencias

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

SELECT plan(60);

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'licencias',
	ARRAY[
		'gid',	'lic_nro',	'lic_tipo',	'exploracao',	'cadastro',	'd_emissao',	'd_validade',	'd_solici',	'estado',	'c_requerid',	'c_licencia',	'c_real',	'c_real_int'
	], 'Found expected columns for utentes.licencias'
);

SELECT has_table('licencias');
SELECT has_pk( 'licencias' );


-- gid
SELECT has_column( 'licencias', 'gid' );
SELECT col_type_is(
	'utentes',
	'licencias',
	'gid',
	'integer',
	'Column utentes.licencias.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'licencias',
	'gid',
	'Column utentes.licencias.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'licencias',
	'gid',
	'Column utentes.licencias.gid has default value'
);
SELECT col_is_pk( 'licencias', 'gid', 'Column gid should be the pk');


SELECT has_column(        'licencias', 'lic_nro' );
SELECT col_type_is(       'licencias', 'lic_nro', 'text' );
SELECT col_not_null( 'licencias', 'lic_nro' );
SELECT col_is_unique('licencias', 'lic_nro');
SELECT col_hasnt_default( 'licencias', 'lic_nro' );


SELECT has_column(        'licencias', 'lic_tipo' );
SELECT col_type_is(       'licencias', 'lic_tipo', 'text' );
SELECT col_not_null( 'licencias', 'lic_tipo' );
SELECT col_hasnt_default( 'licencias', 'lic_tipo' );


SELECT has_column(        'licencias', 'exploracao' );
SELECT col_type_is(       'licencias', 'exploracao', 'integer' );
SELECT col_not_null('licencias', 'exploracao' );
SELECT col_hasnt_default( 'licencias', 'exploracao' );
SELECT fk_ok('licencias', 'exploracao', 'exploracaos', 'gid'); -- Maybe not a good test
SELECT col_is_fk('licencias', 'exploracao', 'Columns exploracao should be a fk');


SELECT has_column(        'licencias', 'cadastro' );
SELECT col_type_is(       'licencias', 'cadastro', 'text' );
SELECT col_is_null('licencias', 'cadastro' );
SELECT col_hasnt_default( 'licencias', 'cadastro' );


SELECT has_column(        'licencias', 'd_emissao' );
SELECT col_type_is(       'licencias', 'd_emissao', 'date' );
SELECT col_is_null('licencias', 'd_emissao' );
SELECT col_hasnt_default( 'licencias', 'd_emissao' );


SELECT has_column(        'licencias', 'd_validade' );
SELECT col_type_is(       'licencias', 'd_validade', 'date' );
SELECT col_is_null('licencias', 'd_validade' );
SELECT col_hasnt_default( 'licencias', 'd_validade' );


SELECT has_column(        'licencias', 'd_solici' );
SELECT col_type_is(       'licencias', 'd_solici', 'date' );
SELECT col_is_null('licencias', 'd_solici' );
SELECT col_hasnt_default( 'licencias', 'd_solici' );


SELECT has_column(        'licencias', 'estado' );
SELECT col_type_is(       'licencias', 'estado', 'text' );
SELECT col_is_null('licencias', 'estado' );
SELECT col_hasnt_default( 'licencias', 'estado' );


SELECT has_column(        'licencias', 'c_requerid' );
SELECT col_type_is(       'licencias', 'c_requerid', 'numeric(10,2)' );
SELECT col_is_null('licencias', 'c_requerid' );
SELECT col_hasnt_default( 'licencias', 'c_requerid' );


SELECT has_column(        'licencias', 'c_licencia' );
SELECT col_type_is(       'licencias', 'c_licencia', 'numeric(10,2)' );
SELECT col_is_null('licencias', 'c_licencia' );
SELECT col_hasnt_default( 'licencias', 'c_licencia' );


SELECT has_column(        'licencias', 'c_real' );
SELECT col_type_is(       'licencias', 'c_real', 'numeric(10,2)' );
SELECT col_is_null('licencias', 'c_real' );
SELECT col_hasnt_default( 'licencias', 'c_real' );


SELECT has_column(        'licencias', 'c_real_int' );
SELECT col_type_is(       'licencias', 'c_real_int', 'numeric(10,2)' );
SELECT col_is_null('licencias', 'c_real_int' );
SELECT col_hasnt_default( 'licencias', 'c_real_int' );



SELECT table_owner_is ( 'utentes', 'licencias', 'utentes' , 'utentes.licencias owner is utentes');
SELECT finish();

ROLLBACK;
