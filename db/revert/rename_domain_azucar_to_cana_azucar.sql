-- Revert utentes:rename_domain_azucar_to_cana_azucar from pg

BEGIN;

UPDATE domains.cultivo_tipo SET ordering = NULL;
INSERT INTO domains.cultivo_tipo (key, ordering) VALUES (NULL, 0);
UPDATE domains.cultivo_tipo SET key = 'Açúcar' WHERE key = 'Cana-de-açúcar';
UPDATE domains.cultivo_tipo SET key = 'Outros' WHERE key = 'Outras';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
