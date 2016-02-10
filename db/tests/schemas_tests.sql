-- Test schemas_tests

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

SELECT plan(5);

SELECT has_schema(
        'utentes',
        'Has schema utentes'
);

SELECT schema_owner_is( 'utentes', 'utentes', 'utentes should be owned by utentes' );
SELECT schema_owner_is( 'public', 'utentes', 'public should be owned by utentes' );

SELECT tables_are(
  'public',
   ARRAY[
        'spatial_ref_sys'
	], 'Found expected tables for schema app'
);

SELECT table_owner_is ( 'public', 'spatial_ref_sys', 'utentes', ' ' );

-- Finish the tests and clean up.
SELECT * FROM finish();

ROLLBACK;
