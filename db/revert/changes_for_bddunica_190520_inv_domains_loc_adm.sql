-- Revert utentes:changes_for_bddunica_190520 from pg

BEGIN;

SET session_replication_role = 'replica';
ALTER TABLE inventario.barragens DISABLE TRIGGER ALL;
ALTER TABLE inventario.estacoes DISABLE TRIGGER ALL;
ALTER TABLE inventario.exploracoes DISABLE TRIGGER ALL;
ALTER TABLE inventario.fontes DISABLE TRIGGER ALL;

DELETE FROM inventario_dominios.provincia;
COPY inventario_dominios.provincia (category, key, value, ordering, parent, tooltip, app) FROM stdin;
provincia	Cabo Delgado	\N	\N	\N	\N	{Norte}
provincia	Niassa	\N	\N	\N	\N	{Norte}
provincia	Gaza	\N	\N	\N	\N	{Sul}
provincia	Inhambane	\N	\N	\N	\N	{Sul}
provincia	Manica	\N	\N	\N	\N	{Sul}
provincia	Maputo	\N	\N	\N	\N	{Sul}
provincia	Sofala	\N	\N	\N	\N	{Sul}
\.

DELETE FROM inventario_dominios.distrito;
COPY inventario_dominios.distrito (category, key, value, ordering, parent, tooltip, app) FROM stdin;
distrito	Ancuabe	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Balama	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Chiure	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Cidade de Pemba	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Ibo	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Macomia	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Mecufi	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Meluco	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Mocimboa da Praia	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Montepuez	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Mueda	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Muidumbe	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Namuno	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Nangade	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Palma	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Pemba - Metuge	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Quissanga	\N	\N	Cabo Delgado	\N	{Norte}
distrito	Cidade de Lichinga	\N	\N	Niassa	\N	{Norte}
distrito	Cuamba	\N	\N	Niassa	\N	{Norte}
distrito	Lago	\N	\N	Niassa	\N	{Norte}
distrito	Lichinga	\N	\N	Niassa	\N	{Norte}
distrito	Majune	\N	\N	Niassa	\N	{Norte}
distrito	Mandimba	\N	\N	Niassa	\N	{Norte}
distrito	Marrupa	\N	\N	Niassa	\N	{Norte}
distrito	Maua	\N	\N	Niassa	\N	{Norte}
distrito	Mavago	\N	\N	Niassa	\N	{Norte}
distrito	Mecanhelas	\N	\N	Niassa	\N	{Norte}
distrito	Mecula	\N	\N	Niassa	\N	{Norte}
distrito	Metarica	\N	\N	Niassa	\N	{Norte}
distrito	Muembe	\N	\N	Niassa	\N	{Norte}
distrito	Ngauma	\N	\N	Niassa	\N	{Norte}
distrito	Nipepe	\N	\N	Niassa	\N	{Norte}
distrito	Sanga	\N	\N	Niassa	\N	{Norte}
distrito	Bilene	\N	\N	Gaza	\N	{Sul}
distrito	Chibuto	\N	\N	Gaza	\N	{Sul}
distrito	Chicualacuala	\N	\N	Gaza	\N	{Sul}
distrito	Chigubo	\N	\N	Gaza	\N	{Sul}
distrito	Chokwe	\N	\N	Gaza	\N	{Sul}
distrito	Cidade de Xai Xai	\N	\N	Gaza	\N	{Sul}
distrito	Guija	\N	\N	Gaza	\N	{Sul}
distrito	Mabalane	\N	\N	Gaza	\N	{Sul}
distrito	Massangena	\N	\N	Gaza	\N	{Sul}
distrito	Massingir	\N	\N	Gaza	\N	{Sul}
distrito	Xai Xai	\N	\N	Gaza	\N	{Sul}
distrito	Cidade de Inhambane	\N	\N	Inhambane	\N	{Sul}
distrito	Funhalouro	\N	\N	Inhambane	\N	{Sul}
distrito	Govuro	\N	\N	Inhambane	\N	{Sul}
distrito	Homoine	\N	\N	Inhambane	\N	{Sul}
distrito	Inharrime	\N	\N	Inhambane	\N	{Sul}
distrito	Inhassoro	\N	\N	Inhambane	\N	{Sul}
distrito	Jangamo	\N	\N	Inhambane	\N	{Sul}
distrito	Mabote	\N	\N	Inhambane	\N	{Sul}
distrito	Massinga	\N	\N	Inhambane	\N	{Sul}
distrito	Cidade de Maxixe	\N	\N	Inhambane	\N	{Sul}
distrito	Morrumbene	\N	\N	Inhambane	\N	{Sul}
distrito	Panda	\N	\N	Inhambane	\N	{Sul}
distrito	Vilankulo	\N	\N	Inhambane	\N	{Sul}
distrito	Zavala	\N	\N	Inhambane	\N	{Sul}
distrito	Mandlakaze	\N	\N	Inhambane	\N	{Sul}
distrito	Machaze	\N	\N	Manica	\N	{Sul}
distrito	Boane	\N	\N	Maputo	\N	{Sul}
distrito	Cidade da Matola	\N	\N	Maputo	\N	{Sul}
distrito	Cidade de Maputo	\N	\N	Maputo	\N	{Sul}
distrito	Magude	\N	\N	Maputo	\N	{Sul}
distrito	Manhiça	\N	\N	Maputo	\N	{Sul}
distrito	Marracuene	\N	\N	Maputo	\N	{Sul}
distrito	Matutuine	\N	\N	Maputo	\N	{Sul}
distrito	Moamba	\N	\N	Maputo	\N	{Sul}
distrito	Namaacha	\N	\N	Maputo	\N	{Sul}
distrito	Machanga	\N	\N	Sofala	\N	{Sul}
\.


