-- Verify utentes:alter_tables_domains_bacia_subvacia_ARA_Sul on pg

BEGIN;

SELECT 35/count(*) FROM domains.bacia where app='{Sul}';
SELECT 33/count(*) FROM domains.subacia where app='{Sul}';

ROLLBACK;
