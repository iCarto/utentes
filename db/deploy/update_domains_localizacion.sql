-- Deploy utentes:update_domains_localizacion to pg

BEGIN;

ALTER TABLE domains.provincia ADD COLUMN ara text;
ALTER TABLE domains.distrito ADD COLUMN ara text;
ALTER TABLE domains.posto ADD COLUMN ara text;

INSERT INTO domains.provincia (category, key, value, ordering, parent, tooltip, ara) VALUES
    ('provincia', NULL, NULL, 0, 'Sul', NULL, 'Sul'),
    ('provincia', 'Gaza', NULL, NULL, 'Sul', NULL, 'Sul'),
    ('provincia', 'Inhambane', NULL, NULL, 'Sul', NULL, 'Sul'),
    ('provincia', 'Manica', NULL, NULL, 'Sul', NULL, 'Sul'),
    ('provincia', 'Maputo', NULL, NULL, 'Sul', NULL, 'Sul'),
    ('provincia', 'Nampula', NULL, NULL, NULL, NULL, NULL),
    ('provincia', 'Sofala', NULL, NULL, 'Sul', NULL, 'Sul'),
    ('provincia', 'Tete', NULL, NULL, NULL, NULL, NULL),
    ('provincia', 'Zambezia', NULL, NULL, NULL, NULL, NULL);

UPDATE domains.provincia SET ara = 'Norte' WHERE key IN ('Cabo Delgado', 'Niassa');
INSERT INTO domains.provincia VALUES ('provincia', NULL, NULL, 0, 'Norte', NULL, 'Norte');
UPDATE domains.provincia SET parent = 'Norte' WHERE key IN ('Cabo Delgado', 'Niassa');

