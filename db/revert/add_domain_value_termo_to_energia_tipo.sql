-- Revert utentes:add_domain_value_termo_to_energia_tipo from pg

BEGIN;

-- No need to revert the default and no error if applied twice

UPDATE domains.energia_tipo SET ordering = NULL;
INSERT INTO domains.energia_tipo (key, ordering) VALUES (NULL, 0);
DELETE FROM domains.energia_tipo WHERE key = 'Termoeléctrica';
REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
