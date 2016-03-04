-- Test create_table_utentes

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

SELECT plan(30);

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'utentes',
	ARRAY[
		'gid',	'nome',	'nuit',	'entidade',	'reg_comerc',	'reg_zona',
    'loc_provin', 'loc_distri', 'loc_posto', 'loc_nucleo'
	], 'Found expected columns for utentes.utentes'
);

SELECT has_table('utentes');
SELECT has_pk( 'utentes' );


-- gid
SELECT has_column( 'utentes', 'gid' );
SELECT col_type_is(
	'utentes',
	'utentes',
	'gid',
	'integer',
	'Column utentes.utentes.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'utentes',
	'gid',
	'Column utentes.utentes.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'utentes',
	'gid',
	'Column utentes.utentes.gid has default value'
);
SELECT col_is_pk( 'utentes', 'gid', 'Column gid should be the pk');



SELECT has_column(        'utentes', 'nome' );
SELECT col_type_is(       'utentes', 'nome', 'text' );
SELECT col_not_null( 'utentes', 'nome' );
SELECT col_is_unique( 'utentes', 'nome', 'Column utentes.utentes.nome should be unique' );
SELECT col_hasnt_default( 'utentes', 'nome' );


SELECT has_column(        'utentes', 'nuit' );
SELECT col_type_is(       'utentes', 'nuit', 'text' );
SELECT col_is_null('utentes', 'nuit' );
SELECT col_hasnt_default( 'utentes', 'nuit' );


SELECT has_column(        'utentes', 'entidade' );
SELECT col_type_is(       'utentes', 'entidade', 'text' );
SELECT col_is_null('utentes', 'entidade' );
SELECT col_hasnt_default( 'utentes', 'entidade' );


SELECT has_column(        'utentes', 'reg_comerc' );
SELECT col_type_is(       'utentes', 'reg_comerc', 'text' );
SELECT col_is_null('utentes', 'reg_comerc' );
SELECT col_hasnt_default( 'utentes', 'reg_comerc' );


SELECT has_column(        'utentes', 'reg_zona' );
SELECT col_type_is(       'utentes', 'reg_zona', 'text' );
SELECT col_is_null('utentes', 'reg_zona' );
SELECT col_hasnt_default( 'utentes', 'reg_zona' );



SELECT table_owner_is ( 'utentes', 'utentes', 'utentes' , 'utentes.utentes owner is utentes');
SELECT finish();

ROLLBACK;
