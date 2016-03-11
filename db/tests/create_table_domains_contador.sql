-- Test create_table_domains_contador

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
       'contador',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.contador'
);

SELECT has_table('contador');
-- SELECT has_pk( 'contador' );

SELECT has_column(        'contador', 'category' );
SELECT col_type_is(       'contador', 'category', 'text' );
SELECT col_is_null('contador', 'category' );

SELECT col_hasnt_default( 'contador', 'category' );


SELECT has_column(        'contador', 'key' );
SELECT col_type_is(       'contador', 'key', 'text' );
SELECT col_is_null('contador', 'key' );

SELECT col_hasnt_default( 'contador', 'key' );


SELECT has_column(        'contador', 'value' );
SELECT col_type_is(       'contador', 'value', 'text' );
SELECT col_is_null('contador', 'value' );

SELECT col_hasnt_default( 'contador', 'value' );


SELECT has_column(        'contador', 'ordering' );
SELECT col_type_is(       'contador', 'ordering', 'text' );
SELECT col_is_null('contador', 'ordering' );

SELECT col_hasnt_default( 'contador', 'ordering' );


SELECT has_column(        'contador', 'parent' );
SELECT col_type_is(       'contador', 'parent', 'text' );
SELECT col_is_null('contador', 'parent' );

SELECT col_hasnt_default( 'contador', 'parent' );


SELECT has_column(        'contador', 'tooltip' );
SELECT col_type_is(       'contador', 'tooltip', 'text' );
SELECT col_is_null('contador', 'tooltip' );

SELECT col_hasnt_default( 'contador', 'tooltip' );




SELECT table_owner_is ( 'domains', 'contador', 'utentes' , 'domains.contador owner is utentes');
SELECT finish();

ROLLBACK;
