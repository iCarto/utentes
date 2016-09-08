-- Revert utentes:update_domains_distrito_change_pemba from pg

BEGIN;

UPDATE domains.distrito SET key='Pemba' WHERE (category, key, parent) = ('distrito', 'Pemba - Metuge', 'Cabo Delgado');

UPDATE domains.posto SET parent='Pemba' WHERE (category, ordering, parent) = ('posto', 0, 'Pemba - Metuge');
UPDATE domains.posto SET parent='Pemba' WHERE (category, key, parent) = ('posto', 'Metuge', 'Pemba - Metuge');
UPDATE domains.posto SET parent='Pemba' WHERE (category, key, parent) = ('posto', 'Mieze', 'Pemba - Metuge');

-- ALTER TABLE domains.posto DROP CONSTRAINT posto_key_parent_key;
COMMIT;
