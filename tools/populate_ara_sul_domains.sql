-- Deploy sixhiara:create_and_populate_domains_location to pg

BEGIN;


DELETE FROM inventario_dominios.provincia;
INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Gaza', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Inhambane', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Manica', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Maputo', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Sofala', NULL, NULL, NULL, NULL);







DELETE FROM inventario_dominios.distrito;
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Bilene', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Chibuto', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Chicualacuala', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Chigubo', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Chokwe', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Xai Xai', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Guija', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mabalane', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Massangena', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Massingir', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Xai Xai', NULL, NULL, 'Gaza', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Inhambane', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Funhalouro', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Govuro', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Homoine', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Inharrime', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Inhassoro', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Jangamo', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mabote', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Massinga', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Maxixe', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Morrumbene', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Panda', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Vilankulo', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Zavala', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mandlakaze', NULL, NULL, 'Inhambane', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Machaze', NULL, NULL, 'Manica', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Boane', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade da Matola', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Maputo', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Magude', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Manhiça', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Marracuene', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Matutuine', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Moamba', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Namaacha', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Machanga', NULL, NULL, 'Sofala', NULL);









DELETE FROM inventario_dominios.posto;
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Alto Changane', NULL, NULL, 'Chibuto', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Bela Vista', NULL, NULL, 'Matutuine', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Boane', NULL, NULL, 'Boane', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Calanga', NULL, NULL, 'Manhiça', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Caniçado', NULL, NULL, 'Guija', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Catuane', NULL, NULL, 'Matutuine', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chaimite', NULL, NULL, 'Chibuto', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Changalane', NULL, NULL, 'Namaacha', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Changanine', NULL, NULL, 'Chibuto', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chibonzane', NULL, NULL, 'Mandlakaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chicomo', NULL, NULL, 'Massinga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chicumbane', NULL, NULL, 'Xai Xai', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chidenguele', NULL, NULL, 'Mandlakaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chigubo', NULL, NULL, 'Chigubo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chissano', NULL, NULL, 'Bilene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chivongoene', NULL, NULL, 'Guija', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chongoene', NULL, NULL, 'Xai Xai', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade da Matola', NULL, NULL, 'Cidade da Matola', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Chibuto', NULL, NULL, 'Chibuto', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Chokwe', NULL, NULL, 'Chokwe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Inhambane', NULL, NULL, 'Cidade de Inhambane', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Maputo', NULL, NULL, 'Cidade de Maputo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Maxixe', NULL, NULL, 'Cidade de Maxixe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Xai Xai', NULL, NULL, 'Cidade de Xai Xai', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Combomune', NULL, NULL, 'Mabalane', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cumbana', NULL, NULL, 'Jangamo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Dindiza', NULL, NULL, 'Chigubo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Funhalouro', NULL, NULL, 'Funhalouro', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Godide', NULL, NULL, 'Chibuto', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Homoine', NULL, NULL, 'Homoine', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ilha Josina Machel', NULL, NULL, 'Manhiça', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Inharrime', NULL, NULL, 'Inharrime', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Inhassoro', NULL, NULL, 'Inhassoro', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Jangamo', NULL, NULL, 'Jangamo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Lionde', NULL, NULL, 'Chokwe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mabalane', NULL, NULL, 'Mabalane', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mabote', NULL, NULL, 'Mabote', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Macarretane', NULL, NULL, 'Chokwe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Machanga', NULL, NULL, 'Machanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Machubo', NULL, NULL, 'Marracuene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Macia', NULL, NULL, 'Bilene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Macuacua', NULL, NULL, 'Mandlakaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Magude', NULL, NULL, 'Magude', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mahele', NULL, NULL, 'Magude', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Makluane', NULL, NULL, 'Bilene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Malehice', NULL, NULL, 'Chibuto', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Maluana', NULL, NULL, 'Manhiça', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mandlakaze', NULL, NULL, 'Mandlakaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Manhiça', NULL, NULL, 'Manhiça', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mapai', NULL, NULL, 'Chicualacuala', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mapinhane', NULL, NULL, 'Vilankulo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mapulanguene', NULL, NULL, 'Magude', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Marracuene', NULL, NULL, 'Marracuene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Massangena', NULL, NULL, 'Massangena', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Massinga', NULL, NULL, 'Massinga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Massingir', NULL, NULL, 'Massingir', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Matola Rio', NULL, NULL, 'Boane', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mavodze', NULL, NULL, 'Massingir', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mavue', NULL, NULL, 'Massangena', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mawayela', NULL, NULL, 'Panda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mazivila', NULL, NULL, 'Bilene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mazucane', NULL, NULL, 'Mandlakaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Messano', NULL, NULL, 'Bilene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Moamba', NULL, NULL, 'Moamba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mocumbi', NULL, NULL, 'Inharrime', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Morrumbene', NULL, NULL, 'Morrumbene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Motaze', NULL, NULL, 'Magude', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mubangoene', NULL, NULL, 'Guija', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mucoduene', NULL, NULL, 'Morrumbene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mugazine (catembe)', NULL, NULL, 'Matutuine', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nalazi', NULL, NULL, 'Guija', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Namaacha', NULL, NULL, 'Namaacha', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nguzene', NULL, NULL, 'Mandlakaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nova Mambone', NULL, NULL, 'Govuro', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ntlavene', NULL, NULL, 'Mabalane', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Pafuri', NULL, NULL, 'Chicualacuala', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Palmeira (3 de Fevereiro)', NULL, NULL, 'Manhiça', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Panda', NULL, NULL, 'Panda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Panjane', NULL, NULL, 'Magude', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Pembe', NULL, NULL, 'Homoine', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Pessene', NULL, NULL, 'Moamba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Praia de Bilene', NULL, NULL, 'Bilene', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quissico', NULL, NULL, 'Zavala', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ressano Garcia', NULL, NULL, 'Moamba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Sabie', NULL, NULL, 'Moamba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Save', NULL, NULL, 'Machaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Tome', NULL, NULL, 'Funhalouro', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Urrene', NULL, NULL, 'Panda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Vila Eduardo Mondlane', NULL, NULL, 'Chicualacuala', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Vilankulo', NULL, NULL, 'Vilankulo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Xhalala', NULL, NULL, 'Mandlakaze', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Xilembene', NULL, NULL, 'Chokwe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Xinavane', NULL, NULL, 'Manhiça', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Zandamela', NULL, NULL, 'Zavala', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Zimane', NULL, NULL, 'Mabote', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Zinave', NULL, NULL, 'Mabote', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Zitundo', NULL, NULL, 'Matutuine', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Zongoene', NULL, NULL, 'Xai Xai', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Zulo', NULL, NULL, 'Massingir', NULL);













