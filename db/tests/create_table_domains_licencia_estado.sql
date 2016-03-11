-- Test create_table_domains_licencia_estado

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
       'licencia_estado',
	ARRAY[
		'category',	'key',	'value',	'ordering',	'parent',	'tooltip'
	], 'Found expected columns for domains.licencia_estado'
);

SELECT has_table('licencia_estado');
-- SELECT has_pk( 'licencia_estado' );

SELECT has_column(        'licencia_estado', 'category' );
SELECT col_type_is(       'licencia_estado', 'category', 'text' );
SELECT col_is_null('licencia_estado', 'category' );

SELECT col_hasnt_default( 'licencia_estado', 'category' );


SELECT has_column(        'licencia_estado', 'key' );
SELECT col_type_is(       'licencia_estado', 'key', 'text' );
SELECT col_is_null('licencia_estado', 'key' );

SELECT col_hasnt_default( 'licencia_estado', 'key' );


SELECT has_column(        'licencia_estado', 'value' );
SELECT col_type_is(       'licencia_estado', 'value', 'text' );
SELECT col_is_null('licencia_estado', 'value' );

SELECT col_hasnt_default( 'licencia_estado', 'value' );


SELECT has_column(        'licencia_estado', 'ordering' );
SELECT col_type_is(       'licencia_estado', 'ordering', 'text' );
SELECT col_is_null('licencia_estado', 'ordering' );

SELECT col_hasnt_default( 'licencia_estado', 'ordering' );


SELECT has_column(        'licencia_estado', 'parent' );
SELECT col_type_is(       'licencia_estado', 'parent', 'text' );
SELECT col_is_null('licencia_estado', 'parent' );

SELECT col_hasnt_default( 'licencia_estado', 'parent' );


SELECT has_column(        'licencia_estado', 'tooltip' );
SELECT col_type_is(       'licencia_estado', 'tooltip', 'text' );
SELECT col_is_null('licencia_estado', 'tooltip' );

SELECT col_hasnt_default( 'licencia_estado', 'tooltip' );




SELECT table_owner_is ( 'domains', 'licencia_estado', 'utentes' , 'domains.licencia_estado owner is utentes');
SELECT finish();

ROLLBACK;
