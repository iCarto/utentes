-- Test create_table_domains_provincia

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
       'provincia',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.provincia'
);

SELECT has_table('provincia');
-- SELECT has_pk( 'provincia' );

SELECT has_column(        'provincia', 'category' );
SELECT col_type_is(       'provincia', 'category', 'text' );
SELECT col_is_null('provincia', 'category' );

SELECT col_hasnt_default( 'provincia', 'category' );


SELECT has_column(        'provincia', 'key' );
SELECT col_type_is(       'provincia', 'key', 'text' );
SELECT col_is_null('provincia', 'key' );

SELECT col_hasnt_default( 'provincia', 'key' );


SELECT has_column(        'provincia', 'value' );
SELECT col_type_is(       'provincia', 'value', 'text' );
SELECT col_is_null('provincia', 'value' );

SELECT col_hasnt_default( 'provincia', 'value' );


SELECT has_column(        'provincia', 'ordering' );
SELECT col_type_is(       'provincia', 'ordering', 'text' );
SELECT col_is_null('provincia', 'ordering' );

SELECT col_hasnt_default( 'provincia', 'ordering' );


SELECT has_column(        'provincia', 'parent' );
SELECT col_type_is(       'provincia', 'parent', 'text' );
SELECT col_is_null('provincia', 'parent' );

SELECT col_hasnt_default( 'provincia', 'parent' );


SELECT has_column(        'provincia', 'tooltip' );
SELECT col_type_is(       'provincia', 'tooltip', 'text' );
SELECT col_is_null('provincia', 'tooltip' );

SELECT col_hasnt_default( 'provincia', 'tooltip' );




SELECT table_owner_is ( 'domains', 'provincia', 'utentes' , 'domains.provincia owner is utentes');
SELECT finish();

ROLLBACK;
