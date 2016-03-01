-- Test create_table_domains

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
SELECT plan(29);

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'domains',
	ARRAY[
		'gid', 'category', 'value', 'alias', 'ordering', 'parent', 'tooltip'
	], 'Found expected columns for utentes.domains'
);

SELECT has_table('domains');
SELECT has_pk( 'domains' );

-- gid
SELECT has_column( 'domains', 'gid' );
SELECT col_type_is(
	'utentes',
	'domains',
	'gid',
	'integer',
	'Column utentes.domains.gid is type integer'
);
SELECT col_not_null(
	'utentes',
	'domains',
	'gid',
	'Column utentes.domains.gid is not nullable'
);
SELECT col_has_default(
	'utentes',
	'domains',
	'gid',
	'Column utentes.domains.gid has default value'
);
SELECT col_is_pk( 'domains', 'gid', 'Column gid should be the pk');


SELECT has_column(        'domains', 'category' );
SELECT col_type_is(       'domains', 'category', 'text' );
SELECT col_not_null('domains', 'category' );
SELECT col_hasnt_default( 'domains', 'category' );


SELECT has_column(        'domains', 'value' );
SELECT col_type_is(       'domains', 'value', 'text' );
SELECT col_not_null('domains', 'value' );
SELECT col_hasnt_default( 'domains', 'value' );


SELECT has_column(        'domains', 'alias' );
SELECT col_type_is(       'domains', 'alias', 'text' );
SELECT col_is_null('domains', 'alias' );
SELECT col_hasnt_default( 'domains', 'alias' );


SELECT has_column(        'domains', 'ordering' );
SELECT col_type_is(       'domains', 'ordering', 'text' );
SELECT col_is_null('domains', 'ordering' );
SELECT col_hasnt_default( 'domains', 'ordering' );


SELECT has_column(        'domains', 'parent' );
SELECT col_type_is(       'domains', 'parent', 'text' );
SELECT col_is_null('domains', 'parent' );
SELECT col_hasnt_default( 'domains', 'parent' );


SELECT has_column(        'domains', 'tooltip' );
SELECT col_type_is(       'domains', 'tooltip', 'text' );
SELECT col_is_null('domains', 'tooltip' );
SELECT col_hasnt_default( 'domains', 'tooltip' );

SELECT table_owner_is ( 'utentes', 'domains', 'utentes' , 'utentes.domains owner is utentes');
SELECT finish();

ROLLBACK;