INSERT INTO domains.distrito (category, key, ordering, parent) VALUES
('distrito', NULL, 0, 'Gaza'),
('distrito', 'Bilene', NULL, 'Gaza'),
('distrito', 'Chibuto', NULL, 'Gaza'),
('distrito', 'Chicualacuala', NULL, 'Gaza'),
('distrito', 'Chigubo', NULL, 'Gaza'),
('distrito', 'Chokwe', NULL, 'Gaza'),
('distrito', 'Cidade De Xai-Xai', NULL, 'Gaza'),
('distrito', 'Guija', NULL, 'Gaza'),
('distrito', 'Mabalane', NULL, 'Gaza'),
('distrito', 'Massangena', NULL, 'Gaza'),
('distrito', 'Massingir', NULL, 'Gaza'),
('distrito', 'Xai-Xai', NULL, 'Gaza'),
('distrito', NULL, 0, 'Inhambane'),
('distrito', 'Cidade De Inhambane', NULL, 'Inhambane'),
('distrito', 'Funhalouro', NULL, 'Inhambane'),
('distrito', 'Govuro', NULL, 'Inhambane'),
('distrito', 'Homoine', NULL, 'Inhambane'),
('distrito', 'Inharrime', NULL, 'Inhambane'),
('distrito', 'Inhassoro', NULL, 'Inhambane'),
('distrito', 'Jangamo', NULL, 'Inhambane'),
('distrito', 'Mabote', NULL, 'Inhambane'),
('distrito', 'Mandlakaze', NULL, 'Inhambane'),
('distrito', 'Massinga', NULL, 'Inhambane'),
('distrito', 'Maxixe', NULL, 'Inhambane'),
('distrito', 'Morrumbene', NULL, 'Inhambane'),
('distrito', 'Panda', NULL, 'Inhambane'),
('distrito', 'Vilankulo', NULL, 'Inhambane'),
('distrito', 'Zavala', NULL, 'Inhambane'),
('distrito', NULL, 0, 'Manica'),
('distrito', 'Barue', NULL, 'Manica'),
('distrito', 'Cidade De Chimoio', NULL, 'Manica'),
('distrito', 'Gondola', NULL, 'Manica'),
('distrito', 'Guro', NULL, 'Manica'),
('distrito', 'Machaze', NULL, 'Manica'),
('distrito', 'Macossa', NULL, 'Manica'),
('distrito', 'Manica', NULL, 'Manica'),
('distrito', 'Mossurize', NULL, 'Manica'),
('distrito', 'Sussundenga', NULL, 'Manica'),
('distrito', 'Tambara', NULL, 'Manica'),
('distrito', NULL, 0, 'Maputo'),
('distrito', 'Boane', NULL, 'Maputo'),
('distrito', 'Cidade Da Matola', NULL, 'Maputo'),
('distrito', 'Cidade De Maputo', NULL, 'Maputo'),
('distrito', 'Magude', NULL, 'Maputo'),
('distrito', 'Manhiça', NULL, 'Maputo'),
('distrito', 'Marracuene', NULL, 'Maputo'),
('distrito', 'Matutuine', NULL, 'Maputo'),
('distrito', 'Moamba', NULL, 'Maputo'),
('distrito', 'Namaacha', NULL, 'Maputo'),
('distrito', NULL, 0, 'Nampula'),
('distrito', 'Angoche', NULL, 'Nampula'),
('distrito', 'Cidade De Nampula', NULL, 'Nampula'),
('distrito', 'Erati', NULL, 'Nampula'),
('distrito', 'Ilha De Moçambique', NULL, 'Nampula'),
('distrito', 'Lalaua', NULL, 'Nampula'),
('distrito', 'Malema', NULL, 'Nampula'),
('distrito', 'Meconta', NULL, 'Nampula'),
('distrito', 'Mecuburi', NULL, 'Nampula'),
('distrito', 'Memba', NULL, 'Nampula'),
('distrito', 'Mogincual', NULL, 'Nampula'),
('distrito', 'Mogovolas', NULL, 'Nampula'),
('distrito', 'Moma', NULL, 'Nampula'),
('distrito', 'Monapo', NULL, 'Nampula'),
('distrito', 'Mossuril', NULL, 'Nampula'),
('distrito', 'Muecate', NULL, 'Nampula'),
('distrito', 'Murrupula', NULL, 'Nampula'),
('distrito', 'Nacala', NULL, 'Nampula'),
('distrito', 'Nacala A Velha', NULL, 'Nampula'),
('distrito', 'Nacaroa', NULL, 'Nampula'),
('distrito', 'Nampula', NULL, 'Nampula'),
('distrito', 'Ribaue', NULL, 'Nampula'),
('distrito', 'Ilha Licom', NULL, 'Niassa'),
('distrito', 'Ilha Risunodo', NULL, 'Niassa'),
('distrito', NULL, 0, 'Sofala'),
('distrito', 'Buzi', NULL, 'Sofala'),
('distrito', 'Caia', NULL, 'Sofala'),
('distrito', 'Chemba', NULL, 'Sofala'),
('distrito', 'Cheringoma', NULL, 'Sofala'),
('distrito', 'Chibabava', NULL, 'Sofala'),
('distrito', 'Cidade Da Beira', NULL, 'Sofala'),
('distrito', 'Dondo', NULL, 'Sofala'),
('distrito', 'Gorongosa', NULL, 'Sofala'),
('distrito', 'Machanga', NULL, 'Sofala'),
('distrito', 'Maringue', NULL, 'Sofala'),
('distrito', 'Marromeu', NULL, 'Sofala'),
('distrito', 'Muanza', NULL, 'Sofala'),
('distrito', 'Nhamatanda', NULL, 'Sofala'),
('distrito', NULL, 0, 'Tete'),
('distrito', 'Angonia', NULL, 'Tete'),
('distrito', 'Cahora Bassa', NULL, 'Tete'),
('distrito', 'Changara', NULL, 'Tete'),
('distrito', 'Chifunde', NULL, 'Tete'),
('distrito', 'Chiuta', NULL, 'Tete'),
('distrito', 'Cidade De Tete', NULL, 'Tete'),
('distrito', 'Macanga', NULL, 'Tete'),
('distrito', 'Magoe', NULL, 'Tete'),
('distrito', 'Maravia', NULL, 'Tete'),
('distrito', 'Moatize', NULL, 'Tete'),
('distrito', 'Mutarara', NULL, 'Tete'),
('distrito', 'Tsangano', NULL, 'Tete'),
('distrito', 'Zumbu', NULL, 'Tete'),
('distrito', NULL, 0, 'Zambezia'),
('distrito', 'Alto Molocue', NULL, 'Zambezia'),
('distrito', 'Chinde', NULL, 'Zambezia'),
('distrito', 'Cidade De Quelimane', NULL, 'Zambezia'),
('distrito', 'Gile', NULL, 'Zambezia'),
('distrito', 'Gurue', NULL, 'Zambezia'),
('distrito', 'Ile', NULL, 'Zambezia'),
('distrito', 'Inhassunge', NULL, 'Zambezia'),
('distrito', 'Lugela', NULL, 'Zambezia'),
('distrito', 'Maganja Da Costa', NULL, 'Zambezia'),
('distrito', 'Milange', NULL, 'Zambezia'),
('distrito', 'Mocuba', NULL, 'Zambezia'),
('distrito', 'Mopeia', NULL, 'Zambezia'),
('distrito', 'Morrumbala', NULL, 'Zambezia'),
('distrito', 'Namacurra', NULL, 'Zambezia'),
('distrito', 'Namarroi', NULL, 'Zambezia'),
('distrito', 'Nicoadala', NULL, 'Zambezia'),
('distrito', 'Pebane', NULL, 'Zambezia');


