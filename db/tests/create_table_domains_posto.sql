-- Test create_table_domains_posto

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
       'posto',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.posto'
);

SELECT has_table('posto');
SELECT has_pk( 'posto' );

SELECT has_column(        'posto', 'category' );
SELECT col_type_is(       'posto', 'category', 'text' );
SELECT col_is_null('posto', 'category' );

SELECT col_hasnt_default( 'posto', 'category' );


SELECT has_column(        'posto', 'key' );
SELECT col_type_is(       'posto', 'key', 'text' );
SELECT col_is_null('posto', 'key' );

SELECT col_hasnt_default( 'posto', 'key' );


SELECT has_column(        'posto', 'value' );
SELECT col_type_is(       'posto', 'value', 'text' );
SELECT col_is_null('posto', 'value' );

SELECT col_hasnt_default( 'posto', 'value' );


SELECT has_column(        'posto', 'ordering' );
SELECT col_type_is(       'posto', 'ordering', 'text' );
SELECT col_is_null('posto', 'ordering' );

SELECT col_hasnt_default( 'posto', 'ordering' );


SELECT has_column(        'posto', 'parent' );
SELECT col_type_is(       'posto', 'parent', 'text' );
SELECT col_is_null('posto', 'parent' );

SELECT col_hasnt_default( 'posto', 'parent' );


SELECT has_column(        'posto', 'tooltip' );
SELECT col_type_is(       'posto', 'tooltip', 'text' );
SELECT col_is_null('posto', 'tooltip' );

SELECT col_hasnt_default( 'posto', 'tooltip' );




SELECT table_owner_is ( 'domains', 'posto', 'utentes' , 'domains.posto owner is utentes');
SELECT finish();

ROLLBACK;
