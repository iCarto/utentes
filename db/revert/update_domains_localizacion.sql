-- Revert utentes:update_domains_localizacion from pg

BEGIN;

ALTER TABLE domains.provincia DROP COLUMN ara;
ALTER TABLE domains.distrito DROP COLUMN ara;
ALTER TABLE domains.posto DROP COLUMN ara;



DELETE FROM domains.provincia WHERE key IN ('Gaza', 'Inhambane', 'Manica', 'Maputo', 'Nampula', 'Sofala', 'Tete', 'Zambezia');

DELETE FROM domains.distrito WHERE key IN ('Bilene', 'Chibuto', 'Chicualacuala', 'Chigubo', 'Chokwe', 'Cidade De Xai-Xai', 'Guija', 'Mabalane', 'Massangena', 'Massingir', 'Xai-Xai', 'Cidade De Inhambane', 'Funhalouro', 'Govuro', 'Homoine', 'Inharrime', 'Inhassoro', 'Jangamo', 'Mabote', 'Mandlakaze', 'Massinga', 'Maxixe', 'Morrumbene', 'Panda', 'Vilankulo', 'Zavala', 'Barue', 'Cidade De Chimoio', 'Gondola', 'Guro', 'Machaze', 'Macossa', 'Manica', 'Mossurize', 'Sussundenga', 'Tambara', 'Boane', 'Cidade Da Matola', 'Cidade De Maputo', 'Magude', 'Manhiça', 'Marracuene', 'Matutuine', 'Moamba', 'Namaacha', 'Angoche', 'Cidade De Nampula', 'Erati', 'Ilha De Moçambique', 'Lalaua', 'Malema', 'Meconta', 'Mecuburi', 'Memba', 'Mogincual', 'Mogovolas', 'Moma', 'Monapo', 'Mossuril', 'Muecate', 'Murrupula', 'Nacala', 'Nacala A Velha', 'Nacaroa', 'Nampula', 'Ribaue', 'Ilha Licom', 'Ilha Risunodo', 'Buzi', 'Caia', 'Chemba', 'Cheringoma', 'Chibabava', 'Cidade Da Beira', 'Dondo', 'Gorongosa', 'Machanga', 'Maringue', 'Marromeu', 'Muanza', 'Nhamatanda', 'Angonia', 'Cahora Bassa', 'Changara', 'Chifunde', 'Chiuta', 'Cidade De Tete', 'Macanga', 'Magoe', 'Maravia', 'Moatize', 'Mutarara', 'Tsangano', 'Zumbu', 'Alto Molocue', 'Chinde', 'Cidade De Quelimane', 'Gile', 'Gurue', 'Ile', 'Inhassunge', 'Lugela', 'Maganja Da Costa', 'Milange', 'Mocuba', 'Mopeia', 'Morrumbala', 'Namacurra', 'Namarroi', 'Nicoadala', 'Pebane');

DELETE FROM domains.posto WHERE parent IN ('Gorongosa', 'Massingir', 'Ilha De Moçambique', 'Cidade Da Matola', 'Malema', 'Cidade De Maputo', 'Xai-Xai', 'Chiuta', 'Tambara', 'Jangamo', 'Nacala-A-Velha', 'Alto Molocue', 'Cidade De Xai-Xai', 'Cidade De Quelimane', 'Ile', 'Memba', 'Cidade De Nampula', 'Tsangano', 'Panda', 'Lalaua', 'Murrupula', 'Govuro', 'Zavala', 'Bilene', 'Mossurize', 'Maravia', 'Funhalouro', 'Macanga', 'Maxixe', 'Nampula', 'Moatize', 'Mabote', 'Meconta', 'Sussundenga', 'Chinde', 'Nicoadala', 'Mossuril', 'Mogincual', 'Ribaue', 'Chokwe', 'Manhiça', 'Massinga', 'Milange', 'Manica', 'Pebane', 'Caia', 'Vilankulo', 'Machanga', 'Barue', 'Boane', 'Changara', 'Cidade De Inhambane', 'Gile', 'Namaacha', 'Chigubo', 'Inhassunge', 'Macossa', 'Chicualacuala', 'Guro', 'Angonia', 'Guija', 'Muecate', 'Magude', 'Mandlakaze', 'Morrumbene', 'Morrumbala', 'Namacurra', 'Mopeia', 'Erati', 'Chifunde', 'Nacaroa', 'Angoche', 'Gondola', 'Homoine', 'Mecuburi', 'Mutarara', 'Mogovolas', 'Monapo', 'Inharrime', 'Namarroi', 'Nhamatanda', 'Machaze', 'Marromeu', 'Chibabava', 'Massangena', 'Cahora Bassa', 'Cidade De Tete', 'Maganja Da Costa', 'Nacala', 'Cidade Da Beira', 'Magoe', 'Moma', 'Gurue', 'Inhassoro', 'Cheringoma', 'Cidade De Chimoio', 'Lugela', 'Muanza', 'Mabalane', 'Marracuene', 'Dondo', 'Zumbu', 'Chibuto', 'Buzi', 'Matutuine', 'Moamba', 'Mocuba', 'Chemba', 'Maringue');

COMMIT;
