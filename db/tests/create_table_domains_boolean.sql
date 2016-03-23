-- Test create_table_domains_boolean

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

SET search_path TO domains,public;

SELECT columns_are(
       'domains',
       'boolean',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.boolean'
);

SELECT has_table('boolean');
-- SELECT has_pk( 'boolean' );

SELECT has_column(        'boolean', 'category' );
SELECT col_type_is(       'boolean', 'category', 'text' );
SELECT col_is_null('boolean', 'category' );

SELECT col_hasnt_default( 'boolean', 'category' );


SELECT has_column(        'boolean', 'key' );
SELECT col_type_is(       'boolean', 'key', 'text' );
SELECT col_is_null('boolean', 'key' );

SELECT col_hasnt_default( 'boolean', 'key' );


SELECT has_column(        'boolean', 'value' );
SELECT col_type_is(       'boolean', 'value', 'text' );
SELECT col_is_null('boolean', 'value' );

SELECT col_hasnt_default( 'boolean', 'value' );


SELECT has_column(        'boolean', 'ordering' );
SELECT col_type_is(       'boolean', 'ordering', 'text' );
SELECT col_is_null('boolean', 'ordering' );

SELECT col_hasnt_default( 'boolean', 'ordering' );


SELECT has_column(        'boolean', 'parent' );
SELECT col_type_is(       'boolean', 'parent', 'text' );
SELECT col_is_null('boolean', 'parent' );

SELECT col_hasnt_default( 'boolean', 'parent' );


SELECT has_column(        'boolean', 'tooltip' );
SELECT col_type_is(       'boolean', 'tooltip', 'text' );
SELECT col_is_null('boolean', 'tooltip' );

SELECT col_hasnt_default( 'boolean', 'tooltip' );




SELECT table_owner_is ( 'domains', 'boolean', 'utentes' , 'domains.boolean owner is utentes');
SELECT finish();

ROLLBACK;
