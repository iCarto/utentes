-- Revert utentes:add_new_domain_bacia from pg

BEGIN;

delete from domains.bacia where key = 'Infulene' and category = 'bacia';
delete from domains.subacia where key = 'Infulene' and category = 'subacia';

COMMIT;