UPDATE domains.distrito SET ara = 'Norte' WHERE key IN ('Ancuabe', 'Balama', 'Chiure', 'Cidade de Pemba', 'Mecufi', 'Meluco', 'Mocimboa da Praia', 'Montepuez', 'Mueda', 'Muidumbe', 'Namuno', 'Nangade', 'Palma', 'Pemba-Metuge', 'Quissanga', 'Ibo', 'Macomia', 'Cidade de Lichinga', 'Cuamba', 'Lago', 'Lichinga', 'Majune', 'Mandimba', 'Marrupa', 'Maua', 'Mavago', 'Mecanhelas', 'Mecula', 'Metarica', 'Muembe', 'Ngauma', 'Nipepe', 'Sanga');

UPDATE domains.distrito SET ara = 'Sul' WHERE key IN ('Bilene', 'Chibuto', 'Chicualacuala', 'Chigubo', 'Chokwe', 'Cidade De Xai-Xai', 'Guija', 'Mabalane', 'Massangena', 'Massingir', 'Xai-Xai', 'Cidade De Inhambane', 'Funhalouro', 'Govuro', 'Homoine', 'Inharrime', 'Inhassoro', 'Jangamo', 'Mabote', 'Mandlakaze', 'Massinga', 'Maxixe', 'Morrumbene', 'Panda', 'Vilankulo', 'Zavala', 'Machaze', 'Boane', 'Cidade Da Matola', 'Cidade De Maputo', 'Magude', 'Manhiça', 'Marracuene', 'Matutuine', 'Moamba', 'Namaacha', 'Machanga');

UPDATE domains.distrito SET ara = 'Norte' WHERE key IS NULL AND parent IN ('Cabo Delgado', 'Niassa');
UPDATE domains.distrito SET ara = 'Sul' WHERE key IS NULL AND parent IN ('Gaza', 'Inhambane', 'Manica', 'Maputo', 'Sofala');








INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Gorongosa');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Massingir');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Ilha De Moçambique');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade Da Matola');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Malema');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade De Maputo');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Xai-Xai');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chiuta');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Tambara');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Jangamo');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Nacala-A-Velha');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Alto Molocue');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade De Xai-Xai');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade De Quelimane');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Ile');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Memba');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade De Nampula');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Tsangano');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Panda');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Lalaua');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Murrupula');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Govuro');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Zavala');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Bilene');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mossurize');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Maravia');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Funhalouro');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Macanga');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Maxixe');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Nampula');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Moatize');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mabote');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Meconta');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Sussundenga');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chinde');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Nicoadala');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mossuril');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mogincual');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Ribaue');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chokwe');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Manhiça');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Massinga');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Milange');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Manica');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Pebane');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Caia');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Vilankulo');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Machanga');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Barue');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Boane');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Changara');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade De Inhambane');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Gile');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Namaacha');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chigubo');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Inhassunge');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Macossa');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chicualacuala');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Guro');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Angonia');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Guija');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Muecate');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Magude');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mandlakaze');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Morrumbene');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Morrumbala');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Namacurra');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mopeia');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Erati');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chifunde');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Nacaroa');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Angoche');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Gondola');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Homoine');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mecuburi');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mutarara');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mogovolas');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Monapo');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Inharrime');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Namarroi');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Nhamatanda');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Machaze');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Marromeu');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chibabava');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Massangena');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cahora Bassa');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade De Tete');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Maganja Da Costa');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Nacala');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade Da Beira');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Magoe');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Moma');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Gurue');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Inhassoro');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cheringoma');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Cidade De Chimoio');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Lugela');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Muanza');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mabalane');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Marracuene');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Dondo');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Zumbu');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chibuto');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Buzi');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Matutuine');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Moamba');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Mocuba');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Chemba');
INSERT INTO domains.posto (category, key, ordering, parent) values ('posto', NULL, 0, 'Maringue');


