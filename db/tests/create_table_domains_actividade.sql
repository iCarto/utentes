-- Test create_table_domains_actividade

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
       'actividade',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.actividade'
);

SELECT has_table('actividade');
SELECT has_pk( 'actividade' );

SELECT has_column(        'actividade', 'category' );
SELECT col_type_is(       'actividade', 'category', 'text' );
SELECT col_is_null('actividade', 'category' );

SELECT col_hasnt_default( 'actividade', 'category' );


SELECT has_column(        'actividade', 'key' );
SELECT col_type_is(       'actividade', 'key', 'text' );
SELECT col_is_null('actividade', 'key' );

SELECT col_hasnt_default( 'actividade', 'key' );


SELECT has_column(        'actividade', 'value' );
SELECT col_type_is(       'actividade', 'value', 'text' );
SELECT col_is_null('actividade', 'value' );

SELECT col_hasnt_default( 'actividade', 'value' );


SELECT has_column(        'actividade', 'ordering' );
SELECT col_type_is(       'actividade', 'ordering', 'text' );
SELECT col_is_null('actividade', 'ordering' );

SELECT col_hasnt_default( 'actividade', 'ordering' );


SELECT has_column(        'actividade', 'parent' );
SELECT col_type_is(       'actividade', 'parent', 'text' );
SELECT col_is_null('actividade', 'parent' );

SELECT col_hasnt_default( 'actividade', 'parent' );


SELECT has_column(        'actividade', 'tooltip' );
SELECT col_type_is(       'actividade', 'tooltip', 'text' );
SELECT col_is_null('actividade', 'tooltip' );

SELECT col_hasnt_default( 'actividade', 'tooltip' );




SELECT table_owner_is ( 'domains', 'actividade', 'utentes' , 'domains.actividade owner is utentes');
SELECT finish();

ROLLBACK;
