-- Test create_table_settings

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

SET search_path TO utentes,public;

SELECT columns_are(
       'utentes',
       'settings',
	ARRAY[
		'property',	'value'
	], 'Found expected columns for utentes.settings'
);

SELECT has_table('settings');
SELECT has_pk( 'settings' );



SELECT has_column(        'settings', 'property' );
SELECT col_type_is(       'settings', 'property', 'text' );
SELECT col_not_null('settings', 'property' );
SELECT col_hasnt_default( 'settings', 'property' );
SELECT col_is_pk( 'settings', 'property', 'Column property should be the pk');




SELECT has_column(        'settings', 'value' );
SELECT col_type_is(       'settings', 'value', 'text' );
SELECT col_not_null('settings', 'value' );
SELECT col_hasnt_default( 'settings', 'value' );



SELECT table_owner_is ( 'utentes', 'settings', 'utentes' , 'utentes.settings owner is utentes');
SELECT finish();

ROLLBACK;