INSERT INTO domains.posto (category, key, parent) VALUES
('posto', 'Alto Molocue', 'Alto Molocue'),
('posto', 'Nauela', 'Alto Molocue'),
('posto', 'Angoche', 'Angoche'),
('posto', 'Aube', 'Angoche'),
('posto', 'Boila', 'Angoche'),
('posto', 'Namaponda', 'Angoche'),
('posto', 'Domue', 'Angonia'),
('posto', 'Ulongue', 'Angonia'),
('posto', 'Catandica', 'Barue'),
('posto', 'Choa', 'Barue'),
('posto', 'Nhampassa', 'Barue'),
('posto', 'Chissano', 'Bilene'),
('posto', 'Macia', 'Bilene'),
('posto', 'Makluane', 'Bilene'),
('posto', 'Mazivila', 'Bilene'),
('posto', 'Messano', 'Bilene'),
('posto', 'Praia De Bilene', 'Bilene'),
('posto', 'Boane', 'Boane'),
('posto', 'Matola Rio', 'Boane'),
('posto', 'Buzi', 'Buzi'),
('posto', 'Estaquinha', 'Buzi'),
('posto', 'Sofala', 'Buzi'),
('posto', 'Chintholo', 'Cahora Bassa'),
('posto', 'Chitima', 'Cahora Bassa'),
('posto', 'Songo', 'Cahora Bassa'),
('posto', 'Caia', 'Caia'),
('posto', 'Murraça', 'Caia'),
('posto', 'Sena', 'Caia'),
('posto', 'Chipembere', 'Changara'),
('posto', 'Kachembe', 'Changara'),
('posto', 'Luenha', 'Changara'),
('posto', 'Chemba', 'Chemba'),
('posto', 'Chiramba', 'Chemba'),
('posto', 'Mulima', 'Chemba'),
('posto', 'Inhaminga', 'Cheringoma'),
('posto', 'Inhamitanga', 'Cheringoma'),
('posto', 'Chibabava', 'Chibabava'),
('posto', 'Goonda', 'Chibabava'),
('posto', 'Muxungue', 'Chibabava'),
('posto', 'Alto Changane', 'Chibuto'),
('posto', 'Chaimite', 'Chibuto'),
('posto', 'Changanine', 'Chibuto'),
('posto', 'Chibuto', 'Chibuto'),
('posto', 'Godide', 'Chibuto'),
('posto', 'Malehice', 'Chibuto'),
('posto', 'Mapai', 'Chicualacuala'),
('posto', 'Pafuri', 'Chicualacuala'),
('posto', 'Vila Eduardo Mondlane', 'Chicualacuala'),
('posto', 'Chifunde', 'Chifunde'),
('posto', 'Mualadze', 'Chifunde'),
('posto', 'Nsadzu', 'Chifunde'),
('posto', 'Chigubo', 'Chigubo'),
('posto', 'Dindiza', 'Chigubo'),
('posto', 'Chinde', 'Chinde'),
('posto', 'Luabo', 'Chinde'),
('posto', 'Micaune', 'Chinde'),
('posto', 'Kazula', 'Chiuta'),
('posto', 'Manje', 'Chiuta'),
('posto', 'Chokwe', 'Chokwe'),
('posto', 'Lionde', 'Chokwe'),
('posto', 'Macarretane', 'Chokwe'),
('posto', 'Xilembene', 'Chokwe'),
('posto', 'Cidade Da Beira', 'Cidade Da Beira'),
('posto', 'Cidade Da Matola', 'Cidade Da Matola'),
('posto', 'Cidade De Chimoio', 'Cidade De Chimoio'),
('posto', 'Cidade De Inhambane', 'Cidade De Inhambane'),
('posto', 'Cidade De Maputo', 'Cidade De Maputo'),
('posto', 'Cidade De Nampula', 'Cidade De Nampula'),
('posto', 'Cidade De Quelimane', 'Cidade De Quelimane'),
('posto', 'Cidade De Tete', 'Cidade De Tete'),
('posto', 'Cidade De Xai-Xai', 'Cidade De Xai-Xai'),
('posto', 'Dondo', 'Dondo'),
('posto', 'Mafambisse', 'Dondo'),
('posto', 'Alua', 'Erati'),
('posto', 'Namapa', 'Erati'),
('posto', 'Namiroa', 'Erati'),
('posto', 'Funhalouro', 'Funhalouro'),
('posto', 'Tome', 'Funhalouro'),
('posto', 'Alto Ligonha', 'Gile'),
('posto', 'Gile', 'Gile'),
('posto', 'Amatongas', 'Gondola'),
('posto', 'Cafumpe', 'Gondola'),
('posto', 'Gondola', 'Gondola'),
('posto', 'Inchope', 'Gondola'),
('posto', 'Macate', 'Gondola'),
('posto', 'Matsinho', 'Gondola'),
('posto', 'Zembe', 'Gondola'),
('posto', 'Gorongosa', 'Gorongosa'),
('posto', 'Nhamadze', 'Gorongosa'),
('posto', 'Nova Mambone', 'Govuro'),
('posto', 'Caniçado', 'Guija'),
('posto', 'Chivongoene', 'Guija'),
('posto', 'Mubangoene', 'Guija'),
('posto', 'Nalazi', 'Guija'),
('posto', 'Guro', 'Guro'),
('posto', 'Mandie', 'Guro'),
('posto', 'Mungari', 'Guro'),
('posto', 'Nhamassonge', 'Guro'),
('posto', 'Gurue', 'Gurue'),
('posto', 'Lioma', 'Gurue'),
('posto', 'Mepuagiua', 'Gurue'),
('posto', 'Homoine', 'Homoine'),
('posto', 'Pembe', 'Homoine'),
('posto', 'Ile', 'Ile'),
('posto', 'Mulevala', 'Ile'),
('posto', 'Socone', 'Ile'),
('posto', 'Ilha De Moçambique', 'Ilha De Moçambique'),
('posto', 'Lumbo', 'Ilha De Moçambique'),
('posto', 'Inharrime', 'Inharrime'),
('posto', 'Mocumbi', 'Inharrime'),
('posto', 'Bazaruto', 'Inhassoro'),
('posto', 'Inhassoro', 'Inhassoro'),
('posto', 'Gonhane', 'Inhassunge'),
('posto', 'Inhassunge', 'Inhassunge'),
('posto', 'Cumbana', 'Jangamo'),
('posto', 'Jangamo', 'Jangamo'),
('posto', 'Lalaua', 'Lalaua'),
('posto', 'Meti', 'Lalaua'),
('posto', 'Lugela', 'Lugela'),
('posto', 'Muabanama', 'Lugela'),
('posto', 'Munhamade', 'Lugela'),
('posto', 'Tacuane', 'Lugela'),
('posto', 'Combomune', 'Mabalane'),
('posto', 'Mabalane', 'Mabalane'),
('posto', 'Ntlavene', 'Mabalane'),
('posto', 'Mabote', 'Mabote'),
('posto', 'Zimane', 'Mabote'),
('posto', 'Zinave', 'Mabote'),
('posto', 'Chidzolomondo', 'Macanga'),
('posto', 'Furancungo', 'Macanga'),
('posto', 'Divinhe', 'Machanga'),
('posto', 'Machanga', 'Machanga'),
('posto', 'Chitobe', 'Machaze'),
('posto', 'Save', 'Machaze'),
('posto', 'Macossa', 'Macossa'),
('posto', 'Nguawala', 'Macossa'),
('posto', 'Nhamagua', 'Macossa'),
('posto', 'Bajone', 'Maganja Da Costa'),
('posto', 'Maganja', 'Maganja Da Costa'),
('posto', 'Mocubela', 'Maganja Da Costa'),
('posto', 'Nante', 'Maganja Da Costa'),
('posto', 'Chinthopo', 'Magoe'),
('posto', 'Mphende', 'Magoe'),
('posto', 'Mukumbura', 'Magoe'),
('posto', 'Magude', 'Magude'),
('posto', 'Mahele', 'Magude'),
('posto', 'Mapulanguene', 'Magude'),
('posto', 'Motaze', 'Magude'),
('posto', 'Panjane', 'Magude'),
('posto', 'Chihulo', 'Malema'),
('posto', 'Malema', 'Malema'),
('posto', 'Mutuali', 'Malema'),
('posto', 'Chibonzane', 'Mandlakaze'),
('posto', 'Chidenguele', 'Mandlakaze'),
('posto', 'Macuacua', 'Mandlakaze'),
('posto', 'Mandlakaze', 'Mandlakaze'),
('posto', 'Mazucane', 'Mandlakaze'),
('posto', 'Nguzene', 'Mandlakaze'),
('posto', 'Xhalala', 'Mandlakaze'),
('posto', 'Calanga', 'Manhiça'),
('posto', 'Ilha Josina Machel', 'Manhiça'),
('posto', 'Maluana', 'Manhiça'),
('posto', 'Manhiãa', 'Manhiça'),
('posto', 'Palmeira', 'Manhiça'),
('posto', 'Xinavane', 'Manhiça'),
('posto', 'Machipanda', 'Manica'),
('posto', 'Manica', 'Manica'),
('posto', 'Mavonde', 'Manica'),
('posto', 'Messica', 'Manica'),
('posto', 'Vanduzi', 'Manica'),
('posto', 'Chipera', 'Maravia'),
('posto', 'Chiputu', 'Maravia'),
('posto', 'Fingoe', 'Maravia'),
('posto', 'Malowera', 'Maravia'),
('posto', 'Canxixe', 'Maringue'),
('posto', 'Maringue', 'Maringue'),
('posto', 'Subwe', 'Maringue'),
('posto', 'Machubo', 'Marracuene'),
('posto', 'Marracuene', 'Marracuene'),
('posto', 'Chupanga', 'Marromeu'),
('posto', 'Marromeu', 'Marromeu'),
('posto', 'Massangena', 'Massangena'),
('posto', 'Mavue', 'Massangena'),
('posto', 'Chicomo', 'Massinga'),
('posto', 'Massinga', 'Massinga'),
('posto', 'Massingir', 'Massingir'),
('posto', 'Mavodze', 'Massingir'),
('posto', 'Zulo', 'Massingir'),
('posto', 'Bela Vista', 'Matutuine'),
('posto', 'Catuane', 'Matutuine'),
('posto', 'Mugazine', 'Matutuine'),
('posto', 'Ndelane', 'Matutuine'),
('posto', 'Zitundo', 'Matutuine'),
('posto', 'Maxixe', 'Maxixe'),
('posto', '7 De Abril', 'Meconta'),
('posto', 'Corrane', 'Meconta'),
('posto', 'Meconta', 'Meconta'),
('posto', 'Namialo', 'Meconta'),
('posto', 'Mecuburi', 'Mecuburi'),
('posto', 'Milhana', 'Mecuburi'),
('posto', 'Muite', 'Mecuburi'),
('posto', 'Namina', 'Mecuburi'),
('posto', 'Chipene', 'Memba'),
('posto', 'Mazula', 'Memba'),
('posto', 'Memba', 'Memba'),
('posto', 'Majaua', 'Milange'),
('posto', 'Milange', 'Milange'),
('posto', 'Molumbo', 'Milange'),
('posto', 'Mongue', 'Milange'),
('posto', 'Moamba', 'Moamba'),
('posto', 'Pessene', 'Moamba'),
('posto', 'Ressano Garcia', 'Moamba'),
('posto', 'Sabie', 'Moamba'),
('posto', 'Kambulatsisi', 'Moatize'),
('posto', 'Moatize', 'Moatize'),
('posto', 'Zobue', 'Moatize'),
('posto', 'Mocuba', 'Mocuba'),
('posto', 'Mugeba', 'Mocuba'),
('posto', 'Namanjavira', 'Mocuba'),
('posto', 'Liupo', 'Mogincual'),
('posto', 'Namige', 'Mogincual'),
('posto', 'Quinga', 'Mogincual'),
('posto', 'Quixaxe', 'Mogincual'),
('posto', 'Calipo', 'Mogovolas'),
('posto', 'Iuluti', 'Mogovolas'),
('posto', 'Muatua', 'Mogovolas'),
('posto', 'Nametil', 'Mogovolas'),
('posto', 'Nanhupo Rio', 'Mogovolas'),
('posto', 'Chalaua', 'Moma'),
('posto', 'Larde', 'Moma'),
('posto', 'Moma', 'Moma'),
('posto', 'Mucuali', 'Moma'),
('posto', 'Itoculo', 'Monapo'),
('posto', 'Monapo', 'Monapo'),
('posto', 'Netia', 'Monapo'),
('posto', 'Campo', 'Mopeia'),
('posto', 'Mopeia', 'Mopeia'),
('posto', 'Chire', 'Morrumbala'),
('posto', 'Derre', 'Morrumbala'),
('posto', 'Megaza', 'Morrumbala'),
('posto', 'Morrumbala', 'Morrumbala'),
('posto', 'Morrumbene', 'Morrumbene'),
('posto', 'Mucoduene', 'Morrumbene'),
('posto', 'Lunga', 'Mossuril'),
('posto', 'Matibane', 'Mossuril'),
('posto', 'Mossuril', 'Mossuril'),
('posto', 'Chiurairue', 'Mossurize'),
('posto', 'Dacata', 'Mossurize'),
('posto', 'Espungabera', 'Mossurize'),
('posto', 'Galinha', 'Muanza'),
('posto', 'Muanza', 'Muanza'),
('posto', 'Imala', 'Muecate'),
('posto', 'Muculoene', 'Muecate'),
('posto', 'Muecate', 'Muecate'),
('posto', 'Chinga', 'Murrupula'),
('posto', 'Murrupula', 'Murrupula'),
('posto', 'Nihessiue', 'Murrupula'),
('posto', 'Charre', 'Mutarara'),
('posto', 'Doa', 'Mutarara'),
('posto', 'Inhangoma', 'Mutarara'),
('posto', 'Nhamayabue', 'Mutarara'),
('posto', 'Nacala', 'Nacala'),
('posto', 'Covo', 'Nacala-A-Velha'),
('posto', 'Nacala-A-Velha', 'Nacala-A-Velha'),
('posto', 'Intete', 'Nacaroa'),
('posto', 'Nacaroa', 'Nacaroa'),
('posto', 'Saua-Saua', 'Nacaroa'),
('posto', 'Changalane', 'Namaacha'),
('posto', 'Namaacha', 'Namaacha'),
('posto', 'Macuze', 'Namacurra'),
('posto', 'Namacurra', 'Namacurra'),
('posto', 'Namarroi', 'Namarroi'),
('posto', 'Regone', 'Namarroi'),
('posto', 'Anchilo', 'Nampula'),
('posto', 'Mutivasse', 'Nampula'),
('posto', 'Namaita', 'Nampula'),
('posto', 'Rapale', 'Nampula'),
('posto', 'Nhamatanda', 'Nhamatanda'),
('posto', 'Tica', 'Nhamatanda'),
('posto', 'Maquival', 'Nicoadala'),
('posto', 'Nicoadala', 'Nicoadala'),
('posto', 'Mawayela', 'Panda'),
('posto', 'Panda', 'Panda'),
('posto', 'Urrene', 'Panda'),
('posto', 'Mualama', 'Pebane'),
('posto', 'Naburi', 'Pebane'),
('posto', 'Pebane', 'Pebane'),
('posto', 'Cunle', 'Ribaue'),
('posto', 'Iapala', 'Ribaue'),
('posto', 'Ribaue', 'Ribaue'),
('posto', 'Dombe', 'Sussundenga'),
('posto', 'Muoha', 'Sussundenga'),
('posto', 'Rotanda', 'Sussundenga'),
('posto', 'Sussundenga', 'Sussundenga'),
('posto', 'Bazua', 'Tambara'),
('posto', 'Nhacafula', 'Tambara'),
('posto', 'Nhacolo', 'Tambara'),
('posto', 'Ntengo-Wa-Mbalame', 'Tsangano'),
('posto', 'Tsangano', 'Tsangano'),
('posto', 'Mapinhane', 'Vilankulo'),
('posto', 'Vilankulo', 'Vilankulo'),
('posto', 'Chicumbane', 'Xai-Xai'),
('posto', 'Chongoene', 'Xai-Xai'),
('posto', 'Zongoene', 'Xai-Xai'),
('posto', 'Quissico', 'Zavala'),
('posto', 'Zandamela', 'Zavala'),
('posto', 'Muze', 'Zumbu'),
('posto', 'Zambue', 'Zumbu'),
('posto', 'Zumbu', 'Zumbu');




