-- Test create_schema_domains

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

SELECT plan(4);

SELECT has_schema(
        'domains',
        'Has schema domains'
);

SELECT schema_owner_is( 'domains', 'utentes', 'domains should be owned by utentes' );

SELECT tables_are(
  'domains',
   ARRAY[
        'actividade',
        'animal_tipo',
        'bacia',
        'contador',
        'cultivo_tipo',
        'distrito',
        'energia_tipo',
	'fonte_tipo',
	'industria_tipo',
	'licencia_estado',
	'licencia_tipo',
	'pagamentos',
	'posto',
	'provincia',
	'rega_tipo',
	'subacia'
	], 'Found expected tables for schema domains'
);


SELECT views_are(
  'domains',
  ARRAY[ 'domains'
  ], 'Found expected views for schema domains'
);

-- Finish the tests and clean up.
SELECT * FROM finish();

ROLLBACK;
