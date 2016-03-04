-- Test create_table_domains_cultivo_tipo

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
       'cultivo_tipo',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.cultivo_tipo'
);

SELECT has_table('cultivo_tipo');
SELECT has_pk( 'cultivo_tipo' );

SELECT has_column(        'cultivo_tipo', 'category' );
SELECT col_type_is(       'cultivo_tipo', 'category', 'text' );
SELECT col_is_null('cultivo_tipo', 'category' );

SELECT col_hasnt_default( 'cultivo_tipo', 'category' );


SELECT has_column(        'cultivo_tipo', 'key' );
SELECT col_type_is(       'cultivo_tipo', 'key', 'text' );
SELECT col_is_null('cultivo_tipo', 'key' );

SELECT col_hasnt_default( 'cultivo_tipo', 'key' );


SELECT has_column(        'cultivo_tipo', 'value' );
SELECT col_type_is(       'cultivo_tipo', 'value', 'text' );
SELECT col_is_null('cultivo_tipo', 'value' );

SELECT col_hasnt_default( 'cultivo_tipo', 'value' );


SELECT has_column(        'cultivo_tipo', 'ordering' );
SELECT col_type_is(       'cultivo_tipo', 'ordering', 'text' );
SELECT col_is_null('cultivo_tipo', 'ordering' );

SELECT col_hasnt_default( 'cultivo_tipo', 'ordering' );


SELECT has_column(        'cultivo_tipo', 'parent' );
SELECT col_type_is(       'cultivo_tipo', 'parent', 'text' );
SELECT col_is_null('cultivo_tipo', 'parent' );

SELECT col_hasnt_default( 'cultivo_tipo', 'parent' );


SELECT has_column(        'cultivo_tipo', 'tooltip' );
SELECT col_type_is(       'cultivo_tipo', 'tooltip', 'text' );
SELECT col_is_null('cultivo_tipo', 'tooltip' );

SELECT col_hasnt_default( 'cultivo_tipo', 'tooltip' );




SELECT table_owner_is ( 'domains', 'cultivo_tipo', 'utentes' , 'domains.cultivo_tipo owner is utentes');
SELECT finish();

ROLLBACK;
