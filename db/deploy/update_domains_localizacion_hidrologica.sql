-- Deploy utentes:update_domains_localizacion_hidrologica to pg

BEGIN;

ALTER TABLE domains.bacia ADD COLUMN ara text;
ALTER TABLE domains.subacia ADD COLUMN ara text;

UPDATE domains.bacia SET parent = 'Norte' WHERE key IN ('Megaruma', 'Messalo', 'Montepuez', 'Rovuma', 'Orla Marítima 1', 'Orla Marítima 2', 'Orla Marítima 3');
UPDATE domains.bacia SET parent = 'Norte' WHERE ordering = 0;
UPDATE domains.bacia SET ara = 'Norte' WHERE parent = 'Norte';


UPDATE domains.subacia SET ara = 'Norte' WHERE key IN ('Megaruma', 'Messalo', 'Montepuez', 'Rovuma', 'Miruco', 'Muaguide', 'Ridi', 'Meapia', 'Muizi', 'Metori', 'Metava', 'S/N OM1', 'Pemba', 'Tara-Quilite', 'Tari', 'Miezi', 'Muacamula', 'Messingue', 'Sicoro/Lingula', 'Muembe-Nanomo', 'Diquide', 'Buizili', 'S/N', 'Chafi', 'Muenha', 'Necumbi', 'S/N OM2', 'Quigode', 'Mipama', 'Nango/Mepuira', 'Sinheu/Mutamba', 'Quinhevo', 'Bundaze-Monga', 'Mepuira', 'S/N OM3', 'Mecumbi', 'Macanga', 'Calundi/Uncudi', 'Meranvi');

INSERT INTO domains.bacia (category, key, parent) VALUES
('bacia', 'Bambe', 'Sul'),
('bacia', 'Bembe', 'Sul'),
('bacia', 'Chiendsele', 'Sul'),
('bacia', 'Das Pedras', 'Sul'),
('bacia', 'Davetave', 'Sul'),
('bacia', 'Fúti', 'Sul'),
('bacia', 'Govuro', 'Sul'),
('bacia', 'Incomati', 'Sul'),
('bacia', 'Inhanombe', 'Sul'),
('bacia', 'Inharrime', 'Sul'),
('bacia', 'Inhavumalala', 'Sul'),
('bacia', 'Limpopo', 'Sul'),
('bacia', 'Maducha', 'Sul'),
('bacia', 'Maputo', 'Sul'),
('bacia', 'Matola', 'Sul'),
('bacia', 'Mucambe', 'Sul'),
('bacia', 'Mulalace', 'Sul'),
('bacia', 'Mutamba', 'Sul'),
('bacia', 'Nhangualala', 'Sul'),
('bacia', 'Panga', 'Sul'),
('bacia', 'Save', 'Sul'),
('bacia', 'Tembe', 'Sul'),
('bacia', 'Umbelézi', 'Sul'),
('bacia', 'Outra', 'Sul');
INSERT INTO domains.bacia (category, key, parent, ordering) VALUES ('bacia', NULL, 'Sul', 0);
UPDATE domains.bacia SET ara = 'Sul' WHERE parent = 'Sul';

INSERT INTO domains.subacia (category, key, parent, ordering) VALUES
('subacia', NULL, 'Bambe' , 0),
('subacia', 'Bambe', 'Bambe' , NULL),
('subacia', NULL, 'Bembe' , 0),
('subacia', 'Bembe', 'Bembe' , NULL),
('subacia', NULL, 'Chiendsele' , 0),
('subacia', 'Chiendsele', 'Chiendsele' , NULL),
('subacia', NULL, 'Das Pedras' , 0),
('subacia', 'Das Pedras', 'Das Pedras' , NULL),
('subacia', NULL, 'Davetave' , 0),
('subacia', 'Davetave', 'Davetave' , NULL),
('subacia', NULL, 'Fúti' , 0),
('subacia', 'Fúti', 'Fúti' , NULL),
('subacia', NULL, 'Govuro' , 0),
('subacia', 'Govuro', 'Govuro' , NULL),
('subacia', NULL, 'Incomati' , 0),
('subacia', 'Incomati', 'Incomati' , NULL),
('subacia', NULL, 'Inhanombe' , 0),
('subacia', 'Inhanombe', 'Inhanombe' , NULL),
('subacia', NULL, 'Inharrime' , 0),
('subacia', 'Inharrime', 'Inharrime' , NULL),
('subacia', NULL, 'Inhavumalala' , 0),
('subacia', 'Inhavumalala', 'Inhavumalala' , NULL),
('subacia', NULL, 'Limpopo' , 0),
('subacia', 'Limpopo', 'Limpopo' , NULL),
('subacia', NULL, 'Maducha' , 0),
('subacia', 'Maducha', 'Maducha' , NULL),
('subacia', NULL, 'Maputo' , 0),
('subacia', 'Maputo', 'Maputo' , NULL),
('subacia', NULL, 'Bambe' , 0),
('subacia', 'Matola', 'Matola' , NULL),
('subacia', NULL, 'Mucambe' , 0),
('subacia', 'Mucambe', 'Mucambe' , NULL),
('subacia', NULL, 'Mulalace' , 0),
('subacia', 'Mulalace', 'Mulalace' , NULL),
('subacia', NULL, 'Mutamba' , 0),
('subacia', 'Mutamba', 'Mutamba' , NULL),
('subacia', NULL, 'Nhangualala' , 0),
('subacia', 'Nhangualala', 'Nhangualala' , NULL),
('subacia', NULL, 'Panga' , 0),
('subacia', 'Panga', 'Panga' , NULL),
('subacia', NULL, 'Save' , 0),
('subacia', 'Save', 'Save' , NULL),
('subacia', NULL, 'Tembe' , 0),
('subacia', 'Tembe', 'Tembe' , NULL),
('subacia', NULL, 'Umbelézi' , 0),
('subacia', 'Umbelézi', 'Umbelézi' , NULL),
('subacia', NULL, 'Outra' , 0),
('subacia', 'Outra', 'Outra' , NULL);

UPDATE domains.subacia SET ara = 'Sul' WHERE key IN ('Bambe', 'Bembe', 'Chiendsele', 'Das Pedras', 'Davetave', 'Fúti', 'Govuro', 'Incomati', 'Inhanombe', 'Inharrime', 'Inhavumalala', 'Limpopo', 'Maducha', 'Maputo', 'Matola', 'Mucambe', 'Mulalace', 'Mutamba', 'Nhangualala', 'Panga', 'Save', 'Tembe', 'Umbelézi', 'Outra');

COMMIT;
