-- Test create_table_domains_rega_tipo

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
       'rega_tipo',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.rega_tipo'
);

SELECT has_table('rega_tipo');
SELECT has_pk( 'rega_tipo' );

SELECT has_column(        'rega_tipo', 'category' );
SELECT col_type_is(       'rega_tipo', 'category', 'text' );
SELECT col_is_null('rega_tipo', 'category' );

SELECT col_hasnt_default( 'rega_tipo', 'category' );


SELECT has_column(        'rega_tipo', 'key' );
SELECT col_type_is(       'rega_tipo', 'key', 'text' );
SELECT col_is_null('rega_tipo', 'key' );

SELECT col_hasnt_default( 'rega_tipo', 'key' );


SELECT has_column(        'rega_tipo', 'value' );
SELECT col_type_is(       'rega_tipo', 'value', 'text' );
SELECT col_is_null('rega_tipo', 'value' );

SELECT col_hasnt_default( 'rega_tipo', 'value' );


SELECT has_column(        'rega_tipo', 'ordering' );
SELECT col_type_is(       'rega_tipo', 'ordering', 'text' );
SELECT col_is_null('rega_tipo', 'ordering' );

SELECT col_hasnt_default( 'rega_tipo', 'ordering' );


SELECT has_column(        'rega_tipo', 'parent' );
SELECT col_type_is(       'rega_tipo', 'parent', 'text' );
SELECT col_is_null('rega_tipo', 'parent' );

SELECT col_hasnt_default( 'rega_tipo', 'parent' );


SELECT has_column(        'rega_tipo', 'tooltip' );
SELECT col_type_is(       'rega_tipo', 'tooltip', 'text' );
SELECT col_is_null('rega_tipo', 'tooltip' );

SELECT col_hasnt_default( 'rega_tipo', 'tooltip' );




SELECT table_owner_is ( 'domains', 'rega_tipo', 'utentes' , 'domains.rega_tipo owner is utentes');
SELECT finish();

ROLLBACK;
