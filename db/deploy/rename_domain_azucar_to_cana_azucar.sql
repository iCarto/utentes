-- Deploy utentes:rename_domain_azucar_to_cana_azucar to pg

BEGIN;

-- Should be the default from the begining
ALTER TABLE domains.cultivo_tipo ALTER COLUMN category SET DEFAULT 'cultivo_tipo';

-- Not needed anymore with the changes in the js libraries
DELETE FROM domains.cultivo_tipo WHERE key IS NULL;

-- Actual needed change
UPDATE domains.cultivo_tipo SET key = 'Cana-de-açúcar' WHERE key = 'Açúcar';
UPDATE domains.cultivo_tipo SET key = 'Outras' WHERE key = 'Outros';

-- Sort values alphabetically, puting 'Outra' in las place
WITH foo AS (
    SELECT row_number() OVER (ORDER BY key), key fookey
    FROM domains.cultivo_tipo
    WHERE key != 'Outras'
)
UPDATE domains.energia_tipo
SET ordering = row_number
FROM foo
WHERE key = fookey ;

UPDATE domains.cultivo_tipo
SET ordering = (SELECT max(ordering) + 1 FROM domains.cultivo_tipo)
WHERE key = 'Outras';

REFRESH MATERIALIZED VIEW domains.domains;


COMMIT;