DELETE FROM inventario_dominios.posto;
COPY inventario_dominios.posto (category, key, value, ordering, parent, tooltip, app) FROM stdin;
posto	Ancuabe	\N	\N	Ancuabe	\N	{Norte}
posto	Mesa	\N	\N	Ancuabe	\N	{Norte}
posto	Metoro	\N	\N	Ancuabe	\N	{Norte}
posto	Balama	\N	\N	Balama	\N	{Norte}
posto	Impiri	\N	\N	Balama	\N	{Norte}
posto	Kuekue	\N	\N	Balama	\N	{Norte}
posto	Mavala	\N	\N	Balama	\N	{Norte}
posto	Chiure	\N	\N	Chiure	\N	{Norte}
posto	Chiure Velho	\N	\N	Chiure	\N	{Norte}
posto	Katapua	\N	\N	Chiure	\N	{Norte}
posto	Mazeze	\N	\N	Chiure	\N	{Norte}
posto	Namogelia	\N	\N	Chiure	\N	{Norte}
posto	Ocua	\N	\N	Chiure	\N	{Norte}
posto	Cidade de Lichinga	\N	\N	Cidade de Lichinga	\N	{Norte}
posto	Cidade de Pemba	\N	\N	Cidade de Pemba	\N	{Norte}
posto	Cuamba	\N	\N	Cuamba	\N	{Norte}
posto	Etarara	\N	\N	Cuamba	\N	{Norte}
posto	Lurio	\N	\N	Cuamba	\N	{Norte}
posto	Ibo	\N	\N	Ibo	\N	{Norte}
posto	Quirimba	\N	\N	Ibo	\N	{Norte}
posto	Cobue	\N	\N	Lago	\N	{Norte}
posto	Luhno	\N	\N	Lago	\N	{Norte}
posto	Maniamba	\N	\N	Lago	\N	{Norte}
posto	Metangula	\N	\N	Lago	\N	{Norte}
posto	Chimbonila	\N	\N	Lichinga	\N	{Norte}
posto	Lione	\N	\N	Lichinga	\N	{Norte}
posto	Meponda	\N	\N	Lichinga	\N	{Norte}
posto	Chai	\N	\N	Macomia	\N	{Norte}
posto	Macomia	\N	\N	Macomia	\N	{Norte}
posto	Mucojo	\N	\N	Macomia	\N	{Norte}
posto	Quiterajo	\N	\N	Macomia	\N	{Norte}
posto	Malanga	\N	\N	Majune	\N	{Norte}
posto	Muaquia	\N	\N	Majune	\N	{Norte}
posto	Nairrubi	\N	\N	Majune	\N	{Norte}
posto	Mandimba	\N	\N	Mandimba	\N	{Norte}
posto	Mitande	\N	\N	Mandimba	\N	{Norte}
posto	Marangira	\N	\N	Marrupa	\N	{Norte}
posto	Marrupa	\N	\N	Marrupa	\N	{Norte}
posto	Nungo	\N	\N	Marrupa	\N	{Norte}
posto	Maiaca	\N	\N	Maua	\N	{Norte}
posto	Maua	\N	\N	Maua	\N	{Norte}
posto	M'Sawize	\N	\N	Mavago	\N	{Norte}
posto	Mavago	\N	\N	Mavago	\N	{Norte}
posto	Chiuta	\N	\N	Mecanhelas	\N	{Norte}
posto	Insaca	\N	\N	Mecanhelas	\N	{Norte}
posto	Mecufi	\N	\N	Mecufi	\N	{Norte}
posto	Murrebue	\N	\N	Mecufi	\N	{Norte}
posto	Matondovela	\N	\N	Mecula	\N	{Norte}
posto	Mecula	\N	\N	Mecula	\N	{Norte}
posto	Meluco	\N	\N	Meluco	\N	{Norte}
posto	Muaguide	\N	\N	Meluco	\N	{Norte}
posto	Metarica	\N	\N	Metarica	\N	{Norte}
posto	Nacumua	\N	\N	Metarica	\N	{Norte}
posto	Diaca	\N	\N	Mocimboa da Praia	\N	{Norte}
posto	Mbau	\N	\N	Mocimboa da Praia	\N	{Norte}
posto	Mocimboa da Praia	\N	\N	Mocimboa da Praia	\N	{Norte}
posto	Mapupulo	\N	\N	Montepuez	\N	{Norte}
posto	Mirate	\N	\N	Montepuez	\N	{Norte}
posto	Montepuez	\N	\N	Montepuez	\N	{Norte}
posto	Nairoto	\N	\N	Montepuez	\N	{Norte}
posto	Namanhumbir	\N	\N	Montepuez	\N	{Norte}
posto	Chapa	\N	\N	Mueda	\N	{Norte}
posto	Imbuo	\N	\N	Mueda	\N	{Norte}
posto	Mueda	\N	\N	Mueda	\N	{Norte}
posto	N'Gapa	\N	\N	Mueda	\N	{Norte}
posto	Negomano	\N	\N	Mueda	\N	{Norte}
posto	Chiconono	\N	\N	Muembe	\N	{Norte}
posto	Muembe	\N	\N	Muembe	\N	{Norte}
posto	Chitunda	\N	\N	Muidumbe	\N	{Norte}
posto	Miteda	\N	\N	Muidumbe	\N	{Norte}
posto	Muidumbe	\N	\N	Muidumbe	\N	{Norte}
posto	Hucula	\N	\N	Namuno	\N	{Norte}
posto	Machoca	\N	\N	Namuno	\N	{Norte}
posto	Meloco	\N	\N	Namuno	\N	{Norte}
posto	N'Cumpe	\N	\N	Namuno	\N	{Norte}
posto	Namuno	\N	\N	Namuno	\N	{Norte}
posto	Papai	\N	\N	Namuno	\N	{Norte}
posto	M'Tamba	\N	\N	Nangade	\N	{Norte}
posto	Nangade	\N	\N	Nangade	\N	{Norte}
posto	Itepela	\N	\N	Ngauma	\N	{Norte}
posto	Massangulo	\N	\N	Ngauma	\N	{Norte}
posto	Muipite	\N	\N	Nipepe	\N	{Norte}
posto	Nipepe	\N	\N	Nipepe	\N	{Norte}
posto	Olumbi	\N	\N	Palma	\N	{Norte}
posto	Palma	\N	\N	Palma	\N	{Norte}
posto	Pundanhar	\N	\N	Palma	\N	{Norte}
posto	Quionga	\N	\N	Palma	\N	{Norte}
posto	Metuge	\N	\N	Pemba - Metuge	\N	{Norte}
posto	Mieze	\N	\N	Pemba - Metuge	\N	{Norte}
posto	Bilibiza	\N	\N	Quissanga	\N	{Norte}
posto	Mahate	\N	\N	Quissanga	\N	{Norte}
posto	Quissanga	\N	\N	Quissanga	\N	{Norte}
posto	Lussimbesse	\N	\N	Sanga	\N	{Norte}
posto	Macaloge	\N	\N	Sanga	\N	{Norte}
posto	Matchedje	\N	\N	Sanga	\N	{Norte}
posto	Unango	\N	\N	Sanga	\N	{Norte}
posto	Alto Changane	\N	\N	Chibuto	\N	{Sul}
posto	Bela Vista	\N	\N	Matutuine	\N	{Sul}
posto	Boane	\N	\N	Boane	\N	{Sul}
posto	Calanga	\N	\N	Manhiça	\N	{Sul}
posto	Caniçado	\N	\N	Guija	\N	{Sul}
posto	Catuane	\N	\N	Matutuine	\N	{Sul}
posto	Chaimite	\N	\N	Chibuto	\N	{Sul}
posto	Changalane	\N	\N	Namaacha	\N	{Sul}
posto	Changanine	\N	\N	Chibuto	\N	{Sul}
posto	Chibonzane	\N	\N	Mandlakaze	\N	{Sul}
posto	Chicomo	\N	\N	Massinga	\N	{Sul}
posto	Chicumbane	\N	\N	Xai Xai	\N	{Sul}
posto	Chidenguele	\N	\N	Mandlakaze	\N	{Sul}
posto	Chigubo	\N	\N	Chigubo	\N	{Sul}
posto	Chissano	\N	\N	Bilene	\N	{Sul}
posto	Chivongoene	\N	\N	Guija	\N	{Sul}
posto	Chongoene	\N	\N	Xai Xai	\N	{Sul}
posto	Cidade da Matola	\N	\N	Cidade da Matola	\N	{Sul}
posto	Cidade de Chibuto	\N	\N	Chibuto	\N	{Sul}
posto	Cidade de Chokwe	\N	\N	Chokwe	\N	{Sul}
posto	Cidade de Inhambane	\N	\N	Cidade de Inhambane	\N	{Sul}
posto	Cidade de Maputo	\N	\N	Cidade de Maputo	\N	{Sul}
posto	Cidade de Maxixe	\N	\N	Cidade de Maxixe	\N	{Sul}
posto	Cidade de Xai Xai	\N	\N	Cidade de Xai Xai	\N	{Sul}
posto	Combomune	\N	\N	Mabalane	\N	{Sul}
posto	Cumbana	\N	\N	Jangamo	\N	{Sul}
posto	Dindiza	\N	\N	Chigubo	\N	{Sul}
posto	Funhalouro	\N	\N	Funhalouro	\N	{Sul}
posto	Godide	\N	\N	Chibuto	\N	{Sul}
posto	Homoine	\N	\N	Homoine	\N	{Sul}
posto	Ilha Josina Machel	\N	\N	Manhiça	\N	{Sul}
posto	Inharrime	\N	\N	Inharrime	\N	{Sul}
posto	Inhassoro	\N	\N	Inhassoro	\N	{Sul}
posto	Jangamo	\N	\N	Jangamo	\N	{Sul}
posto	Lionde	\N	\N	Chokwe	\N	{Sul}
posto	Mabalane	\N	\N	Mabalane	\N	{Sul}
posto	Mabote	\N	\N	Mabote	\N	{Sul}
posto	Macarretane	\N	\N	Chokwe	\N	{Sul}
posto	Machanga	\N	\N	Machanga	\N	{Sul}
posto	Machubo	\N	\N	Marracuene	\N	{Sul}
posto	Macia	\N	\N	Bilene	\N	{Sul}
posto	Macuacua	\N	\N	Mandlakaze	\N	{Sul}
posto	Magude	\N	\N	Magude	\N	{Sul}
posto	Mahele	\N	\N	Magude	\N	{Sul}
posto	Makluane	\N	\N	Bilene	\N	{Sul}
posto	Malehice	\N	\N	Chibuto	\N	{Sul}
posto	Maluana	\N	\N	Manhiça	\N	{Sul}
posto	Mandlakaze	\N	\N	Mandlakaze	\N	{Sul}
posto	Manhiça	\N	\N	Manhiça	\N	{Sul}
posto	Mapai	\N	\N	Chicualacuala	\N	{Sul}
posto	Mapinhane	\N	\N	Vilankulo	\N	{Sul}
posto	Mapulanguene	\N	\N	Magude	\N	{Sul}
posto	Marracuene	\N	\N	Marracuene	\N	{Sul}
posto	Massangena	\N	\N	Massangena	\N	{Sul}
posto	Massinga	\N	\N	Massinga	\N	{Sul}
posto	Massingir	\N	\N	Massingir	\N	{Sul}
posto	Matola Rio	\N	\N	Boane	\N	{Sul}
posto	Mavodze	\N	\N	Massingir	\N	{Sul}
posto	Mavue	\N	\N	Massangena	\N	{Sul}
posto	Mawayela	\N	\N	Panda	\N	{Sul}
posto	Mazivila	\N	\N	Bilene	\N	{Sul}
posto	Mazucane	\N	\N	Mandlakaze	\N	{Sul}
posto	Messano	\N	\N	Bilene	\N	{Sul}
posto	Moamba	\N	\N	Moamba	\N	{Sul}
posto	Mocumbi	\N	\N	Inharrime	\N	{Sul}
posto	Morrumbene	\N	\N	Morrumbene	\N	{Sul}
posto	Motaze	\N	\N	Magude	\N	{Sul}
posto	Mubangoene	\N	\N	Guija	\N	{Sul}
posto	Mucoduene	\N	\N	Morrumbene	\N	{Sul}
posto	Mugazine (catembe)	\N	\N	Matutuine	\N	{Sul}
posto	Nalazi	\N	\N	Guija	\N	{Sul}
posto	Namaacha	\N	\N	Namaacha	\N	{Sul}
posto	Nguzene	\N	\N	Mandlakaze	\N	{Sul}
posto	Nova Mambone	\N	\N	Govuro	\N	{Sul}
posto	Ntlavene	\N	\N	Mabalane	\N	{Sul}
posto	Pafuri	\N	\N	Chicualacuala	\N	{Sul}
posto	Palmeira (3 de Fevereiro)	\N	\N	Manhiça	\N	{Sul}
posto	Panda	\N	\N	Panda	\N	{Sul}
posto	Panjane	\N	\N	Magude	\N	{Sul}
posto	Pembe	\N	\N	Homoine	\N	{Sul}
posto	Pessene	\N	\N	Moamba	\N	{Sul}
posto	Praia de Bilene	\N	\N	Bilene	\N	{Sul}
posto	Quissico	\N	\N	Zavala	\N	{Sul}
posto	Ressano Garcia	\N	\N	Moamba	\N	{Sul}
posto	Sabie	\N	\N	Moamba	\N	{Sul}
posto	Save	\N	\N	Machaze	\N	{Sul}
posto	Tome	\N	\N	Funhalouro	\N	{Sul}
posto	Urrene	\N	\N	Panda	\N	{Sul}
posto	Vila Eduardo Mondlane	\N	\N	Chicualacuala	\N	{Sul}
posto	Vilankulo	\N	\N	Vilankulo	\N	{Sul}
posto	Xhalala	\N	\N	Mandlakaze	\N	{Sul}
posto	Xilembene	\N	\N	Chokwe	\N	{Sul}
posto	Xinavane	\N	\N	Manhiça	\N	{Sul}
posto	Zandamela	\N	\N	Zavala	\N	{Sul}
posto	Zimane	\N	\N	Mabote	\N	{Sul}
posto	Zinave	\N	\N	Mabote	\N	{Sul}
posto	Zitundo	\N	\N	Matutuine	\N	{Sul}
posto	Zongoene	\N	\N	Xai Xai	\N	{Sul}
posto	Zulo	\N	\N	Massingir	\N	{Sul}
\.