UPDATE domains.posto SET ara = 'Norte' WHERE key IN ('Ancuabe', 'Mesa', 'Metoro', 'Mavala', 'Impiri', 'Balama', 'Kuekue', 'Katapua', 'Chiure', 'Chiure Velho', 'Mazeze', 'Ocua', 'Namogelia', 'Cidade de Lichinga', 'Cidade de Pemba', 'Cuamba', 'Lurio', 'Etarara', 'Ibo', 'Quirimba', 'Luhno', 'Maniamba', 'Metangula', 'Cobue', 'Meponda', 'Chimbonila', 'Lione', 'Quiterajo', 'Chai', 'Mucojo', 'Macomia', 'Malanga', 'Muaquia', 'Nairrubi', 'Mitande', 'Mandimba', 'Marangira', 'Marrupa', 'Nungo', 'Maua', 'Maiaca', 'M''Sawize', 'Mavago', 'Chiuta', 'Insaca', 'Murrebue', 'Mecufi', 'Mecula', 'Matondovela', 'Meluco', 'Muaguide', 'Metarica', 'Nacumua', 'Diaca', 'Mbau', 'Mocimboa da Praia', 'Nairoto', 'Mirate', 'Namanhumbir', 'Montepuez', 'Mapupulo', 'N''Gapa', 'Negomano', 'Mueda', 'Imbuo', 'Chapa', 'Chiconono', 'Muembe', 'Chitunda', 'Muidumbe', 'Miteda', 'Meloco', 'Namuno', 'N''Cumpe', 'Hucula', 'Papai', 'Machoca', 'Nangade', 'M''Tamba', 'Itepela', 'Massangulo', 'Muipite', 'Nipepe', 'Olumbi', 'Quionga', 'Palma', 'Pundanhar', 'Metuge', 'Mieze', 'Quissanga', 'Bilibiza', 'Mahate', 'Macaloge', 'Unango', 'Lussimbesse', 'Matchedje');

