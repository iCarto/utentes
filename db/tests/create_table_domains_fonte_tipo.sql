-- Test create_table_domains_fonte_tipo

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
       'fonte_tipo',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.fonte_tipo'
);

SELECT has_table('fonte_tipo');
-- SELECT has_pk( 'fonte_tipo' );

SELECT has_column(        'fonte_tipo', 'category' );
SELECT col_type_is(       'fonte_tipo', 'category', 'text' );
SELECT col_is_null('fonte_tipo', 'category' );

SELECT col_hasnt_default( 'fonte_tipo', 'category' );


SELECT has_column(        'fonte_tipo', 'key' );
SELECT col_type_is(       'fonte_tipo', 'key', 'text' );
SELECT col_is_null('fonte_tipo', 'key' );

SELECT col_hasnt_default( 'fonte_tipo', 'key' );


SELECT has_column(        'fonte_tipo', 'value' );
SELECT col_type_is(       'fonte_tipo', 'value', 'text' );
SELECT col_is_null('fonte_tipo', 'value' );

SELECT col_hasnt_default( 'fonte_tipo', 'value' );


SELECT has_column(        'fonte_tipo', 'ordering' );
SELECT col_type_is(       'fonte_tipo', 'ordering', 'text' );
SELECT col_is_null('fonte_tipo', 'ordering' );

SELECT col_hasnt_default( 'fonte_tipo', 'ordering' );


SELECT has_column(        'fonte_tipo', 'parent' );
SELECT col_type_is(       'fonte_tipo', 'parent', 'text' );
SELECT col_is_null('fonte_tipo', 'parent' );

SELECT col_hasnt_default( 'fonte_tipo', 'parent' );


SELECT has_column(        'fonte_tipo', 'tooltip' );
SELECT col_type_is(       'fonte_tipo', 'tooltip', 'text' );
SELECT col_is_null('fonte_tipo', 'tooltip' );

SELECT col_hasnt_default( 'fonte_tipo', 'tooltip' );




SELECT table_owner_is ( 'domains', 'fonte_tipo', 'utentes' , 'domains.fonte_tipo owner is utentes');
SELECT finish();

ROLLBACK;
