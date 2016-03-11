-- Test create_table_domains_distrito

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
       'distrito',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.distrito'
);

SELECT has_table('distrito');
-- SELECT has_pk( 'distrito' );

SELECT has_column(        'distrito', 'category' );
SELECT col_type_is(       'distrito', 'category', 'text' );
SELECT col_is_null('distrito', 'category' );

SELECT col_hasnt_default( 'distrito', 'category' );


SELECT has_column(        'distrito', 'key' );
SELECT col_type_is(       'distrito', 'key', 'text' );
SELECT col_is_null('distrito', 'key' );

SELECT col_hasnt_default( 'distrito', 'key' );


SELECT has_column(        'distrito', 'value' );
SELECT col_type_is(       'distrito', 'value', 'text' );
SELECT col_is_null('distrito', 'value' );

SELECT col_hasnt_default( 'distrito', 'value' );


SELECT has_column(        'distrito', 'ordering' );
SELECT col_type_is(       'distrito', 'ordering', 'text' );
SELECT col_is_null('distrito', 'ordering' );

SELECT col_hasnt_default( 'distrito', 'ordering' );


SELECT has_column(        'distrito', 'parent' );
SELECT col_type_is(       'distrito', 'parent', 'text' );
SELECT col_is_null('distrito', 'parent' );

SELECT col_hasnt_default( 'distrito', 'parent' );


SELECT has_column(        'distrito', 'tooltip' );
SELECT col_type_is(       'distrito', 'tooltip', 'text' );
SELECT col_is_null('distrito', 'tooltip' );

SELECT col_hasnt_default( 'distrito', 'tooltip' );




SELECT table_owner_is ( 'domains', 'distrito', 'utentes' , 'domains.distrito owner is utentes');
SELECT finish();

ROLLBACK;
