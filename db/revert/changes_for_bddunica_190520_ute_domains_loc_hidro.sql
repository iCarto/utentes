-- Revert utentes:changes_for_bddunica_190520_ute_domains_loc_hidro from pg

BEGIN;

SET session_replication_role = 'replica';
ALTER TABLE utentes.exploracaos DISABLE TRIGGER ALL;
ALTER TABLE utentes.utentes DISABLE TRIGGER ALL;

DELETE FROM domains.bacia;
COPY domains.bacia (category, key, value, ordering, parent, tooltip, app) FROM stdin;
bacia	Megaruma	\N	\N	UGBPE	\N	{Norte,DPMAIP}
bacia	Orla Marítima 1	\N	\N	UGBPE	\N	{Norte,DPMAIP}
bacia	Messalo	\N	\N	UGBME	\N	{Norte,DPMAIP}
bacia	Orla Marítima 2	\N	\N	UGBME	\N	{Norte,DPMAIP}
bacia	Orla Marítima 3	\N	\N	UGBME	\N	{Norte,DPMAIP}
bacia	Montepuez	\N	\N	UGBMO	\N	{Norte,DPMAIP}
bacia	\N	\N	0	UGBME	\N	{Norte,DPMAIP}
bacia	\N	\N	0	UGBMO	\N	{Norte,DPMAIP}
bacia	\N	\N	0	UGBPE	\N	{Norte,DPMAIP}
bacia	\N	\N	0	UGBRO	\N	{Norte,DPMAIP}
bacia	Rovuma	\N	\N	UGBRO	\N	{Norte,DPMAIP}
bacia	\N	\N	0	UGBI	\N	{Sul}
bacia	\N	\N	0	UGBL	\N	{Sul}
bacia	\N	\N	0	UGBS	\N	{Sul}
bacia	\N	\N	0	UGBU	\N	{Sul}
bacia	Incomati	\N	\N	UGBI	\N	{Sul}
bacia	Limpopo	\N	\N	UGBL	\N	{Sul}
bacia	Chiendsele	\N	\N	UGBS	\N	{Sul}
bacia	Das Pedras	\N	\N	UGBS	\N	{Sul}
bacia	Davetave	\N	\N	UGBS	\N	{Sul}
bacia	Govuro	\N	\N	UGBS	\N	{Sul}
bacia	Inhanombe	\N	\N	UGBS	\N	{Sul}
bacia	Inharrime	\N	\N	UGBS	\N	{Sul}
bacia	Inhavumalala	\N	\N	UGBS	\N	{Sul}
bacia	Maducha	\N	\N	UGBS	\N	{Sul}
bacia	Mucambe	\N	\N	UGBS	\N	{Sul}
bacia	Mulalace	\N	\N	UGBS	\N	{Sul}
bacia	Mutamba	\N	\N	UGBS	\N	{Sul}
bacia	Nhametando	\N	\N	UGBS	\N	{Sul}
bacia	Panga	\N	\N	UGBS	\N	{Sul}
bacia	Save	\N	\N	UGBS	\N	{Sul}
bacia	Sem identificar	\N	\N	UGBS	\N	{Sul}
bacia	Bacias costeiras	\N	\N	UGBS	\N	{Sul}
bacia	Bacias endorreicas	\N	\N	UGBS	\N	{Sul}
bacia	Umbelúzi	\N	\N	UGBU	\N	{Sul}
bacia	Fúti	\N	\N	UGBU	\N	{Sul}
bacia	Maputo	\N	\N	UGBU	\N	{Sul}
bacia	Matola	\N	\N	UGBU	\N	{Sul}
bacia	Tembe	\N	\N	UGBU	\N	{Sul}
bacia	Sem identificar	\N	\N	UGBU	\N	{Sul}
bacia	Bacias costeiras	\N	\N	UGBU	\N	{Sul}
bacia	Infulene	\N	\N	UGBU	\N	{Sul}
bacia	Zambeze	\N	\N	UGBZ	\N	{Zambeze}
bacia	Inhaombe	\N	\N	UGBZ	\N	{Zambeze}
bacia	Bacias costeiras	\N	\N	UGBZ	\N	{Zambeze}
bacia	Lualua	\N	\N	UGBZ	\N	{Zambeze}
bacia	Cuacua	\N	\N	UGBZ	\N	{Zambeze}
bacia	Nhangone	\N	\N	UGBZ	\N	{Zambeze}
bacia	Inhamara	\N	\N	UGBZ	\N	{Zambeze}
bacia	Micelo	\N	\N	UGBZ	\N	{Zambeze}
bacia	Luaua	\N	\N	UGBZ	\N	{Zambeze}
bacia	Nhamacota	\N	\N	UGBZ	\N	{Zambeze}
bacia	Bazar	\N	\N	UGBZ	\N	{Zambeze}
\.




