-- Deploy utentes:populate_table_domains to pg
-- requires: create_table_domains

BEGIN;

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('provincia', '' , '' , 0 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('provincia', 'Cabo Delgado' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('provincia', 'Niassa' , '' , NULL ,'');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', '' , '' , 0 ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Ancuabe' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Balama' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Chiure' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Cidade De Pemba' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Ibo' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Macomia' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Mecufi' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Meluco' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Mocimboa Da Praia' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Montepuez' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Mueda' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Muidumbe' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Namuno' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Nangade' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Palma' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Pemba' , '' , NULL ,'Cabo Delgado');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Quissanga' , '' , NULL ,'Cabo Delgado');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', '' , '' , 0 ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Cidade De Lichinga' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Cuamba' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Lago' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Lichinga' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Majune' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Mandimba' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Marrupa' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Maua' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Mavago' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Mecanhelas' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Mecula' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Metarica' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Muembe' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Ngauma' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Nipepe' , '' , NULL ,'Niassa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('distrito', 'Sanga' , '' , NULL ,'Niassa');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Ancuabe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Ancuabe' , '' , NULL ,'Ancuabe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Metoro' , '' , NULL ,'Ancuabe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mesa' , '' , NULL ,'Ancuabe');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Balama');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Balama' , '' , NULL ,'Balama');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Impiri' , '' , NULL ,'Balama');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mavala' , '' , NULL ,'Balama');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Kuekue' , '' , NULL ,'Balama');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Quissanga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Bilibiza' , '' , NULL ,'Quissanga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Quissanga' , '' , NULL ,'Quissanga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mahate' , '' , NULL ,'Quissanga');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Macomia');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chai' , '' , NULL ,'Macomia');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mucojo' , '' , NULL ,'Macomia');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Macomia' , '' , NULL ,'Macomia');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Quiterajo' , '' , NULL ,'Macomia');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Mueda');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chapa' , '' , NULL ,'Mueda');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Imbuo' , '' , NULL ,'Mueda');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', $$N'Gapa$$ , '' , NULL ,'Mueda');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mueda' , '' , NULL ,'Mueda');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Negomano' , '' , NULL ,'Mueda');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Muembe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chiconono' , '' , NULL ,'Muembe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Muembe' , '' , NULL ,'Muembe');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Lichinga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chimbonila' , '' , NULL ,'Lichinga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Meponda' , '' , NULL ,'Lichinga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Lione' , '' , NULL ,'Lichinga');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Cidade De Lichinga' , '' , NULL ,'Cidade De Lichinga');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Muidumbe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chitunda' , '' , NULL ,'Muidumbe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Muidumbe' , '' , NULL ,'Muidumbe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Miteda' , '' , NULL ,'Muidumbe');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Chiure');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chiure' , '' , NULL ,'Chiure');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chiure Velho' , '' , NULL ,'Chiure');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Namogelia' , '' , NULL ,'Chiure');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mazeze' , '' , NULL ,'Chiure');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Katapua' , '' , NULL ,'Chiure');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Ocua' , '' , NULL ,'Chiure');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Chiuta' , '' , NULL ,'Mecanhelas');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Cidade De Pemba' , '' , NULL ,'Cidade De Pemba');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Lago');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Cobue' , '' , NULL ,'Lago');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Luhno' , '' , NULL ,'Lago');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Maniamba' , '' , NULL ,'Lago');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Metangula' , '' , NULL ,'Lago');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Cuamba');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Cuamba' , '' , NULL ,'Cuamba');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Etarara' , '' , NULL ,'Cuamba');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Lurio' , '' , NULL ,'Cuamba');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Mocimboa Da Praia');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Diaca' , '' , NULL ,'Mocimboa Da Praia');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mbau' , '' , NULL ,'Mocimboa Da Praia');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mocimboa Da Praia' , '' , NULL ,'Mocimboa Da Praia');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Namuno');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Hucula' , '' , NULL ,'Namuno');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Machoca' , '' , NULL ,'Namuno');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Papai' , '' , NULL ,'Namuno');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Namuno' , '' , NULL ,'Namuno');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', $$N'Cumpe$$ , '' , NULL ,'Namuno');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Meloco' , '' , NULL ,'Namuno');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Ibo');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Ibo' , '' , NULL ,'Ibo');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Quirimba' , '' , NULL ,'Ibo');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Marrupa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Marangira' , '' , NULL ,'Marrupa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Marrupa' , '' , NULL ,'Marrupa');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Nungo' , '' , NULL ,'Marrupa');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Ngauma');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Itepela' , '' , NULL ,'Ngauma');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Massangulo' , '' , NULL ,'Ngauma');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Sanga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Macaloge' , '' , NULL ,'Sanga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Lussimbesse' , '' , NULL ,'Sanga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Unango' , '' , NULL ,'Sanga');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Matchedje' , '' , NULL ,'Sanga');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Mavago');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', $$M'Sawize$$ , '' , NULL ,'Mavago');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mavago' , '' , NULL ,'Mavago');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Nangade');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', $$M'Tamba$$ , '' , NULL ,'Nangade');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Nangade' , '' , NULL ,'Nangade');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Maua');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Maiaca' , '' , NULL ,'Maua');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Maua' , '' , NULL ,'Maua');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Majune');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Malanga' , '' , NULL ,'Majune');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Nairrubi' , '' , NULL ,'Majune');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Muaquia' , '' , NULL ,'Majune');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Mandimba');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mandimba' , '' , NULL ,'Mandimba');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mitande' , '' , NULL ,'Mandimba');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Montepuez');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mapupulo' , '' , NULL ,'Montepuez');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mirate' , '' , NULL ,'Montepuez');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Nairoto' , '' , NULL ,'Montepuez');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Montepuez' , '' , NULL ,'Montepuez');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Namanhumbir' , '' , NULL ,'Montepuez');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Mecula');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Matondovela' , '' , NULL ,'Mecula');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mecula' , '' , NULL ,'Mecula');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Mecufi');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mecufi' , '' , NULL ,'Mecufi');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Murrebue' , '' , NULL ,'Mecufi');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Meluco');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Meluco' , '' , NULL ,'Meluco');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Muaguide' , '' , NULL ,'Meluco');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Metarica');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Metarica' , '' , NULL ,'Metarica');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Nacumua' , '' , NULL ,'Metarica');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Pemba');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Metuge' , '' , NULL ,'Pemba');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Mieze' , '' , NULL ,'Pemba');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Nipepe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Muipite' , '' , NULL ,'Nipepe');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Nipepe' , '' , NULL ,'Nipepe');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', '' , '' , 0 ,'Palma');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Olumbi' , '' , NULL ,'Palma');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Palma' , '' , NULL ,'Palma');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Pundanhar' , '' , NULL ,'Palma');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('posto', 'Quionga' , '' , NULL ,'Palma');


INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', '' , '' , 0 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', 'Megaruma' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', 'Messalo' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', 'Montepuez' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', 'Rovuma' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', 'Orla Marítima 1' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', 'Orla Marítima 2' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('bacia', 'Orla Marítima 3' , '' , NULL ,'');


INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Megaruma' , '' , NULL ,'Megaruma');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Messalo' , '' , NULL ,'Messalo');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Montepuez' , '' , NULL ,'Montepuez');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Rovuma' , '' , NULL ,'Rovuma');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', '' , '' , 0 ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Meapia' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Metava' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Metori' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Miezi' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Miruco' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Muaguide' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Muizi' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Ridi' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'S/N OM1' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Tara-Quilite' , '' , NULL ,'Orla Marítima 1');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Tari' , '' , NULL ,'Orla Marítima 1');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', '' , '' , 0 ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Buizili' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Chafi' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Diquide' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Muembe - Nanomo' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Muenha' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Messingue' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Muacamula' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Necumbi' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'S/N' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'S/N OM2' , '' , NULL ,'Orla Marítima 2');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Sicoro / Lingula' , '' , NULL ,'Orla Marítima 2');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', '' , '' , 0 ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Macanga' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Bundaze - Monga' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Calundi / Uncudi' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Mecumbi' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Mepuira' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Meranvi' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Mipama' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Nango / Mepuira' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Quigode' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Quinhevo' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'S/N OM3' , '' , NULL ,'Orla Marítima 3');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('subacia', 'Sinheu / Mutamba' , '' , NULL ,'Orla Marítima 3');



INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', '' , '' , 0 , '');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Denegada' , '' , 2 , '');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Irregular' , '' , 1 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Licenciada' , '' , 10 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Pendente aprobação tecnica (D. Cadastro)' , '' , 6 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Pendente aprobação tecnica (Dirección)' , '' , 7 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Pendente emisão (D. Jurídico)' , '' , 8 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Pendente firma (Direcção)' , '' , 9 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Pendente revisão Solicitação (D. Jurídico)' , '' , 5 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Pendente revisão Solicitação (Direcção)' , '' , 4 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_estado', 'Pendente solicitaçao utente' , '' , 3 ,'');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_tipo', '' , '' , 0 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_tipo', 'Subterránea' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('licencia_tipo', 'Superficial' , '' , NULL ,'');


INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('pagamentos', '' , '' , 0 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('pagamentos', 'Non pagada' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('pagamentos', 'Pagada' , '' , NULL ,'');


INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', '' , '' , 0 ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', 'Abastecimento' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', 'Agricultura' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', 'Indústria' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', 'Pecuária' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', 'Piscicultura' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', 'Producção energia' , '' , NULL ,'');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('actividade', 'Saneamento' , '' , NULL ,'');



INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo', '', '', 0, 'Subterránea');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo','Pozo', '', NULL, 'Subterránea');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo','Furo', '', NULL, 'Subterránea');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo','Nascente', '', NULL, 'Subterránea');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo','Outros', '', NULL, 'Subterránea');

INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo', '', '', 0, 'Superficial');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo','Rio', '', NULL, 'Superficial');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo','Albufeira', '', NULL, 'Superficial');
INSERT INTO utentes.domains (category, value, alias, ordering, parent) VALUES ('fonte_tipo','Lago', '', NULL, 'Superficial');




COMMIT;