UPDATE domains.posto SET ara = 'Sul' WHERE key IN ('Chissano', 'Macia', 'Makluane', 'Mazivila', 'Messano', 'Praia De Bilene', 'Boane', 'Matola Rio', 'Alto Changane', 'Chaimite', 'Changanine', 'Chibuto', 'Godide', 'Malehice', 'Mapai', 'Pafuri', 'Vila Eduardo Mondlane', 'Chigubo', 'Dindiza', 'Chokwe', 'Lionde', 'Macarretane', 'Xilembene', 'Cidade Da Matola', 'Cidade De Inhambane', 'Cidade De Maputo', 'Cidade De Xai-Xai', 'Funhalouro', 'Tome', 'Nova Mambone', 'Caniãado', 'Chivongoene', 'Mubangoene', 'Nalazi', 'Homoine', 'Pembe', 'Inharrime', 'Mocumbi', 'Bazaruto', 'Inhassoro', 'Cumbana', 'Jangamo', 'Combomune', 'Mabalane', 'Ntlavene', 'Mabote', 'Zimane', 'Zinave', 'Divinhe', 'Machanga', 'Chitobe', 'Save', 'Magude', 'Mahele', 'Mapulanguene', 'Motaze', 'Panjane', 'Chibonzane', 'Chidenguele', 'Macuacua', 'Mandlakaze', 'Mazucane', 'Nguzene', 'Xhalala', 'Calanga', 'Ilha Josina Machel', 'Maluana', 'Manhiça', 'Palmeira', 'Xinavane', 'Machubo', 'Marracuene', 'Massangena', 'Mavue', 'Chicomo', 'Massinga', 'Massingir', 'Mavodze', 'Zulo', 'Bela Vista', 'Catuane', 'Mugazine', 'Ndelane', 'Zitundo', 'Maxixe', 'Moamba', 'Pessene', 'Ressano Garcia', 'Sabie', 'Morrumbene', 'Mucoduene', 'Changalane', 'Namaacha', 'Mawayela', 'Panda', 'Urrene', 'Mapinhane', 'Vilankulo', 'Chicumbane', 'Chongoene', 'Zongoene', 'Quissico', 'Zandamela');