DELETE FROM inventario_dominios.provincia WHERE (SELECT key FROM domains.ara LIMIT 1) != ANY(app);
DELETE FROM inventario_dominios.distrito WHERE (SELECT key FROM domains.ara LIMIT 1) != ANY(app);
DELETE FROM inventario_dominios.posto WHERE (SELECT key FROM domains.ara LIMIT 1) != ANY(app);

UPDATE inventario.barragens SET (distrito, posto_adm) = ('Cidade de Lichinga', 'Cidade de Lichinga') WHERE (distrito, posto_adm) = ('Cidade De Lichinga', 'Cidade De Lichinga');
UPDATE inventario.estacoes SET (distrito, posto_adm) = ('Cidade de Lichinga', 'Cidade de Lichinga') WHERE (distrito, posto_adm) = ('Cidade De Lichinga', 'Cidade De Lichinga');
UPDATE inventario.exploracoes SET (loc_distri, loc_post) = ('Cidade de Lichinga', 'Cidade de Lichinga') WHERE (loc_distri, loc_post) = ('Cidade De Lichinga', 'Cidade De Lichinga');
UPDATE inventario.fontes SET (distrito, posto_adm) = ('Cidade de Lichinga', 'Cidade de Lichinga') WHERE (distrito, posto_adm) = ('Cidade De Lichinga', 'Cidade De Lichinga');

