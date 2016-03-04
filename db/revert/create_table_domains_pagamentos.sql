-- Revert create_table_domains_pagamentos

BEGIN;

DROP TABLE domains.pagamentos;

COMMIT;
