-- Revert utentes:fill_domains_from_cbase from pg

BEGIN;

-- As this implies changes in cbase data that are done
-- outside sqitch, there is no a real rollback.
-- it should be restored from a backup

COMMIT;
