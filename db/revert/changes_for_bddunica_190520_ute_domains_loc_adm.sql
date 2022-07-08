-- Revert utentes:changes_for_bddunica_190520_ute_domains_loc_adm from pg

BEGIN;

SET session_replication_role = 'replica';
ALTER TABLE utentes.exploracaos DISABLE TRIGGER ALL;
ALTER TABLE utentes.utentes DISABLE TRIGGER ALL;

DELETE FROM domains.provincia;
COPY domains.provincia (category, key, value, ordering, parent, tooltip, app) FROM stdin;
provincia	Gaza	\N	\N	\N	\N	{Sul}
provincia	Inhambane	\N	\N	\N	\N	{Sul}
provincia	Maputo	\N	\N	\N	\N	{Sul}
provincia	Nampula	\N	\N	\N	\N	\N
provincia	\N	\N	0	\N	\N	\N
provincia	Cabo Delgado	\N	\N	\N	\N	{Norte,DPMAIP}
provincia	Manica	\N	\N	\N	\N	{Sul,Zambeze}
provincia	Sofala	\N	\N	\N	\N	{Sul,Zambeze}
provincia	Tete	\N	\N	\N	\N	{Zambeze}
provincia	Zambezia	\N	\N	\N	\N	{Zambeze}
provincia	Niassa	\N	\N	\N	\N	{Norte,Zambeze}
\.



