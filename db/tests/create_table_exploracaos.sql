-- Test create_table_exploracaos

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

SELECT plan(95);

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'exploracaos',
	ARRAY[
	     'gid',
	     'exp_name',
       'd_soli',
	     'exp_id',
	     'utente',
	     'observacio',
	     'loc_provin',
	     'loc_distri',
	     'loc_posto',
	     'loc_nucleo',
	     'loc_endere',
	     'loc_bacia',
       'loc_subaci',
	     'loc_rio',
	     'pagos',
       'c_soli',
	     'c_licencia',
	     'c_real',
	     'c_estimado',
       'area',
	     'the_geom'
	], 'Found expected columns for utentes.exploracaos'
);

SELECT has_table('exploracaos');
SELECT has_pk( 'exploracaos' );


-- gid
SELECT has_column( 'exploracaos', 'gid' );
SELECT col_type_is(
	'utentes',
	'exploracaos',
	'gid',
	'integer',
	'Column utentes.exploracaos.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'exploracaos',
	'gid',
	'Column utentes.exploracaos.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'exploracaos',
	'gid',
	'Column utentes.exploracaos.gid has default value'
);
SELECT col_is_pk( 'exploracaos', 'gid', 'Column gid should be the pk');

SELECT has_column(        'exploracaos', 'exp_name' );
SELECT col_type_is(       'exploracaos', 'exp_name', 'text' );
SELECT col_not_null( 'exploracaos', 'exp_name' );
SELECT col_hasnt_default( 'exploracaos', 'exp_name' );


SELECT has_column(        'exploracaos', 'exp_id' );
SELECT col_type_is(       'exploracaos', 'exp_id', 'text' );
SELECT col_not_null( 'exploracaos', 'exp_id' );
SELECT col_is_unique( 'exploracaos', 'exp_id', 'Column utentes.exploracaos.exp_id should be unique' );
SELECT col_hasnt_default( 'exploracaos', 'exp_id' );


SELECT has_column(        'exploracaos', 'utente' );
SELECT col_type_is(       'exploracaos', 'utente', 'integer' );
SELECT col_not_null( 'exploracaos', 'utente' );
SELECT col_hasnt_default( 'exploracaos', 'utente' );
SELECT fk_ok('exploracaos', 'utente', 'utentes', 'gid'); -- Maybe not a good test
SELECT col_is_fk('exploracaos', 'utente', 'Columns utente should be a fk');


SELECT has_column(        'exploracaos', 'observacio' );
SELECT col_type_is(       'exploracaos', 'observacio', 'text' );
SELECT col_is_null( 'exploracaos', 'observacio' );
SELECT col_hasnt_default( 'exploracaos', 'observacio' );


SELECT has_column(        'exploracaos', 'loc_provin' );
SELECT col_type_is(       'exploracaos', 'loc_provin', 'text' );
SELECT col_not_null( 'exploracaos', 'loc_provin' );
SELECT col_hasnt_default( 'exploracaos', 'loc_provin' );


SELECT has_column(        'exploracaos', 'loc_distri' );
SELECT col_type_is(       'exploracaos', 'loc_distri', 'text' );
SELECT col_not_null( 'exploracaos', 'loc_distri' );
SELECT col_hasnt_default( 'exploracaos', 'loc_distri' );


SELECT has_column(        'exploracaos', 'loc_posto' );
SELECT col_type_is(       'exploracaos', 'loc_posto', 'text' );
SELECT col_not_null( 'exploracaos', 'loc_posto' );
SELECT col_hasnt_default( 'exploracaos', 'loc_posto' );


SELECT has_column(        'exploracaos', 'loc_nucleo' );
SELECT col_type_is(       'exploracaos', 'loc_nucleo', 'text' );
SELECT col_is_null('exploracaos', 'loc_nucleo' );
SELECT col_hasnt_default( 'exploracaos', 'loc_nucleo' );


SELECT has_column(        'exploracaos', 'loc_endere' );
SELECT col_type_is(       'exploracaos', 'loc_endere', 'text' );
SELECT col_is_null('exploracaos', 'loc_endere' );
SELECT col_hasnt_default( 'exploracaos', 'loc_endere' );


SELECT has_column(        'exploracaos', 'loc_bacia' );
SELECT col_type_is(       'exploracaos', 'loc_bacia', 'text' );
SELECT col_is_null('exploracaos', 'loc_bacia' );
SELECT col_hasnt_default( 'exploracaos', 'loc_bacia' );

SELECT has_column(        'exploracaos', 'loc_subaci' );
SELECT col_type_is(       'exploracaos', 'loc_subaci', 'text' );
SELECT col_is_null('exploracaos', 'loc_subaci' );
SELECT col_hasnt_default( 'exploracaos', 'loc_subaci' );


SELECT has_column(        'exploracaos', 'loc_rio' );
SELECT col_type_is(       'exploracaos', 'loc_rio', 'text' );
SELECT col_is_null('exploracaos', 'loc_rio' );
SELECT col_hasnt_default( 'exploracaos', 'loc_rio' );


SELECT has_column(        'exploracaos', 'pagos' );
SELECT col_type_is(       'exploracaos', 'pagos', 'boolean' );
SELECT col_hasnt_default( 'exploracaos', 'pagos' );


SELECT has_column(        'exploracaos', 'area' );
SELECT col_type_is(       'exploracaos', 'area', 'numeric(10,2)' );
SELECT col_is_null('exploracaos', 'area' );
SELECT col_hasnt_default( 'exploracaos', 'area' );

SELECT has_column(        'exploracaos', 'c_soli' );
SELECT col_type_is(       'exploracaos', 'c_soli', 'numeric(10,2)' );
SELECT col_is_null('exploracaos', 'c_soli' );
SELECT col_hasnt_default( 'exploracaos', 'c_soli' );

SELECT has_column(        'exploracaos', 'd_soli' );
SELECT col_type_is(       'exploracaos', 'd_soli', 'date' );
SELECT col_is_null('exploracaos', 'd_soli' );
SELECT col_hasnt_default( 'exploracaos', 'd_soli' );


SELECT has_column(        'exploracaos', 'c_licencia' );
SELECT col_type_is(       'exploracaos', 'c_licencia', 'numeric(10,2)' );
SELECT col_is_null('exploracaos', 'c_licencia' );
SELECT col_hasnt_default( 'exploracaos', 'c_licencia' );


SELECT has_column(        'exploracaos', 'c_real' );
SELECT col_type_is(       'exploracaos', 'c_real', 'numeric(10,2)' );
SELECT col_is_null('exploracaos', 'c_real' );
SELECT col_hasnt_default( 'exploracaos', 'c_real' );


SELECT has_column(        'exploracaos', 'c_estimado' );
SELECT col_type_is(       'exploracaos', 'c_estimado', 'numeric(10,2)' );
SELECT col_is_null('exploracaos', 'c_estimado' );
SELECT col_hasnt_default( 'exploracaos', 'c_estimado' );


SELECT has_column(        'exploracaos', 'the_geom' );
SELECT col_type_is(       'exploracaos', 'the_geom', 'geometry(MultiPolygon,32737)' );
SELECT col_is_null('exploracaos', 'the_geom' );
SELECT col_hasnt_default( 'exploracaos', 'the_geom' );


SELECT table_owner_is ( 'utentes', 'exploracaos', 'utentes' , 'utentes.exploracaos owner is utentes');
SELECT finish();

ROLLBACK;
