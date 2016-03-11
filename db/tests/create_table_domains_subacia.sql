-- Test create_table_domains_subacia

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
       'subacia',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.subacia'
);

SELECT has_table('subacia');
-- SELECT has_pk( 'subacia' );

SELECT has_column(        'subacia', 'category' );
SELECT col_type_is(       'subacia', 'category', 'text' );
SELECT col_is_null('subacia', 'category' );

SELECT col_hasnt_default( 'subacia', 'category' );


SELECT has_column(        'subacia', 'key' );
SELECT col_type_is(       'subacia', 'key', 'text' );
SELECT col_is_null('subacia', 'key' );

SELECT col_hasnt_default( 'subacia', 'key' );


SELECT has_column(        'subacia', 'value' );
SELECT col_type_is(       'subacia', 'value', 'text' );
SELECT col_is_null('subacia', 'value' );

SELECT col_hasnt_default( 'subacia', 'value' );


SELECT has_column(        'subacia', 'ordering' );
SELECT col_type_is(       'subacia', 'ordering', 'text' );
SELECT col_is_null('subacia', 'ordering' );

SELECT col_hasnt_default( 'subacia', 'ordering' );


SELECT has_column(        'subacia', 'parent' );
SELECT col_type_is(       'subacia', 'parent', 'text' );
SELECT col_is_null('subacia', 'parent' );

SELECT col_hasnt_default( 'subacia', 'parent' );


SELECT has_column(        'subacia', 'tooltip' );
SELECT col_type_is(       'subacia', 'tooltip', 'text' );
SELECT col_is_null('subacia', 'tooltip' );

SELECT col_hasnt_default( 'subacia', 'tooltip' );




SELECT table_owner_is ( 'domains', 'subacia', 'utentes' , 'domains.subacia owner is utentes');
SELECT finish();

ROLLBACK;