DELETE FROM domains.subacia;
COPY domains.subacia (category, key, value, ordering, parent, tooltip, app) FROM stdin;
subacia	\N	\N	0	Megaruma	\N	\N
subacia	\N	\N	0	Messalo	\N	\N
subacia	\N	\N	0	Montepuez	\N	\N
subacia	\N	\N	0	Orla Marítima 1	\N	\N
subacia	\N	\N	0	Orla Marítima 2	\N	\N
subacia	\N	\N	0	Orla Marítima 3	\N	\N
subacia	\N	\N	0	Rovuma	\N	\N
subacia	\N	\N	0	Umbeluzi	\N	\N
subacia	\N	\N	0	Bambe	\N	\N
subacia	\N	\N	0	Bembe	\N	\N
subacia	\N	\N	0	Chiendsele	\N	\N
subacia	\N	\N	0	Das Pedras	\N	\N
subacia	\N	\N	0	Davetave	\N	\N
subacia	\N	\N	0	Govuro	\N	\N
subacia	\N	\N	0	Incomati	\N	\N
subacia	\N	\N	0	Inhanombe	\N	\N
subacia	\N	\N	0	Inharrime	\N	\N
subacia	\N	\N	0	Inhavumalala	\N	\N
subacia	\N	\N	0	Limpopo	\N	\N
subacia	\N	\N	0	Maducha	\N	\N
subacia	\N	\N	0	Maputo	\N	\N
subacia	\N	\N	0	Bambe	\N	\N
subacia	\N	\N	0	Mucambe	\N	\N
subacia	\N	\N	0	Mulalace	\N	\N
subacia	\N	\N	0	Mutamba	\N	\N
subacia	\N	\N	0	Nhangualala	\N	\N
subacia	\N	\N	0	Panga	\N	\N
subacia	\N	\N	0	Save	\N	\N
subacia	\N	\N	0	Tembe	\N	\N
subacia	\N	\N	0	Outra	\N	\N
subacia	Megaruma	\N	\N	Megaruma	\N	{Norte,DPMAIP}
subacia	Messalo	\N	\N	Messalo	\N	{Norte,DPMAIP}
subacia	Montepuez	\N	\N	Montepuez	\N	{Norte,DPMAIP}
subacia	Meapia	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Metava	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Metori	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Miezi	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Miruco	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Muaguide	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Muizi	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Pemba	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Ridi	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	S/N OM1	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Tara-Quilite	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Tari	\N	\N	Orla Marítima 1	\N	{Norte,DPMAIP}
subacia	Buizili	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Chafi	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Diquide	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Messingue	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Muacamula	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Muembe-Nanomo	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	\N	\N	0	Futi	\N	\N
subacia	Muenha	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Necumbi	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	S/N	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	S/N OM2	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Sicoro/Lingula	\N	\N	Orla Marítima 2	\N	{Norte,DPMAIP}
subacia	Bundaze-Monga	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Calundi/Uncudi	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Macanga	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Mecumbi	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Mepuira	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Meranvi	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Mipama	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Nango/Mepuira	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Quigode	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Quinhevo	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	S/N OM3	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Sinheu/Mutamba	\N	\N	Orla Marítima 3	\N	{Norte,DPMAIP}
subacia	Rovuma	\N	\N	Rovuma	\N	{Norte,DPMAIP}
subacia	\N	\N	0	Bacias Costeiras	\N	\N
subacia	\N	\N	0	Jangamo	\N	\N
subacia	\N	\N	0	Infulene	\N	\N
subacia	\N	\N	0	Orla Marítima	\N	\N
subacia	\N	\N	0	Incomati	\N	{Sul}
subacia	\N	\N	0	Limpopo	\N	{Sul}
subacia	\N	\N	0	Chiendsele	\N	{Sul}
subacia	\N	\N	0	Das Pedras	\N	{Sul}
subacia	\N	\N	0	Davetave	\N	{Sul}
subacia	\N	\N	0	Govuro	\N	{Sul}
subacia	\N	\N	0	Inhanombe	\N	{Sul}
subacia	\N	\N	0	Inharrime	\N	{Sul}
subacia	\N	\N	0	Inhavumalala	\N	{Sul}
subacia	\N	\N	0	Maducha	\N	{Sul}
subacia	\N	\N	0	Mucambe	\N	{Sul}
subacia	\N	\N	0	Mulalace	\N	{Sul}
subacia	\N	\N	0	Mutamba	\N	{Sul}
subacia	\N	\N	0	Nhametando	\N	{Sul}
subacia	\N	\N	0	Panga	\N	{Sul}
subacia	\N	\N	0	Save	\N	{Sul}
subacia	\N	\N	0	Sem identificar	\N	{Sul}
subacia	\N	\N	0	Bacias costeiras	\N	{Sul}
subacia	\N	\N	0	Bacias endorreicas	\N	{Sul}
subacia	\N	\N	0	Umbelúzi	\N	{Sul}
subacia	\N	\N	0	Fúti	\N	{Sul}
subacia	\N	\N	0	Maputo	\N	{Sul}
subacia	\N	\N	0	Matola	\N	{Sul}
subacia	\N	\N	0	Tembe	\N	{Sul}
subacia	\N	\N	0	Sem identificar	\N	{Sul}
subacia	\N	\N	0	Bacias costeiras	\N	{Sul}
subacia	Incomati	\N	\N	Incomati	\N	{Sul}
subacia	Limpopo	\N	\N	Limpopo	\N	{Sul}
subacia	Chiendsele	\N	\N	Chiendsele	\N	{Sul}
subacia	Das Pedras	\N	\N	Das Pedras	\N	{Sul}
subacia	Davetave	\N	\N	Davetave	\N	{Sul}
subacia	Govuro	\N	\N	Govuro	\N	{Sul}
subacia	Inhanombe	\N	\N	Inhanombe	\N	{Sul}
subacia	Inharrime	\N	\N	Inharrime	\N	{Sul}
subacia	Inhavumalala	\N	\N	Inhavumalala	\N	{Sul}
subacia	Maducha	\N	\N	Maducha	\N	{Sul}
subacia	Mucambe	\N	\N	Mucambe	\N	{Sul}
subacia	Mulalace	\N	\N	Mulalace	\N	{Sul}
subacia	Mutamba	\N	\N	Mutamba	\N	{Sul}
subacia	Nhametando	\N	\N	Nhametando	\N	{Sul}
subacia	Panga	\N	\N	Panga	\N	{Sul}
subacia	Save	\N	\N	Save	\N	{Sul}
subacia	Sem identificar	\N	\N	Sem identificar	\N	{Sul}
subacia	Bacias endorreicas	\N	\N	Bacias endorreicas	\N	{Sul}
subacia	Umbelúzi	\N	\N	Umbelúzi	\N	{Sul}
subacia	Fúti	\N	\N	Fúti	\N	{Sul}
subacia	Maputo	\N	\N	Maputo	\N	{Sul}
subacia	Matola	\N	\N	Matola	\N	{Sul}
subacia	Tembe	\N	\N	Tembe	\N	{Sul}
subacia	Infulene	\N	\N	Infulene	\N	{Sul}
subacia	Zambeze	\N	\N	Zambeze	\N	{Zambeze}
subacia	Inhaombe	\N	\N	Inhaombe	\N	{Zambeze}
subacia	Lualua	\N	\N	Lualua	\N	{Zambeze}
subacia	Cuacua	\N	\N	Cuacua	\N	{Zambeze}
subacia	Nhangone	\N	\N	Nhangone	\N	{Zambeze}
subacia	Inhamara	\N	\N	Inhamara	\N	{Zambeze}
subacia	Micelo	\N	\N	Micelo	\N	{Zambeze}
subacia	Luaua	\N	\N	Luaua	\N	{Zambeze}
subacia	Nhamacota	\N	\N	Nhamacota	\N	{Zambeze}
subacia	Bazar	\N	\N	Bazar	\N	{Zambeze}
subacia	Bacias costeiras	\N	\N	Bacias costeiras	\N	{Sul,Zambeze}
subacia	\N	\N	0	Zambeze	\N	{Zambeze}
subacia	\N	\N	0	Inhaombe	\N	{Zambeze}
subacia	\N	\N	0	Bacias costeiras	\N	{Zambeze}
subacia	\N	\N	0	Lualua	\N	{Zambeze}
subacia	\N	\N	0	Cuacua	\N	{Zambeze}
subacia	\N	\N	0	Nhangone	\N	{Zambeze}
subacia	\N	\N	0	Inhamara	\N	{Zambeze}
subacia	\N	\N	0	Micelo	\N	{Zambeze}
subacia	\N	\N	0	Luaua	\N	{Zambeze}
subacia	\N	\N	0	Nhamacota	\N	{Zambeze}
subacia	\N	\N	0	Bazar	\N	{Zambeze}
\.


--- COMO HACER AQUÍ ROLLBACK ?
--- COMO HACER AQUÍ ROLLBACK ?
--- COMO HACER AQUÍ ROLLBACK ?
--- COMO HACER AQUÍ ROLLBACK ?


ALTER TABLE utentes.exploracaos ENABLE TRIGGER ALL;
ALTER TABLE utentes.utentes ENABLE TRIGGER ALL;
SET session_replication_role = 'origin';

-- Hacemos esto para forzar que se chequean las constraints
UPDATE utentes.utentes SET gid = gid;
UPDATE utentes.exploracaos SET gid = gid;

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
