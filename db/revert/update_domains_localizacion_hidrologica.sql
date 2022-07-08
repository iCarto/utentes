-- Revert utentes:update_domains_localizacion_hidrologica from pg

BEGIN;

ALTER TABLE domains.bacia DROP COLUMN ara;
ALTER TABLE domains.subacia DROP COLUMN ara;

UPDATE domains.bacia SET parent = NULL;

DELETE FROM domains.bacia WHERE key IN ('Bambe', 'Bembe', 'Chiendsele', 'Das Pedras', 'Davetave', 'Fúti', 'Govuro', 'Incomati', 'Inhanombe', 'Inharrime', 'Inhavumalala', 'Limpopo', 'Maducha', 'Maputo', 'Matola', 'Mucambe', 'Mulalace', 'Mutamba', 'Nhangualala', 'Panga', 'Save', 'Tembe', 'Umbelézi', 'Outra');


DELETE FROM domains.subacia WHERE parent IN ('Bambe', 'Bembe', 'Chiendsele', 'Das Pedras', 'Davetave', 'Fúti', 'Govuro', 'Incomati', 'Inhanombe', 'Inharrime', 'Inhavumalala', 'Limpopo', 'Maducha', 'Maputo', 'Matola', 'Mucambe', 'Mulalace', 'Mutamba', 'Nhangualala', 'Panga', 'Save', 'Tembe', 'Umbelézi', 'Outra');


COMMIT;