UPDATE inventario.barragens SET (distrito, posto_adm) = ('Cidade de Pemba', 'Cidade de Pemba') WHERE (distrito, posto_adm) = ('Cidade De Pemba', 'Cidade De Pemba');
UPDATE inventario.estacoes SET (distrito, posto_adm) = ('Cidade de Pemba', 'Cidade de Pemba') WHERE (distrito, posto_adm) = ('Cidade De Pemba', 'Cidade De Pemba');
UPDATE inventario.exploracoes SET (loc_distri, loc_post) = ('Cidade de Pemba', 'Cidade de Pemba') WHERE (loc_distri, loc_post) = ('Cidade de Pemba', 'Cidade De Pemba');
UPDATE inventario.fontes SET (distrito, posto_adm) = ('Cidade de Pemba', 'Cidade de Pemba') WHERE (distrito, posto_adm) = ('Cidade De Pemba', 'Cidade De Pemba');

UPDATE inventario.barragens SET (distrito, posto_adm) = ('Mocimboa da Praia', 'Mocimboa da Praia') WHERE (distrito, posto_adm) = ('Mocimboa Da Praia', 'Mocimboa Da Praia');
UPDATE inventario.estacoes SET (distrito, posto_adm) = ('Mocimboa da Praia', 'Mocimboa da Praia') WHERE (distrito, posto_adm) = ('Mocimboa Da Praia', 'Mocimboa Da Praia');
UPDATE inventario.exploracoes SET (loc_distri, loc_post) = ('Mocimboa da Praia', 'Mocimboa da Praia') WHERE (loc_distri, loc_post) = ('Mocimboa Da Praia', 'Mocimboa Da Praia');
UPDATE inventario.fontes SET (distrito, posto_adm) = ('Mocimboa da Praia', 'Mocimboa da Praia') WHERE (distrito, posto_adm) = ('Mocimboa Da Praia', 'Mocimboa Da Praia');