DELETE FROM domains.distrito;
COPY domains.distrito (category, key, value, ordering, parent, tooltip, app) FROM stdin;
distrito	Cidade De Chimoio	\N	\N	Manica	\N	\N
distrito	Gondola	\N	\N	Manica	\N	\N
distrito	Manica	\N	\N	Manica	\N	\N
distrito	Mossurize	\N	\N	Manica	\N	\N
distrito	Sussundenga	\N	\N	Manica	\N	\N
distrito	\N	\N	0	Nampula	\N	\N
distrito	Angoche	\N	\N	Nampula	\N	\N
distrito	Cidade De Nampula	\N	\N	Nampula	\N	\N
distrito	Erati	\N	\N	Nampula	\N	\N
distrito	Ilha De Moçambique	\N	\N	Nampula	\N	\N
distrito	Lalaua	\N	\N	Nampula	\N	\N
distrito	Malema	\N	\N	Nampula	\N	\N
distrito	Meconta	\N	\N	Nampula	\N	\N
distrito	Mecuburi	\N	\N	Nampula	\N	\N
distrito	Memba	\N	\N	Nampula	\N	\N
distrito	Mogincual	\N	\N	Nampula	\N	\N
distrito	Mogovolas	\N	\N	Nampula	\N	\N
distrito	Moma	\N	\N	Nampula	\N	\N
distrito	Monapo	\N	\N	Nampula	\N	\N
distrito	Mossuril	\N	\N	Nampula	\N	\N
distrito	Muecate	\N	\N	Nampula	\N	\N
distrito	Murrupula	\N	\N	Nampula	\N	\N
distrito	Nacala	\N	\N	Nampula	\N	\N
distrito	Nacala A Velha	\N	\N	Nampula	\N	\N
distrito	Nacaroa	\N	\N	Nampula	\N	\N
distrito	Nampula	\N	\N	Nampula	\N	\N
distrito	Ribaue	\N	\N	Nampula	\N	\N
distrito	Buzi	\N	\N	Sofala	\N	\N
distrito	Chibabava	\N	\N	Sofala	\N	\N
distrito	Cidade Da Beira	\N	\N	Sofala	\N	\N
distrito	Dondo	\N	\N	Sofala	\N	\N
distrito	Gorongosa	\N	\N	Sofala	\N	\N
distrito	Muanza	\N	\N	Sofala	\N	\N
distrito	Nhamatanda	\N	\N	Sofala	\N	\N
distrito	Alto Molocue	\N	\N	Zambezia	\N	\N
distrito	Gile	\N	\N	Zambezia	\N	\N
distrito	Gurue	\N	\N	Zambezia	\N	\N
distrito	Ile	\N	\N	Zambezia	\N	\N
distrito	\N	\N	0	Tete	\N	{Zambeze}
distrito	\N	\N	0	Zambezia	\N	{Zambeze}
distrito	Barue	\N	\N	Manica	\N	{Zambeze}
distrito	Guro	\N	\N	Manica	\N	{Zambeze}
distrito	Macossa	\N	\N	Manica	\N	{Zambeze}
distrito	Tambara	\N	\N	Manica	\N	{Zambeze}
distrito	Ilha Licom	\N	\N	Niassa	\N	{Zambeze}
distrito	Ilha Risunodo	\N	\N	Niassa	\N	{Zambeze}
distrito	Caia	\N	\N	Sofala	\N	{Zambeze}
distrito	Chemba	\N	\N	Sofala	\N	{Zambeze}
distrito	Cheringoma	\N	\N	Sofala	\N	{Zambeze}
distrito	Maringue	\N	\N	Sofala	\N	{Zambeze}
distrito	Marromeu	\N	\N	Sofala	\N	{Zambeze}
distrito	Angonia	\N	\N	Tete	\N	{Zambeze}
distrito	Cahora Bassa	\N	\N	Tete	\N	{Zambeze}
distrito	Changara	\N	\N	Tete	\N	{Zambeze}
distrito	Chifunde	\N	\N	Tete	\N	{Zambeze}
distrito	Chiuta	\N	\N	Tete	\N	{Zambeze}
distrito	Cidade De Tete	\N	\N	Tete	\N	{Zambeze}
distrito	Macanga	\N	\N	Tete	\N	{Zambeze}
distrito	Magoe	\N	\N	Tete	\N	{Zambeze}
distrito	Maravia	\N	\N	Tete	\N	{Zambeze}
distrito	Moatize	\N	\N	Tete	\N	{Zambeze}
distrito	Mutarara	\N	\N	Tete	\N	{Zambeze}
distrito	Tsangano	\N	\N	Tete	\N	{Zambeze}
distrito	Zumbu	\N	\N	Tete	\N	{Zambeze}
distrito	Chinde	\N	\N	Zambezia	\N	{Zambeze}
distrito	Cidade De Quelimane	\N	\N	Zambezia	\N	{Zambeze}
distrito	Lugela	\N	\N	Zambezia	\N	\N
distrito	Maganja Da Costa	\N	\N	Zambezia	\N	\N
distrito	Namarroi	\N	\N	Zambezia	\N	\N
distrito	Pebane	\N	\N	Zambezia	\N	\N
distrito	Inhassunge	\N	\N	Zambezia	\N	{Zambeze}
distrito	Milange	\N	\N	Zambezia	\N	{Zambeze}
distrito	Mocuba	\N	\N	Zambezia	\N	{Zambeze}
distrito	Mopeia	\N	\N	Zambezia	\N	{Zambeze}
distrito	Morrumbala	\N	\N	Zambezia	\N	{Zambeze}
distrito	Namacurra	\N	\N	Zambezia	\N	{Zambeze}
distrito	Nicoadala	\N	\N	Zambezia	\N	{Zambeze}
distrito	Lago	\N	\N	Niassa	\N	{Norte,Zambeze}
distrito	Cidade de Lichinga	\N	\N	Niassa	\N	{Norte,Zambeze}
distrito	Cuamba	\N	\N	Niassa	\N	{Norte}
distrito	Majune	\N	\N	Niassa	\N	{Norte}
distrito	Mandimba	\N	\N	Niassa	\N	{Norte}
distrito	Marrupa	\N	\N	Niassa	\N	{Norte}
distrito	Maua	\N	\N	Niassa	\N	{Norte}
distrito	Mavago	\N	\N	Niassa	\N	{Norte}
distrito	Mecanhelas	\N	\N	Niassa	\N	{Norte}
distrito	Mecula	\N	\N	Niassa	\N	{Norte}
distrito	Metarica	\N	\N	Niassa	\N	{Norte}
distrito	Muembe	\N	\N	Niassa	\N	{Norte}
distrito	Nipepe	\N	\N	Niassa	\N	{Norte}
distrito	Bilene	\N	\N	Gaza	\N	{Sul}
distrito	Chibuto	\N	\N	Gaza	\N	{Sul}
distrito	Chicualacuala	\N	\N	Gaza	\N	{Sul}
distrito	Chigubo	\N	\N	Gaza	\N	{Sul}
distrito	Cidade De Xai-Xai	\N	\N	Gaza	\N	{Sul}
distrito	Mabalane	\N	\N	Gaza	\N	{Sul}
distrito	Massangena	\N	\N	Gaza	\N	{Sul}
distrito	Massingir	\N	\N	Gaza	\N	{Sul}
distrito	Xai-Xai	\N	\N	Gaza	\N	{Sul}
distrito	Cidade De Inhambane	\N	\N	Inhambane	\N	{Sul}
distrito	Funhalouro	\N	\N	Inhambane	\N	{Sul}
distrito	Govuro	\N	\N	Inhambane	\N	{Sul}
distrito	Homoine	\N	\N	Inhambane	\N	{Sul}
distrito	Inharrime	\N	\N	Inhambane	\N	{Sul}
distrito	Inhassoro	\N	\N	Inhambane	\N	{Sul}
distrito	Jangamo	\N	\N	Inhambane	\N	{Sul}
distrito	Mabote	\N	\N	Inhambane	\N	{Sul}
distrito	Mandlakaze	\N	\N	Inhambane	\N	{Sul}
distrito	Massinga	\N	\N	Inhambane	\N	{Sul}
distrito	Maxixe	\N	\N	Inhambane	\N	{Sul}
distrito	Morrumbene	\N	\N	Inhambane	\N	{Sul}
distrito	Panda	\N	\N	Inhambane	\N	{Sul}
distrito	Vilankulo	\N	\N	Inhambane	\N	{Sul}
distrito	Zavala	\N	\N	Inhambane	\N	{Sul}
distrito	Machaze	\N	\N	Manica	\N	{Sul}
distrito	Boane	\N	\N	Maputo	\N	{Sul}
distrito	Cidade Da Matola	\N	\N	Maputo	\N	{Sul}
distrito	Cidade De Maputo	\N	\N	Maputo	\N	{Sul}
distrito	Magude	\N	\N	Maputo	\N	{Sul}
distrito	Manhiça	\N	\N	Maputo	\N	{Sul}
distrito	Marracuene	\N	\N	Maputo	\N	{Sul}
distrito	Matutuine	\N	\N	Maputo	\N	{Sul}
distrito	Moamba	\N	\N	Maputo	\N	{Sul}
distrito	Namaacha	\N	\N	Maputo	\N	{Sul}
distrito	Machanga	\N	\N	Sofala	\N	{Sul}
distrito	\N	\N	0	Gaza	\N	{Sul}
distrito	\N	\N	0	Inhambane	\N	{Sul}
distrito	\N	\N	0	Maputo	\N	{Sul}
distrito	Ancuabe	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Balama	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Chiure	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Cidade de Pemba	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Ibo	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Macomia	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Mecufi	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Meluco	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Mocimboa da Praia	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Montepuez	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Mueda	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Muidumbe	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Namuno	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Nangade	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Palma	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Quissanga	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	\N	\N	0	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Pemba - Metuge	\N	\N	Cabo Delgado	\N	{Norte,DPMAIP}
distrito	Guijá	\N	\N	Gaza	\N	{Sul}
distrito	Chokwé	\N	\N	Gaza	\N	{Sul}
distrito	\N	\N	0	Niassa	\N	{Norte,Zambeze}
distrito	\N	\N	0	Manica	\N	{Sul,Zambeze}
distrito	\N	\N	0	Sofala	\N	{Sul,Zambeze}
distrito	Ngauma	\N	\N	Niassa	\N	{Norte,Zambeze}
distrito	Sanga	\N	\N	Niassa	\N	{Norte,Zambeze}
distrito	Lichinga	\N	\N	Niassa	\N	{Norte,Zambeze}
\.


