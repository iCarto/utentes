-- Deploy utentes:add_domain_value_termo_to_energia_tipo to pg

BEGIN;

-- Should be the default from the begining
ALTER TABLE domains.energia_tipo ALTER COLUMN category SET DEFAULT 'energia_tipo';

-- Not needed anymore with the changes in the js libraries
DELETE FROM domains.energia_tipo WHERE key IS NULL;

-- Actual needed change
INSERT INTO domains.energia_tipo (key) VALUES ('Termoeléctrica');

-- Sort values alphabetically, puting 'Outra' in las place
WITH foo AS (
    SELECT row_number() OVER (ORDER BY key), key fookey
    FROM domains.energia_tipo
    WHERE key != 'Outra'
)
UPDATE domains.energia_tipo
SET ordering = row_number
FROM foo
WHERE key = fookey ;

UPDATE domains.energia_tipo
SET ordering = (SELECT max(ordering) + 1 FROM domains.energia_tipo)
WHERE key = 'Outra';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
