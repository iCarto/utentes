-- Revert utentes:populate_arazambeze_domains from pg

BEGIN;

delete from domains.unidade where key = 'Zambeze';
delete from domains.bacia where 'Zambeze' = any(app);

delete from domains.subacia where 'Zambeze' = any(app) and not 'Sul' = any(app);

COMMIT;
