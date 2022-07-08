-- Revert utentes:changes_for_bddunica_190520_inv_domains_loc_hidro from pg

BEGIN;

SET session_replication_role = 'replica';
ALTER TABLE inventario.barragens DISABLE TRIGGER ALL;
ALTER TABLE inventario.estacoes DISABLE TRIGGER ALL;
ALTER TABLE inventario.exploracoes DISABLE TRIGGER ALL;
ALTER TABLE inventario.fontes DISABLE TRIGGER ALL;


DELETE FROM inventario_dominios.bacia;
COPY inventario_dominios.bacia (category, key, value, ordering, parent, tooltip, app) FROM stdin;
bacia	Umbelúzi	\N	\N	\N	\N	{Sul}
bacia	Incomati	\N	\N	\N	\N	{Sul}
bacia	Limpopo	\N	\N	\N	\N	{Sul}
bacia	Inhavumalala	\N	\N	\N	\N	{Sul}
bacia	Govuro	\N	\N	\N	\N	{Sul}
bacia	Maducha	\N	\N	\N	\N	{Sul}
bacia	Chiendsele	\N	\N	\N	\N	{Sul}
bacia	Das Pedras	\N	\N	\N	\N	{Sul}
bacia	Fúti	\N	\N	\N	\N	{Sul}
bacia	Inhanombe	\N	\N	\N	\N	{Sul}
bacia	Inharrime	\N	\N	\N	\N	{Sul}
bacia	Maputo	\N	\N	\N	\N	{Sul}
bacia	Matola	\N	\N	\N	\N	{Sul}
bacia	Mutamba	\N	\N	\N	\N	{Sul}
bacia	Panga	\N	\N	\N	\N	{Sul}
bacia	Save	\N	\N	\N	\N	{Sul}
bacia	Tembe	\N	\N	\N	\N	{Sul}
bacia	 -- 	\N	\N	\N	\N	{Sul}
bacia	Megaruma	\N	\N	\N	\N	{Norte}
bacia	Messalo	\N	\N	\N	\N	{Norte}
bacia	Montepuez	\N	\N	\N	\N	{Norte}
bacia	Orla Marítima 1	\N	\N	\N	\N	{Norte}
bacia	Orla Marítima 2	\N	\N	\N	\N	{Norte}
bacia	Orla Marítima 3	\N	\N	\N	\N	{Norte}
bacia	Rovuma	\N	\N	\N	\N	{Norte}
\.


DELETE FROM inventario_dominios.subacia;
COPY inventario_dominios.subacia (category, key, value, ordering, parent, tooltip, app) FROM stdin;
subacia	Megaruma	\N	\N	Megaruma	\N	{Norte}
subacia	Messalo	\N	\N	Messalo	\N	{Norte}
subacia	Montepuez	\N	\N	Montepuez	\N	{Norte}
subacia	Meapia	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Metava	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Metori	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Miezi	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Miruco	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Muaguide	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Muizi	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Pemba	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Ridi	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	S/N OM1	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Tara-Quilite	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Tari	\N	\N	Orla Marítima 1	\N	{Norte}
subacia	Buizili	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Chafi	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Diquide	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Messingue	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Muacamula	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Muembe-Nanomo	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Muenha	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Necumbi	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	S/N	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	S/N OM2	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Sicoro/Lingula	\N	\N	Orla Marítima 2	\N	{Norte}
subacia	Bundaze-Monga	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Calundi/Uncudi	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Macanga	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Mecumbi	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Mepuira	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Meranvi	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Mipama	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Nango/Mepuira	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Quigode	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Quinhevo	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	S/N OM3	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Sinheu/Mutamba	\N	\N	Orla Marítima 3	\N	{Norte}
subacia	Rovuma	\N	\N	Rovuma	\N	{Norte}
subacia	Umbelúzi	\N	\N	Umbelúzi	\N	{Sul}
subacia	Incomati	\N	\N	Incomati	\N	{Sul}
subacia	Umbelúzi	\N	\N	Incomati	\N	{Sul}
subacia	Limpopo	\N	\N	Incomati	\N	{Sul}
subacia	Limpopo	\N	\N	Limpopo	\N	{Sul}
subacia	Sangutane	\N	\N	Limpopo	\N	{Sul}
subacia	Ponela	\N	\N	Limpopo	\N	{Sul}
subacia	Umbape	\N	\N	Limpopo	\N	{Sul}
subacia	Lumane	\N	\N	Limpopo	\N	{Sul}
subacia	Singuezi	\N	\N	Limpopo	\N	{Sul}
subacia	Govuro	\N	\N	Govuro	\N	{Sul}
subacia	Murri	\N	\N	Maducha	\N	{Sul}
subacia	Massinga	\N	\N	Chiendsele	\N	{Sul}
subacia	Malova	\N	\N	Chiendsele	\N	{Sul}
subacia	Das Pedras	\N	\N	Das Pedras	\N	{Sul}
subacia	Fúti	\N	\N	Fúti	\N	{Sul}
subacia	Furvela	\N	\N	Inhanombe	\N	{Sul}
subacia	Domo Domo	\N	\N	Inharrime	\N	{Sul}
subacia	Inhamiquelengue	\N	\N	Inharrime	\N	{Sul}
subacia	Inhatouco	\N	\N	Inharrime	\N	{Sul}
subacia	Lagoa Poelela	\N	\N	Inharrime	\N	{Sul}
subacia	Maputo	\N	\N	Maputo	\N	{Sul}
subacia	Matola	\N	\N	Matola	\N	{Sul}
subacia	Guiguacua	\N	\N	Mutamba	\N	{Sul}
subacia	Madangela	\N	\N	Panga	\N	{Sul}
subacia	Tegue ou Tague	\N	\N	Panga	\N	{Sul}
subacia	Save	\N	\N	Save	\N	{Sul}
subacia	Inhanombe	\N	\N	Tembe	\N	{Sul}
subacia	Tembe	\N	\N	Tembe	\N	{Sul}
subacia	Lagoa Nhajosse	\N	\N	 -- 	\N	{Sul}
subacia	Inhanombe	\N	\N	 -- 	\N	{Sul}
subacia	Guiua	\N	\N	 -- 	\N	{Sul}
subacia	Lago S. Martinho do Bilene	\N	\N	 -- 	\N	{Sul}
subacia	Infulene	\N	\N	 -- 	\N	{Sul}
subacia	Drenagem	\N	\N	 -- 	\N	{Sul}
\.


DELETE FROM inventario_dominios.bacia WHERE (SELECT key FROM domains.ara LIMIT 1) != ANY(app);
DELETE FROM inventario_dominios.subacia WHERE (SELECT key FROM domains.ara LIMIT 1) != ANY(app);


--- COMO HACER AQUÍ ROLLBACK ?
--- COMO HACER AQUÍ ROLLBACK ?
--- COMO HACER AQUÍ ROLLBACK ?
--- COMO HACER AQUÍ ROLLBACK ?


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