DELETE FROM domains.posto;
COPY domains.posto (category, key, value, ordering, parent, tooltip, app) FROM stdin;
posto	\N	\N	0	Gorongosa	\N	\N
posto	\N	\N	0	Ilha De Moçambique	\N	\N
posto	\N	\N	0	Malema	\N	\N
posto	\N	\N	0	Chiuta	\N	\N
posto	\N	\N	0	Tambara	\N	\N
posto	\N	\N	0	Nacala-A-Velha	\N	\N
posto	\N	\N	0	Alto Molocue	\N	\N
posto	\N	\N	0	Cidade De Quelimane	\N	\N
posto	\N	\N	0	Ile	\N	\N
posto	\N	\N	0	Memba	\N	\N
posto	\N	\N	0	Cidade De Nampula	\N	\N
posto	\N	\N	0	Tsangano	\N	\N
posto	\N	\N	0	Lalaua	\N	\N
posto	\N	\N	0	Murrupula	\N	\N
posto	\N	\N	0	Pemba - Metuge	\N	{DPMAIP}
posto	\N	\N	0	Mossurize	\N	\N
posto	\N	\N	0	Maravia	\N	\N
posto	\N	\N	0	Macanga	\N	\N
posto	\N	\N	0	Nampula	\N	\N
posto	\N	\N	0	Moatize	\N	\N
posto	\N	\N	0	Meconta	\N	\N
posto	\N	\N	0	Sussundenga	\N	\N
posto	\N	\N	0	Chinde	\N	\N
posto	\N	\N	0	Nicoadala	\N	\N
posto	\N	\N	0	Mossuril	\N	\N
posto	\N	\N	0	Mogincual	\N	\N
posto	\N	\N	0	Ribaue	\N	\N
posto	\N	\N	0	Milange	\N	\N
posto	\N	\N	0	Manica	\N	\N
posto	\N	\N	0	Pebane	\N	\N
posto	\N	\N	0	Caia	\N	\N
posto	\N	\N	0	Barue	\N	\N
posto	\N	\N	0	Changara	\N	\N
posto	\N	\N	0	Gile	\N	\N
posto	\N	\N	0	Inhassunge	\N	\N
posto	\N	\N	0	Macossa	\N	\N
posto	\N	\N	0	Guro	\N	\N
posto	\N	\N	0	Angonia	\N	\N
posto	\N	\N	0	Muecate	\N	\N
posto	\N	\N	0	Morrumbala	\N	\N
posto	\N	\N	0	Namacurra	\N	\N
posto	\N	\N	0	Mopeia	\N	\N
posto	\N	\N	0	Erati	\N	\N
posto	\N	\N	0	Chifunde	\N	\N
posto	\N	\N	0	Nacaroa	\N	\N
posto	\N	\N	0	Angoche	\N	\N
posto	\N	\N	0	Gondola	\N	\N
posto	\N	\N	0	Mecuburi	\N	\N
posto	\N	\N	0	Mutarara	\N	\N
posto	\N	\N	0	Mogovolas	\N	\N
posto	\N	\N	0	Monapo	\N	\N
posto	\N	\N	0	Namarroi	\N	\N
posto	\N	\N	0	Nhamatanda	\N	\N
posto	\N	\N	0	Marromeu	\N	\N
posto	\N	\N	0	Chibabava	\N	\N
posto	\N	\N	0	Cahora Bassa	\N	\N
posto	\N	\N	0	Cidade De Tete	\N	\N
posto	\N	\N	0	Maganja Da Costa	\N	\N
posto	\N	\N	0	Nacala	\N	\N
posto	\N	\N	0	Cidade Da Beira	\N	\N
posto	\N	\N	0	Magoe	\N	\N
posto	\N	\N	0	Moma	\N	\N
posto	\N	\N	0	Gurue	\N	\N
posto	\N	\N	0	Cheringoma	\N	\N
posto	\N	\N	0	Cidade De Chimoio	\N	\N
posto	Cidade De Nampula	\N	\N	Cidade De Nampula	\N	\N
posto	Dondo	\N	\N	Dondo	\N	\N
posto	Mafambisse	\N	\N	Dondo	\N	\N
posto	Alua	\N	\N	Erati	\N	\N
posto	Namapa	\N	\N	Erati	\N	\N
posto	Namiroa	\N	\N	Erati	\N	\N
posto	Alto Ligonha	\N	\N	Gile	\N	\N
posto	Gile	\N	\N	Gile	\N	\N
posto	Amatongas	\N	\N	Gondola	\N	\N
posto	Cafumpe	\N	\N	Gondola	\N	\N
posto	Gondola	\N	\N	Gondola	\N	\N
posto	Inchope	\N	\N	Gondola	\N	\N
posto	Macate	\N	\N	Gondola	\N	\N
posto	Matsinho	\N	\N	Gondola	\N	\N
posto	Zembe	\N	\N	Gondola	\N	\N
posto	Gorongosa	\N	\N	Gorongosa	\N	\N
posto	Nhamadze	\N	\N	Gorongosa	\N	\N
posto	Mandie	\N	\N	Guro	\N	\N
posto	Mungari	\N	\N	Guro	\N	\N
posto	Nhamassonge	\N	\N	Guro	\N	\N
posto	Gurue	\N	\N	Gurue	\N	\N
posto	Lioma	\N	\N	Gurue	\N	\N
posto	Mepuagiua	\N	\N	Gurue	\N	\N
posto	Ile	\N	\N	Ile	\N	\N
posto	Mulevala	\N	\N	Ile	\N	\N
posto	Socone	\N	\N	Ile	\N	\N
posto	Ilha De Moçambique	\N	\N	Ilha De Moçambique	\N	\N
posto	Lumbo	\N	\N	Ilha De Moçambique	\N	\N
posto	Gonhane	\N	\N	Inhassunge	\N	\N
posto	Lalaua	\N	\N	Lalaua	\N	\N
posto	Meti	\N	\N	Lalaua	\N	\N
posto	Lugela	\N	\N	Lugela	\N	\N
posto	Muabanama	\N	\N	Lugela	\N	\N
posto	Munhamade	\N	\N	Lugela	\N	\N
posto	Tacuane	\N	\N	Lugela	\N	\N
posto	Chidzolomondo	\N	\N	Macanga	\N	\N
posto	Furancungo	\N	\N	Macanga	\N	\N
posto	Nguawala	\N	\N	Macossa	\N	\N
posto	Nhamagua	\N	\N	Macossa	\N	\N
posto	Bajone	\N	\N	Maganja Da Costa	\N	\N
posto	Maganja	\N	\N	Maganja Da Costa	\N	\N
posto	Mocubela	\N	\N	Maganja Da Costa	\N	\N
posto	Nante	\N	\N	Maganja Da Costa	\N	\N
posto	Chinthopo	\N	\N	Magoe	\N	\N
posto	Mphende	\N	\N	Magoe	\N	\N
posto	Mukumbura	\N	\N	Magoe	\N	\N
posto	Chihulo	\N	\N	Malema	\N	\N
posto	Malema	\N	\N	Malema	\N	\N
posto	Mutuali	\N	\N	Malema	\N	\N
posto	Machipanda	\N	\N	Manica	\N	\N
posto	Manica	\N	\N	Manica	\N	\N
posto	Mavonde	\N	\N	Manica	\N	\N
posto	Manhiça	\N	\N	Manhiça	\N	\N
posto	Canicado	\N	\N	Guijá	\N	\N
posto	Guro	\N	\N	Guro	\N	{Zambeze}
posto	Macossa	\N	\N	Macossa	\N	{Zambeze}
posto	Cidade De Tete	\N	\N	Cidade De Tete	\N	{Zambeze}
posto	Cidade De Quelimane	\N	\N	Cidade De Quelimane	\N	{Zambeze}
posto	Inhassunge	\N	\N	Inhassunge	\N	{Zambeze}
posto	Zobue	\N	\N	Moatize	\N	\N
posto	Mugeba	\N	\N	Mocuba	\N	\N
posto	Namanjavira	\N	\N	Mocuba	\N	\N
posto	Liupo	\N	\N	Mogincual	\N	\N
posto	Namige	\N	\N	Mogincual	\N	\N
posto	Quinga	\N	\N	Mogincual	\N	\N
posto	Quixaxe	\N	\N	Mogincual	\N	\N
posto	Calipo	\N	\N	Mogovolas	\N	\N
posto	Iuluti	\N	\N	Mogovolas	\N	\N
posto	Muatua	\N	\N	Mogovolas	\N	\N
posto	Nametil	\N	\N	Mogovolas	\N	\N
posto	Nanhupo Rio	\N	\N	Mogovolas	\N	\N
posto	Chalaua	\N	\N	Moma	\N	\N
posto	Mocuba	\N	\N	Mocuba	\N	{Zambeze}
posto	\N	\N	0	Lugela	\N	\N
posto	\N	\N	0	Muanza	\N	\N
posto	\N	\N	0	Dondo	\N	\N
posto	\N	\N	0	Zumbu	\N	\N
posto	\N	\N	0	Buzi	\N	\N
posto	\N	\N	0	Mocuba	\N	\N
posto	\N	\N	0	Chemba	\N	\N
posto	\N	\N	0	Maringue	\N	\N
posto	Alto Molocue	\N	\N	Alto Molocue	\N	\N
posto	Nauela	\N	\N	Alto Molocue	\N	\N
posto	Angoche	\N	\N	Angoche	\N	\N
posto	Aube	\N	\N	Angoche	\N	\N
posto	Boila	\N	\N	Angoche	\N	\N
posto	Namaponda	\N	\N	Angoche	\N	\N
posto	Domue	\N	\N	Angonia	\N	\N
posto	Ulongue	\N	\N	Angonia	\N	\N
posto	Catandica	\N	\N	Barue	\N	\N
posto	Choa	\N	\N	Barue	\N	\N
posto	Nhampassa	\N	\N	Barue	\N	\N
posto	Buzi	\N	\N	Buzi	\N	\N
posto	Estaquinha	\N	\N	Buzi	\N	\N
posto	Sofala	\N	\N	Buzi	\N	\N
posto	Chintholo	\N	\N	Cahora Bassa	\N	\N
posto	Chitima	\N	\N	Cahora Bassa	\N	\N
posto	Songo	\N	\N	Cahora Bassa	\N	\N
posto	Murraça	\N	\N	Caia	\N	\N
posto	Sena	\N	\N	Caia	\N	\N
posto	Chipembere	\N	\N	Changara	\N	\N
posto	Kachembe	\N	\N	Changara	\N	\N
posto	Luenha	\N	\N	Changara	\N	\N
posto	Chiramba	\N	\N	Chemba	\N	\N
posto	Mulima	\N	\N	Chemba	\N	\N
posto	Inhaminga	\N	\N	Cheringoma	\N	\N
posto	Inhamitanga	\N	\N	Cheringoma	\N	\N
posto	Chibabava	\N	\N	Chibabava	\N	\N
posto	Goonda	\N	\N	Chibabava	\N	\N
posto	Muxungue	\N	\N	Chibabava	\N	\N
posto	Mualadze	\N	\N	Chifunde	\N	\N
posto	Nsadzu	\N	\N	Chifunde	\N	\N
posto	Luabo	\N	\N	Chinde	\N	\N
posto	Micaune	\N	\N	Chinde	\N	\N
posto	Kazula	\N	\N	Chiuta	\N	\N
posto	Manje	\N	\N	Chiuta	\N	\N
posto	Cidade Da Beira	\N	\N	Cidade Da Beira	\N	\N
posto	Cidade De Chimoio	\N	\N	Cidade De Chimoio	\N	\N
posto	Messica	\N	\N	Manica	\N	\N
posto	Vanduzi	\N	\N	Manica	\N	\N
posto	Chipera	\N	\N	Maravia	\N	\N
posto	Chiputu	\N	\N	Maravia	\N	\N
posto	Fingoe	\N	\N	Maravia	\N	\N
posto	Malowera	\N	\N	Maravia	\N	\N
posto	Canxixe	\N	\N	Maringue	\N	\N
posto	Subwe	\N	\N	Maringue	\N	\N
posto	Chupanga	\N	\N	Marromeu	\N	\N
posto	7 De Abril	\N	\N	Meconta	\N	\N
posto	Corrane	\N	\N	Meconta	\N	\N
posto	Meconta	\N	\N	Meconta	\N	\N
posto	Namialo	\N	\N	Meconta	\N	\N
posto	Mecuburi	\N	\N	Mecuburi	\N	\N
posto	Milhana	\N	\N	Mecuburi	\N	\N
posto	Caia	\N	\N	Caia	\N	{Zambeze}
posto	Chemba	\N	\N	Chemba	\N	{Zambeze}
posto	Maringue	\N	\N	Maringue	\N	{Zambeze}
posto	Marromeu	\N	\N	Marromeu	\N	{Zambeze}
posto	Chifunde	\N	\N	Chifunde	\N	{Zambeze}
posto	Chinde	\N	\N	Chinde	\N	{Zambeze}
posto	Muite	\N	\N	Mecuburi	\N	\N
posto	Namina	\N	\N	Mecuburi	\N	\N
posto	Chipene	\N	\N	Memba	\N	\N
posto	Mazula	\N	\N	Memba	\N	\N
posto	Memba	\N	\N	Memba	\N	\N
posto	Majaua	\N	\N	Milange	\N	\N
posto	Molumbo	\N	\N	Milange	\N	\N
posto	Mongue	\N	\N	Milange	\N	\N
posto	Kambulatsisi	\N	\N	Moatize	\N	\N
posto	Larde	\N	\N	Moma	\N	\N
posto	Moma	\N	\N	Moma	\N	\N
posto	Mucuali	\N	\N	Moma	\N	\N
posto	Itoculo	\N	\N	Monapo	\N	\N
posto	Monapo	\N	\N	Monapo	\N	\N
posto	Netia	\N	\N	Monapo	\N	\N
posto	Campo	\N	\N	Mopeia	\N	\N
posto	Chire	\N	\N	Morrumbala	\N	\N
posto	Derre	\N	\N	Morrumbala	\N	\N
posto	Megaza	\N	\N	Morrumbala	\N	\N
posto	Lunga	\N	\N	Mossuril	\N	\N
posto	Matibane	\N	\N	Mossuril	\N	\N
posto	Mossuril	\N	\N	Mossuril	\N	\N
posto	Chiurairue	\N	\N	Mossurize	\N	\N
posto	Dacata	\N	\N	Mossurize	\N	\N
posto	Espungabera	\N	\N	Mossurize	\N	\N
posto	Galinha	\N	\N	Muanza	\N	\N
posto	Muanza	\N	\N	Muanza	\N	\N
posto	Imala	\N	\N	Muecate	\N	\N
posto	Muculoene	\N	\N	Muecate	\N	\N
posto	Muecate	\N	\N	Muecate	\N	\N
posto	Chinga	\N	\N	Murrupula	\N	\N
posto	Murrupula	\N	\N	Murrupula	\N	\N
posto	Nihessiue	\N	\N	Murrupula	\N	\N
posto	Charre	\N	\N	Mutarara	\N	\N
posto	Doa	\N	\N	Mutarara	\N	\N
posto	Inhangoma	\N	\N	Mutarara	\N	\N
posto	Nhamayabue	\N	\N	Mutarara	\N	\N
posto	Nacala	\N	\N	Nacala	\N	\N
posto	Covo	\N	\N	Nacala-A-Velha	\N	\N
posto	Nacala-A-Velha	\N	\N	Nacala-A-Velha	\N	\N
posto	Intete	\N	\N	Nacaroa	\N	\N
posto	Nacaroa	\N	\N	Nacaroa	\N	\N
posto	Saua-Saua	\N	\N	Nacaroa	\N	\N
posto	Macuze	\N	\N	Namacurra	\N	\N
posto	Namarroi	\N	\N	Namarroi	\N	\N
posto	Regone	\N	\N	Namarroi	\N	\N
posto	Anchilo	\N	\N	Nampula	\N	\N
posto	Mutivasse	\N	\N	Nampula	\N	\N
posto	Namaita	\N	\N	Nampula	\N	\N
posto	Rapale	\N	\N	Nampula	\N	\N
posto	Nhamatanda	\N	\N	Nhamatanda	\N	\N
posto	Tica	\N	\N	Nhamatanda	\N	\N
posto	Maquival	\N	\N	Nicoadala	\N	\N
posto	Mualama	\N	\N	Pebane	\N	\N
posto	Naburi	\N	\N	Pebane	\N	\N
posto	Pebane	\N	\N	Pebane	\N	\N
posto	Cunle	\N	\N	Ribaue	\N	\N
posto	Iapala	\N	\N	Ribaue	\N	\N
posto	Ribaue	\N	\N	Ribaue	\N	\N
posto	Dombe	\N	\N	Sussundenga	\N	\N
posto	Muoha	\N	\N	Sussundenga	\N	\N
posto	Rotanda	\N	\N	Sussundenga	\N	\N
posto	Sussundenga	\N	\N	Sussundenga	\N	\N
posto	Bazua	\N	\N	Tambara	\N	\N
posto	Nhacafula	\N	\N	Tambara	\N	\N
posto	Nhacolo	\N	\N	Tambara	\N	\N
posto	Ntengo-Wa-Mbalame	\N	\N	Tsangano	\N	\N
posto	Muze	\N	\N	Zumbu	\N	\N
posto	Zambue	\N	\N	Zumbu	\N	\N
posto	Cuamba	\N	\N	Cuamba	\N	{Norte}
posto	Etarara	\N	\N	Cuamba	\N	{Norte}
posto	Lurio	\N	\N	Cuamba	\N	{Norte}
posto	Cobue	\N	\N	Lago	\N	{Norte}
posto	Luhno	\N	\N	Lago	\N	{Norte}
posto	Maniamba	\N	\N	Lago	\N	{Norte}
posto	Metangula	\N	\N	Lago	\N	{Norte}
posto	Chimbonila	\N	\N	Lichinga	\N	{Norte}
posto	Lione	\N	\N	Lichinga	\N	{Norte}
posto	Meponda	\N	\N	Lichinga	\N	{Norte}
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
posto	Moatize	\N	\N	Moatize	\N	{Zambeze}
posto	Tsangano	\N	\N	Tsangano	\N	{Zambeze}
posto	Zumbu	\N	\N	Zumbu	\N	{Zambeze}
posto	Milange	\N	\N	Milange	\N	{Zambeze}
posto	Mopeia	\N	\N	Mopeia	\N	{Zambeze}
posto	Morrumbala	\N	\N	Morrumbala	\N	{Zambeze}
posto	Namacurra	\N	\N	Namacurra	\N	{Zambeze}
posto	Nicoadala	\N	\N	Nicoadala	\N	{Zambeze}
posto	Cidade de Lichinga	\N	\N	Cidade de Lichinga	\N	{Norte,Zambeze}
posto	Insaca	\N	\N	Mecanhelas	\N	{Norte}
posto	Matondovela	\N	\N	Mecula	\N	{Norte}
posto	Mecula	\N	\N	Mecula	\N	{Norte}
posto	Metarica	\N	\N	Metarica	\N	{Norte}
posto	Nacumua	\N	\N	Metarica	\N	{Norte}
posto	Chiconono	\N	\N	Muembe	\N	{Norte}
posto	Muembe	\N	\N	Muembe	\N	{Norte}
posto	Itepela	\N	\N	Ngauma	\N	{Norte}
posto	Massangulo	\N	\N	Ngauma	\N	{Norte}
posto	Muipite	\N	\N	Nipepe	\N	{Norte}
posto	Nipepe	\N	\N	Nipepe	\N	{Norte}
posto	Lussimbesse	\N	\N	Sanga	\N	{Norte}
posto	Macaloge	\N	\N	Sanga	\N	{Norte}
posto	Matchedje	\N	\N	Sanga	\N	{Norte}
posto	Unango	\N	\N	Sanga	\N	{Norte}
posto	Chissano	\N	\N	Bilene	\N	{Sul}
posto	Macia	\N	\N	Bilene	\N	{Sul}
posto	Makluane	\N	\N	Bilene	\N	{Sul}
posto	Mazivila	\N	\N	Bilene	\N	{Sul}
posto	Messano	\N	\N	Bilene	\N	{Sul}
posto	Praia De Bilene	\N	\N	Bilene	\N	{Sul}
posto	Boane	\N	\N	Boane	\N	{Sul}
posto	Matola Rio	\N	\N	Boane	\N	{Sul}
posto	Alto Changane	\N	\N	Chibuto	\N	{Sul}
posto	Chaimite	\N	\N	Chibuto	\N	{Sul}
posto	Changanine	\N	\N	Chibuto	\N	{Sul}
posto	Chibuto	\N	\N	Chibuto	\N	{Sul}
posto	Godide	\N	\N	Chibuto	\N	{Sul}
posto	Malehice	\N	\N	Chibuto	\N	{Sul}
posto	Mapai	\N	\N	Chicualacuala	\N	{Sul}
posto	Pafuri	\N	\N	Chicualacuala	\N	{Sul}
posto	Vila Eduardo Mondlane	\N	\N	Chicualacuala	\N	{Sul}
posto	Chigubo	\N	\N	Chigubo	\N	{Sul}
posto	Dindiza	\N	\N	Chigubo	\N	{Sul}
posto	Cidade Da Matola	\N	\N	Cidade Da Matola	\N	{Sul}
posto	Cidade De Inhambane	\N	\N	Cidade De Inhambane	\N	{Sul}
posto	Cidade De Maputo	\N	\N	Cidade De Maputo	\N	{Sul}
posto	Cidade De Xai-Xai	\N	\N	Cidade De Xai-Xai	\N	{Sul}
posto	Funhalouro	\N	\N	Funhalouro	\N	{Sul}
posto	Tome	\N	\N	Funhalouro	\N	{Sul}
posto	Nova Mambone	\N	\N	Govuro	\N	{Sul}
posto	Homoine	\N	\N	Homoine	\N	{Sul}
posto	Pembe	\N	\N	Homoine	\N	{Sul}
posto	Chivongoene	\N	\N	Guijá	\N	{Sul}
posto	Mubangoene	\N	\N	Guijá	\N	{Sul}
posto	Nalazi	\N	\N	Guijá	\N	{Sul}
posto	Lionde	\N	\N	Chokwé	\N	{Sul}
posto	Macarretane	\N	\N	Chokwé	\N	{Sul}
posto	Xilembene	\N	\N	Chokwé	\N	{Sul}
posto	Chokwé	\N	\N	Chokwé	\N	{Sul}
posto	Chiuta	\N	\N	Mecanhelas	\N	{Norte,Zambeze}
posto	Inharrime	\N	\N	Inharrime	\N	{Sul}
posto	Mocumbi	\N	\N	Inharrime	\N	{Sul}
posto	Bazaruto	\N	\N	Inhassoro	\N	{Sul}
posto	Inhassoro	\N	\N	Inhassoro	\N	{Sul}
posto	Cumbana	\N	\N	Jangamo	\N	{Sul}
posto	Jangamo	\N	\N	Jangamo	\N	{Sul}
posto	Combomune	\N	\N	Mabalane	\N	{Sul}
posto	Mabalane	\N	\N	Mabalane	\N	{Sul}
posto	Ntlavene	\N	\N	Mabalane	\N	{Sul}
posto	Mabote	\N	\N	Mabote	\N	{Sul}
posto	Zimane	\N	\N	Mabote	\N	{Sul}
posto	Zinave	\N	\N	Mabote	\N	{Sul}
posto	Divinhe	\N	\N	Machanga	\N	{Sul}
posto	Machanga	\N	\N	Machanga	\N	{Sul}
posto	Chitobe	\N	\N	Machaze	\N	{Sul}
posto	Save	\N	\N	Machaze	\N	{Sul}
posto	Magude	\N	\N	Magude	\N	{Sul}
posto	Mahele	\N	\N	Magude	\N	{Sul}
posto	Mapulanguene	\N	\N	Magude	\N	{Sul}
posto	Motaze	\N	\N	Magude	\N	{Sul}
posto	Panjane	\N	\N	Magude	\N	{Sul}
posto	Chibonzane	\N	\N	Mandlakaze	\N	{Sul}
posto	Chidenguele	\N	\N	Mandlakaze	\N	{Sul}
posto	Macuacua	\N	\N	Mandlakaze	\N	{Sul}
posto	Mandlakaze	\N	\N	Mandlakaze	\N	{Sul}
posto	Mazucane	\N	\N	Mandlakaze	\N	{Sul}
posto	Nguzene	\N	\N	Mandlakaze	\N	{Sul}
posto	Xhalala	\N	\N	Mandlakaze	\N	{Sul}
posto	Calanga	\N	\N	Manhiça	\N	{Sul}
posto	Ilha Josina Machel	\N	\N	Manhiça	\N	{Sul}
posto	Maluana	\N	\N	Manhiça	\N	{Sul}
posto	Palmeira	\N	\N	Manhiça	\N	{Sul}
posto	Xinavane	\N	\N	Manhiça	\N	{Sul}
posto	Machubo	\N	\N	Marracuene	\N	{Sul}
posto	Marracuene	\N	\N	Marracuene	\N	{Sul}
posto	Massangena	\N	\N	Massangena	\N	{Sul}
posto	Mavue	\N	\N	Massangena	\N	{Sul}
posto	Chicomo	\N	\N	Massinga	\N	{Sul}
posto	Massinga	\N	\N	Massinga	\N	{Sul}
posto	Massingir	\N	\N	Massingir	\N	{Sul}
posto	Mavodze	\N	\N	Massingir	\N	{Sul}
posto	Zulo	\N	\N	Massingir	\N	{Sul}
posto	Bela Vista	\N	\N	Matutuine	\N	{Sul}
posto	Catuane	\N	\N	Matutuine	\N	{Sul}
posto	Mugazine	\N	\N	Matutuine	\N	{Sul}
posto	Ndelane	\N	\N	Matutuine	\N	{Sul}
posto	Zitundo	\N	\N	Matutuine	\N	{Sul}
posto	Maxixe	\N	\N	Maxixe	\N	{Sul}
posto	Moamba	\N	\N	Moamba	\N	{Sul}
posto	Pessene	\N	\N	Moamba	\N	{Sul}
posto	Ressano Garcia	\N	\N	Moamba	\N	{Sul}
posto	Sabie	\N	\N	Moamba	\N	{Sul}
posto	Morrumbene	\N	\N	Morrumbene	\N	{Sul}
posto	Mucoduene	\N	\N	Morrumbene	\N	{Sul}
posto	Changalane	\N	\N	Namaacha	\N	{Sul}
posto	Namaacha	\N	\N	Namaacha	\N	{Sul}
posto	Mawayela	\N	\N	Panda	\N	{Sul}
posto	Panda	\N	\N	Panda	\N	{Sul}
posto	Urrene	\N	\N	Panda	\N	{Sul}
posto	Mapinhane	\N	\N	Vilankulo	\N	{Sul}
posto	Vilankulo	\N	\N	Vilankulo	\N	{Sul}
posto	Chicumbane	\N	\N	Xai-Xai	\N	{Sul}
posto	Chongoene	\N	\N	Xai-Xai	\N	{Sul}
posto	Zongoene	\N	\N	Xai-Xai	\N	{Sul}
posto	Quissico	\N	\N	Zavala	\N	{Sul}
posto	Zandamela	\N	\N	Zavala	\N	{Sul}
posto	\N	\N	0	Cidade de Lichinga	\N	{Norte}
posto	\N	\N	0	Cuamba	\N	{Norte}
posto	\N	\N	0	Lago	\N	{Norte}
posto	\N	\N	0	Lichinga	\N	{Norte}
posto	\N	\N	0	Majune	\N	{Norte}
posto	\N	\N	0	Mandimba	\N	{Norte}
posto	\N	\N	0	Marrupa	\N	{Norte}
posto	\N	\N	0	Maua	\N	{Norte}
posto	\N	\N	0	Mavago	\N	{Norte}
posto	\N	\N	0	Mecanhelas	\N	{Norte}
posto	\N	\N	0	Mecula	\N	{Norte}
posto	\N	\N	0	Metarica	\N	{Norte}
posto	\N	\N	0	Muembe	\N	{Norte}
posto	\N	\N	0	Ngauma	\N	{Norte}
posto	\N	\N	0	Nipepe	\N	{Norte}
posto	\N	\N	0	Sanga	\N	{Norte}
posto	\N	\N	0	Massingir	\N	{Sul}
posto	\N	\N	0	Cidade Da Matola	\N	{Sul}
posto	\N	\N	0	Cidade De Maputo	\N	{Sul}
posto	\N	\N	0	Xai-Xai	\N	{Sul}
posto	\N	\N	0	Jangamo	\N	{Sul}
posto	\N	\N	0	Cidade De Xai-Xai	\N	{Sul}
posto	\N	\N	0	Panda	\N	{Sul}
posto	\N	\N	0	Govuro	\N	{Sul}
posto	\N	\N	0	Zavala	\N	{Sul}
posto	\N	\N	0	Bilene	\N	{Sul}
posto	\N	\N	0	Funhalouro	\N	{Sul}
posto	\N	\N	0	Maxixe	\N	{Sul}
posto	\N	\N	0	Mabote	\N	{Sul}
posto	\N	\N	0	Manhiça	\N	{Sul}
posto	\N	\N	0	Massinga	\N	{Sul}
posto	\N	\N	0	Vilankulo	\N	{Sul}
posto	\N	\N	0	Machanga	\N	{Sul}
posto	\N	\N	0	Boane	\N	{Sul}
posto	\N	\N	0	Cidade De Inhambane	\N	{Sul}
posto	\N	\N	0	Namaacha	\N	{Sul}
posto	\N	\N	0	Chigubo	\N	{Sul}
posto	\N	\N	0	Chicualacuala	\N	{Sul}
posto	\N	\N	0	Magude	\N	{Sul}
posto	\N	\N	0	Mandlakaze	\N	{Sul}
posto	\N	\N	0	Morrumbene	\N	{Sul}
posto	\N	\N	0	Homoine	\N	{Sul}
posto	\N	\N	0	Inharrime	\N	{Sul}
posto	\N	\N	0	Machaze	\N	{Sul}
posto	\N	\N	0	Massangena	\N	{Sul}
posto	\N	\N	0	Inhassoro	\N	{Sul}
posto	\N	\N	0	Mabalane	\N	{Sul}
posto	\N	\N	0	Marracuene	\N	{Sul}
posto	\N	\N	0	Chibuto	\N	{Sul}
posto	\N	\N	0	Matutuine	\N	{Sul}
posto	\N	\N	0	Moamba	\N	{Sul}
posto	Ancuabe	\N	\N	Ancuabe	\N	{Norte,DPMAIP}
posto	Mesa	\N	\N	Ancuabe	\N	{Norte,DPMAIP}
posto	Metoro	\N	\N	Ancuabe	\N	{Norte,DPMAIP}
posto	Balama	\N	\N	Balama	\N	{Norte,DPMAIP}
posto	Impiri	\N	\N	Balama	\N	{Norte,DPMAIP}
posto	Kuekue	\N	\N	Balama	\N	{Norte,DPMAIP}
posto	Mavala	\N	\N	Balama	\N	{Norte,DPMAIP}
posto	Chiure	\N	\N	Chiure	\N	{Norte,DPMAIP}
posto	Chiure Velho	\N	\N	Chiure	\N	{Norte,DPMAIP}
posto	Katapua	\N	\N	Chiure	\N	{Norte,DPMAIP}
posto	Mazeze	\N	\N	Chiure	\N	{Norte,DPMAIP}
posto	Namogelia	\N	\N	Chiure	\N	{Norte,DPMAIP}
posto	Ocua	\N	\N	Chiure	\N	{Norte,DPMAIP}
posto	Cidade de Pemba	\N	\N	Cidade de Pemba	\N	{Norte,DPMAIP}
posto	Ibo	\N	\N	Ibo	\N	{Norte,DPMAIP}
posto	Quirimba	\N	\N	Ibo	\N	{Norte,DPMAIP}
posto	Chai	\N	\N	Macomia	\N	{Norte,DPMAIP}
posto	Macomia	\N	\N	Macomia	\N	{Norte,DPMAIP}
posto	Mucojo	\N	\N	Macomia	\N	{Norte,DPMAIP}
posto	Quiterajo	\N	\N	Macomia	\N	{Norte,DPMAIP}
posto	Mecufi	\N	\N	Mecufi	\N	{Norte,DPMAIP}
posto	Murrebue	\N	\N	Mecufi	\N	{Norte,DPMAIP}
posto	Meluco	\N	\N	Meluco	\N	{Norte,DPMAIP}
posto	Muaguide	\N	\N	Meluco	\N	{Norte,DPMAIP}
posto	Diaca	\N	\N	Mocimboa da Praia	\N	{Norte,DPMAIP}
posto	Mbau	\N	\N	Mocimboa da Praia	\N	{Norte,DPMAIP}
posto	Mocimboa da Praia	\N	\N	Mocimboa da Praia	\N	{Norte,DPMAIP}
posto	Mapupulo	\N	\N	Montepuez	\N	{Norte,DPMAIP}
posto	Mirate	\N	\N	Montepuez	\N	{Norte,DPMAIP}
posto	Montepuez	\N	\N	Montepuez	\N	{Norte,DPMAIP}
posto	Nairoto	\N	\N	Montepuez	\N	{Norte,DPMAIP}
posto	Namanhumbir	\N	\N	Montepuez	\N	{Norte,DPMAIP}
posto	Chapa	\N	\N	Mueda	\N	{Norte,DPMAIP}
posto	Imbuo	\N	\N	Mueda	\N	{Norte,DPMAIP}
posto	Mueda	\N	\N	Mueda	\N	{Norte,DPMAIP}
posto	N'Gapa	\N	\N	Mueda	\N	{Norte,DPMAIP}
posto	Negomano	\N	\N	Mueda	\N	{Norte,DPMAIP}
posto	Chitunda	\N	\N	Muidumbe	\N	{Norte,DPMAIP}
posto	Miteda	\N	\N	Muidumbe	\N	{Norte,DPMAIP}
posto	Muidumbe	\N	\N	Muidumbe	\N	{Norte,DPMAIP}
posto	Hucula	\N	\N	Namuno	\N	{Norte,DPMAIP}
posto	Machoca	\N	\N	Namuno	\N	{Norte,DPMAIP}
posto	\N	\N	0	Guijá	\N	{Sul}
posto	\N	\N	0	Chokwé	\N	{Sul}
posto	Meloco	\N	\N	Namuno	\N	{Norte,DPMAIP}
posto	N'Cumpe	\N	\N	Namuno	\N	{Norte,DPMAIP}
posto	Namuno	\N	\N	Namuno	\N	{Norte,DPMAIP}
posto	Papai	\N	\N	Namuno	\N	{Norte,DPMAIP}
posto	M'Tamba	\N	\N	Nangade	\N	{Norte,DPMAIP}
posto	Nangade	\N	\N	Nangade	\N	{Norte,DPMAIP}
posto	Olumbi	\N	\N	Palma	\N	{Norte,DPMAIP}
posto	Palma	\N	\N	Palma	\N	{Norte,DPMAIP}
posto	Pundanhar	\N	\N	Palma	\N	{Norte,DPMAIP}
posto	Quionga	\N	\N	Palma	\N	{Norte,DPMAIP}
posto	Metuge	\N	\N	Pemba - Metuge	\N	{Norte,DPMAIP}
posto	Mieze	\N	\N	Pemba - Metuge	\N	{Norte,DPMAIP}
posto	Bilibiza	\N	\N	Quissanga	\N	{Norte,DPMAIP}
posto	Mahate	\N	\N	Quissanga	\N	{Norte,DPMAIP}
posto	Quissanga	\N	\N	Quissanga	\N	{Norte,DPMAIP}
posto	\N	\N	0	Ancuabe	\N	{Norte,DPMAIP}
posto	\N	\N	0	Balama	\N	{Norte,DPMAIP}
posto	\N	\N	0	Chiure	\N	{Norte,DPMAIP}
posto	\N	\N	0	Cidade de Pemba	\N	{Norte,DPMAIP}
posto	\N	\N	0	Ibo	\N	{Norte,DPMAIP}
posto	\N	\N	0	Macomia	\N	{Norte,DPMAIP}
posto	\N	\N	0	Mecufi	\N	{Norte,DPMAIP}
posto	\N	\N	0	Meluco	\N	{Norte,DPMAIP}
posto	\N	\N	0	Mocimboa da Praia	\N	{Norte,DPMAIP}
posto	\N	\N	0	Montepuez	\N	{Norte,DPMAIP}
posto	\N	\N	0	Mueda	\N	{Norte,DPMAIP}
posto	\N	\N	0	Muidumbe	\N	{Norte,DPMAIP}
posto	\N	\N	0	Namuno	\N	{Norte,DPMAIP}
posto	\N	\N	0	Nangade	\N	{Norte,DPMAIP}
posto	\N	\N	0	Palma	\N	{Norte,DPMAIP}
posto	\N	\N	0	Quissanga	\N	{Norte,DPMAIP}
\.

