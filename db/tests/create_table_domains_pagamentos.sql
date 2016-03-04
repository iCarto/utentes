-- Test create_table_domains_pagamentos

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
       'pagamentos',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.pagamentos'
);

SELECT has_table('pagamentos');
SELECT has_pk( 'pagamentos' );

SELECT has_column(        'pagamentos', 'category' );
SELECT col_type_is(       'pagamentos', 'category', 'text' );
SELECT col_is_null('pagamentos', 'category' );

SELECT col_hasnt_default( 'pagamentos', 'category' );


SELECT has_column(        'pagamentos', 'key' );
SELECT col_type_is(       'pagamentos', 'key', 'text' );
SELECT col_is_null('pagamentos', 'key' );

SELECT col_hasnt_default( 'pagamentos', 'key' );


SELECT has_column(        'pagamentos', 'value' );
SELECT col_type_is(       'pagamentos', 'value', 'text' );
SELECT col_is_null('pagamentos', 'value' );

SELECT col_hasnt_default( 'pagamentos', 'value' );


SELECT has_column(        'pagamentos', 'ordering' );
SELECT col_type_is(       'pagamentos', 'ordering', 'text' );
SELECT col_is_null('pagamentos', 'ordering' );

SELECT col_hasnt_default( 'pagamentos', 'ordering' );


SELECT has_column(        'pagamentos', 'parent' );
SELECT col_type_is(       'pagamentos', 'parent', 'text' );
SELECT col_is_null('pagamentos', 'parent' );

SELECT col_hasnt_default( 'pagamentos', 'parent' );


SELECT has_column(        'pagamentos', 'tooltip' );
SELECT col_type_is(       'pagamentos', 'tooltip', 'text' );
SELECT col_is_null('pagamentos', 'tooltip' );

SELECT col_hasnt_default( 'pagamentos', 'tooltip' );




SELECT table_owner_is ( 'domains', 'pagamentos', 'utentes' , 'domains.pagamentos owner is utentes');
SELECT finish();

ROLLBACK;
