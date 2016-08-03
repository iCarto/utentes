-- Deploy utentes:update_domains_distrito_change_pemba to pg

BEGIN;


UPDATE domains.distrito SET key='Pemba - Metuge' WHERE (category, key, parent) = ('distrito', 'Pemba', 'Cabo Delgado');
UPDATE domains.posto SET parent='Pemba - Metuge' WHERE (category, ordering, parent) = ('posto', 0, 'Pemba');
UPDATE domains.posto SET parent='Pemba - Metuge' WHERE (category, key, parent) = ('posto', 'Metuge', 'Pemba');
UPDATE domains.posto SET parent='Pemba - Metuge' WHERE (category, key, parent) = ('posto', 'Mieze', 'Pemba');


COMMIT;