UPDATE domains.posto SET ara = 'Norte' WHERE key IS NULL AND parent IN ('Ancuabe', 'Balama', 'Chiure', 'Cidade de Pemba', 'Mecufi', 'Meluco', 'Mocimboa da Praia', 'Montepuez', 'Mueda', 'Muidumbe', 'Namuno', 'Nangade', 'Palma', 'Pemba-Metuge', 'Quissanga', 'Ibo', 'Macomia', 'Cidade de Lichinga', 'Cuamba', 'Lago', 'Lichinga', 'Majune', 'Mandimba', 'Marrupa', 'Maua', 'Mavago', 'Mecanhelas', 'Mecula', 'Metarica', 'Muembe', 'Ngauma', 'Nipepe', 'Sanga');

UPDATE domains.posto SET ara = 'Sul' WHERE key IS NULL AND parent IN ('Bilene', 'Chibuto', 'Chicualacuala', 'Chigubo', 'Chokwe', 'Cidade De Xai-Xai', 'Guija', 'Mabalane', 'Massangena', 'Massingir', 'Xai-Xai', 'Cidade De Inhambane', 'Funhalouro', 'Govuro', 'Homoine', 'Inharrime', 'Inhassoro', 'Jangamo', 'Mabote', 'Mandlakaze', 'Massinga', 'Maxixe', 'Morrumbene', 'Panda', 'Vilankulo', 'Zavala', 'Machaze', 'Boane', 'Cidade Da Matola', 'Cidade De Maputo', 'Magude', 'Manhiça', 'Marracuene', 'Matutuine', 'Moamba', 'Namaacha', 'Machanga');

update domains.distrito set ara = 'Norte' WHERE key = 'Pemba - Metuge';





COMMIT;