DELETE FROM inventario_dominios.bacia;
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Umbelúzi', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Incomati', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Limpopo', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Inhavumalala', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Govuro', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Maducha', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Chiendsele', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Das Pedras', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Fúti', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Inhanombe', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Inharrime', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Maputo', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Matola', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Mutamba', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Panga', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Save', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Tembe', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', ' -- ', NULL, NULL, NULL, NULL);





DELETE FROM inventario_dominios.subacia;
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Umbelúzi', NULL, NULL, 'Umbelúzi', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Incomati', NULL, NULL, 'Incomati', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Umbelúzi', NULL, NULL, 'Incomati', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Limpopo', NULL, NULL, 'Incomati', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Limpopo', NULL, NULL, 'Limpopo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Sangutane', NULL, NULL, 'Limpopo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Ponela', NULL, NULL, 'Limpopo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Umbape', NULL, NULL, 'Limpopo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Lumane', NULL, NULL, 'Limpopo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Singuezi', NULL, NULL, 'Limpopo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Govuro', NULL, NULL, 'Govuro', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Murri', NULL, NULL, 'Maducha', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Massinga', NULL, NULL, 'Chiendsele', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Malova', NULL, NULL, 'Chiendsele', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Das Pedras', NULL, NULL, 'Das Pedras', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Fúti', NULL, NULL, 'Fúti', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Furvela', NULL, NULL, 'Inhanombe', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Domo Domo', NULL, NULL, 'Inharrime', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Inhamiquelengue', NULL, NULL, 'Inharrime', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Inhatouco', NULL, NULL, 'Inharrime', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Lagoa Poelela', NULL, NULL, 'Inharrime', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Maputo', NULL, NULL, 'Maputo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Matola', NULL, NULL, 'Matola', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Guiguacua', NULL, NULL, 'Mutamba', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Madangela', NULL, NULL, 'Panga', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Tegue ou Tague', NULL, NULL, 'Panga', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Save', NULL, NULL, 'Save', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Inhanombe', NULL, NULL, 'Tembe', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Tembe', NULL, NULL, 'Tembe', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Lagoa Nhajosse', NULL, NULL, ' -- ', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Inhanombe', NULL, NULL, ' -- ', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Guiua', NULL, NULL, ' -- ', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Lago S. Martinho do Bilene', NULL, NULL, ' -- ', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Infulene', NULL, NULL, ' -- ', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Drenagem', NULL, NULL, ' -- ', NULL);


COMMIT;