UPDATE utentes.exploracaos SET
(loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade de Lichinga', 'Cidade de Lichinga') WHERE (loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade De Lichinga', 'Cidade De Lichinga');
UPDATE utentes.utentes SET
(loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade de Lichinga', 'Cidade de Lichinga') WHERE (loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade De Lichinga', 'Cidade De Lichinga');

UPDATE utentes.exploracaos SET
(loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade de Pemba', 'Cidade de Pemba') WHERE (loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade De Pemba', 'Cidade De Pemba');
UPDATE utentes.utentes SET
(loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade de Pemba', 'Cidade de Pemba') WHERE (loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Cidade De Pemba', 'Cidade De Pemba');


UPDATE utentes.exploracaos SET
(loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Mocimboa da Praia', 'Mocimboa da Praia') WHERE (loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Mocimboa Da Praia', 'Mocimboa Da Praia');
UPDATE utentes.utentes SET
(loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Mocimboa da Praia', 'Mocimboa da Praia') WHERE (loc_provin, loc_distri, loc_posto) = ('Cabo Delgado', 'Mocimboa Da Praia', 'Mocimboa Da Praia');

UPDATE utentes.exploracaos SET loc_distri = 'Mocimboa da Praia' WHERE loc_distri = 'Mocimboa Da Praia';
UPDATE utentes.utentes SET loc_distri = 'Mocimboa da Praia' WHERE loc_distri = 'Mocimboa Da Praia';

UPDATE utentes.exploracaos SET loc_distri = 'Pemba - Metuge' WHERE loc_distri = 'Pemba-Metuge';
UPDATE utentes.utentes SET loc_distri = 'Pemba - Metuge' WHERE loc_distri = 'Pemba-Metuge';


UPDATE utentes.exploracaos SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge');
UPDATE utentes.utentes SET (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba - Metuge') WHERE (loc_provin, loc_distri) = ('Cabo Delgado', 'Pemba-Metuge');


ALTER TABLE utentes.exploracaos ENABLE TRIGGER ALL;
ALTER TABLE utentes.utentes ENABLE TRIGGER ALL;
SET session_replication_role = 'origin';

-- Hacemos esto para forzar que se chequean las constraints
UPDATE utentes.utentes SET gid = gid;
UPDATE utentes.exploracaos SET gid = gid;

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
