-- Test create_table_domains_bacia

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
       'bacia',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.bacia'
);

SELECT has_table('bacia');
-- SELECT has_pk( 'bacia' );

SELECT has_column(        'bacia', 'category' );
SELECT col_type_is(       'bacia', 'category', 'text' );
SELECT col_is_null('bacia', 'category' );

SELECT col_hasnt_default( 'bacia', 'category' );


SELECT has_column(        'bacia', 'key' );
SELECT col_type_is(       'bacia', 'key', 'text' );
SELECT col_is_null('bacia', 'key' );

SELECT col_hasnt_default( 'bacia', 'key' );


SELECT has_column(        'bacia', 'value' );
SELECT col_type_is(       'bacia', 'value', 'text' );
SELECT col_is_null('bacia', 'value' );

SELECT col_hasnt_default( 'bacia', 'value' );


SELECT has_column(        'bacia', 'ordering' );
SELECT col_type_is(       'bacia', 'ordering', 'text' );
SELECT col_is_null('bacia', 'ordering' );

SELECT col_hasnt_default( 'bacia', 'ordering' );


SELECT has_column(        'bacia', 'parent' );
SELECT col_type_is(       'bacia', 'parent', 'text' );
SELECT col_is_null('bacia', 'parent' );

SELECT col_hasnt_default( 'bacia', 'parent' );


SELECT has_column(        'bacia', 'tooltip' );
SELECT col_type_is(       'bacia', 'tooltip', 'text' );
SELECT col_is_null('bacia', 'tooltip' );

SELECT col_hasnt_default( 'bacia', 'tooltip' );




SELECT table_owner_is ( 'domains', 'bacia', 'utentes' , 'domains.bacia owner is utentes');
SELECT finish();

ROLLBACK;