UPDATE inventario.barragens SET distrito = 'Mocimboa da Praia' WHERE distrito = 'Mocimboa Da Praia';
UPDATE inventario.estacoes SET distrito = 'Mocimboa da Praia' WHERE distrito = 'Mocimboa Da Praia';
UPDATE inventario.exploracoes SET loc_distri = 'Mocimboa da Praia' WHERE loc_distri = 'Mocimboa Da Praia';
UPDATE inventario.fontes SET distrito = 'Mocimboa da Praia' WHERE distrito = 'Mocimboa Da Praia';

UPDATE inventario.barragens SET distrito = 'Pemba - Metuge' WHERE distrito = 'Pemba-Metuge';
UPDATE inventario.estacoes SET distrito = 'Pemba - Metuge' WHERE distrito = 'Pemba-Metuge';
UPDATE inventario.exploracoes SET loc_distri = 'Pemba - Metuge' WHERE loc_distri = 'Pemba-Metuge';
UPDATE inventario.fontes SET distrito = 'Pemba - Metuge' WHERE distrito = 'Pemba-Metuge';

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Mocimboa da Praia') WHERE (provincia, distrito) = ('Cabo Delgado', 'Mocimboa Da Praia');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Mocimboa da Praia') WHERE (provincia, distrito) = ('Cabo Delgado', 'Mocimboa Da Praia');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa da Praia') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Mocimboa Da Praia');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Mocimboa da Praia') WHERE (provincia, distrito) = ('Cabo Delgado', 'Mocimboa Da Praia');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (provincia, distrito) = ('Cabo Delgado', 'Pemba-Metuge');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Cidade de Pemba') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade De Pemba');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade de Pemba') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade De Pemba');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Pemba') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Pemba');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade de Pemba') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade De Pemba');

UPDATE inventario.barragens SET (provincia, distrito) = ('Cabo Delgado', 'Cidade de Lichinga') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade De Lichinga');
UPDATE inventario.estacoes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade de Lichinga') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade De Lichinga');
UPDATE inventario.exploracoes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade de Lichinga') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Cidade De Lichinga');
UPDATE inventario.fontes SET (provincia, distrito) = ('Cabo Delgado', 'Cidade de Lichinga') WHERE (provincia, distrito) = ('Cabo Delgado', 'Cidade De Lichinga');


ALTER TABLE inventario.barragens ENABLE TRIGGER ALL;
ALTER TABLE inventario.estacoes ENABLE TRIGGER ALL;
ALTER TABLE inventario.exploracoes ENABLE TRIGGER ALL;
ALTER TABLE inventario.fontes ENABLE TRIGGER ALL;
SET session_replication_role = 'origin';

-- Hacemos esto para forzar que se chequean las constraints
UPDATE inventario.barragens SET gid = gid;
UPDATE inventario.estacoes SET gid = gid;
UPDATE inventario.exploracoes SET gid = gid;
UPDATE inventario.fontes SET gid = gid;


COMMIT;
