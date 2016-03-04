-- Deploy utentes:populate_domains_table to pg
-- requires: create_schema_domains

BEGIN;


INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', 'Abastecimento', NULL, NULL, NULL, NULL);
INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', 'Agricultura-Regadia', NULL, NULL, NULL, NULL);
INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', 'Indústria', NULL, NULL, NULL, NULL);
INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', 'Pecuária', NULL, NULL, NULL, NULL);
INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', 'Piscicultura', NULL, NULL, NULL, NULL);
INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', 'Producção de energia', NULL, NULL, NULL, NULL);
INSERT INTO domains.actividade (category, key, value, ordering, parent, tooltip) VALUES ('actividade', 'Saneamento', NULL, NULL, NULL, NULL);

INSERT INTO domains.animal_tipo (category, key, value, ordering, parent, tooltip) VALUES ('animal_tipo', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.animal_tipo (category, key, value, ordering, parent, tooltip) VALUES ('animal_tipo', 'Avícola (Aves)', NULL, NULL, NULL, NULL);
INSERT INTO domains.animal_tipo (category, key, value, ordering, parent, tooltip) VALUES ('animal_tipo', 'Caprino (Cabras)', NULL, NULL, NULL, NULL);
INSERT INTO domains.animal_tipo (category, key, value, ordering, parent, tooltip) VALUES ('animal_tipo', 'Equino (Cavalos)', NULL, NULL, NULL, NULL);
INSERT INTO domains.animal_tipo (category, key, value, ordering, parent, tooltip) VALUES ('animal_tipo', 'Ovino (Ovelhas)', NULL, NULL, NULL, NULL);
INSERT INTO domains.animal_tipo (category, key, value, ordering, parent, tooltip) VALUES ('animal_tipo', 'Porcino (Porcos)', NULL, NULL, NULL, NULL);
INSERT INTO domains.animal_tipo (category, key, value, ordering, parent, tooltip) VALUES ('animal_tipo', 'Vacuno (Vacas)', NULL, NULL, NULL, NULL);

INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Megaruma', NULL, NULL, NULL, NULL);
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Messalo', NULL, NULL, NULL, NULL);
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Montepuez', NULL, NULL, NULL, NULL);
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Orla Marítima 1', NULL, NULL, NULL, NULL);
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Orla Marítima 2', NULL, NULL, NULL, NULL);
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Orla Marítima 3', NULL, NULL, NULL, NULL);
INSERT INTO domains.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Rovuma', NULL, NULL, NULL, NULL);

INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', 'Existe', NULL, NULL, NULL, NULL);
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', 'Não existe', NULL, NULL, NULL, NULL);

INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Arroz', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Açúcar', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Batata', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Frijol', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Frutos secos', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Girasol', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Maiz', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Mandioca', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Outros', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Soja', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Sésamo', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Trigo', NULL, NULL, NULL, NULL);
INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Verduras', NULL, NULL, NULL, NULL);

INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', NULL, NULL, '0', 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Ancuabe', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Balama', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Chiure', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Pemba', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Ibo', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Macomia', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mecufi', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Meluco', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mocimboa da Praia', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Montepuez', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mueda', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Muidumbe', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Namuno', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Nangade', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Palma', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Pemba', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Quissanga', NULL, NULL, 'Cabo Delgado', NULL);

INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', NULL, NULL, '0', 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Lichinga', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cuamba', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Lago', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Lichinga', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Majune', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mandimba', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Marrupa', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Maua', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mavago', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mecanhelas', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mecula', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Metarica', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Muembe', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Ngauma', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Nipepe', NULL, NULL, 'Niassa', NULL);
INSERT INTO domains.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Sanga', NULL, NULL, 'Niassa', NULL);


INSERT INTO domains.energia_tipo (category, key, value, ordering, parent, tooltip) VALUES ('energia_tipo', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.energia_tipo (category, key, value, ordering, parent, tooltip) VALUES ('energia_tipo', 'Hidroelectrica', NULL, NULL, NULL, NULL);
INSERT INTO domains.energia_tipo (category, key, value, ordering, parent, tooltip) VALUES ('energia_tipo', 'Outra', NULL, NULL, NULL, NULL);

INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', NULL, NULL, '0', 'Subterrânea', NULL);
INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', 'Furo', NULL, NULL, 'Subterrânea', NULL);
INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', 'Outros', NULL, NULL, 'Subterrânea', NULL);
INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', 'Poço', NULL, NULL, 'Subterrânea', NULL);

INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', NULL, NULL, '0', 'Superficial', NULL);
INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', 'Albufeira', NULL, NULL, 'Superficial', NULL);
INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', 'Lago', NULL, NULL, 'Superficial', NULL);
INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', 'Nascente', NULL, NULL, 'Superficial', NULL);
INSERT INTO domains.fonte_tipo (category, key, value, ordering, parent, tooltip) VALUES ('fonte_tipo', 'Río', NULL, NULL, 'Superficial', NULL);

INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Alimetaria', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Automotriz', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Cementera', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Farmaceútica', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Ferrocarrilera', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Hotelera', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Minera', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Naviera', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Outra', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Papelera', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Petroquímica', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Química', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Téxtil', NULL, NULL, NULL, NULL);


INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Irregular', NULL, '1', NULL, 'A licença encontra-se num estado irregular (Incumplimieto dos acordos)
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Denegada', NULL, '2', NULL, 'A licença foi negada por não cumprir os requisitos
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente solicitação utente', NULL, '3', NULL, 'O utente ainda não tem entregado a carta de solicitação
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente revisão solicitação (Direcção)', NULL, '4', NULL, 'O utente tem entregado a solicitação. Pendente de revisão por direcção
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente revisão solicitação (D. Jurídico)', NULL, '5', NULL, 'O utente tem entregado a solicitação. Pendente de revisão pelo departamento jurídico
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente aprobação tecnica (D. Cadastro)', NULL, '6', NULL, 'Pendente que os técnicos do departamento de cadastro saiam a terreno a realizar a avaliação técnica
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente aprobação tecnica (Dirección)', NULL, '7', NULL, 'Avaliação técnica realizada. Pendente revisão e aprovação da licença por direcção
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente emisão (D. Jurídico)', NULL, '8', NULL, 'Licença aprovada por direcção. Pendente emissão da licença por departamento jurídico
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente firma (Direcção)', NULL, '9', NULL, 'Licença emitida. Pendente assinatura de direcção para sua aprovação definitiva.
');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Licenciada', NULL, '10', NULL, 'Licença concedida, em activo e com funcionamento regular
');

INSERT INTO domains.licencia_tipo (category, key, value, ordering, parent, tooltip) VALUES ('licencia_tipo', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.licencia_tipo (category, key, value, ordering, parent, tooltip) VALUES ('licencia_tipo', 'Subterrânea', NULL, NULL, NULL, NULL);
INSERT INTO domains.licencia_tipo (category, key, value, ordering, parent, tooltip) VALUES ('licencia_tipo', 'Superficial', NULL, NULL, NULL, NULL);

INSERT INTO domains.pagamentos (category, key, value, ordering, parent, tooltip) VALUES ('pagamentos', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.pagamentos (category, key, value, ordering, parent, tooltip) VALUES ('pagamentos', 'Non pagada', NULL, NULL, NULL, NULL);
INSERT INTO domains.pagamentos (category, key, value, ordering, parent, tooltip) VALUES ('pagamentos', 'Pagada', NULL, NULL, NULL, NULL);


INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Ancuabe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ancuabe', NULL, NULL, 'Ancuabe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mesa', NULL, NULL, 'Ancuabe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metoro', NULL, NULL, 'Ancuabe', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Balama', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Balama', NULL, NULL, 'Balama', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Impiri', NULL, NULL, 'Balama', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Kuekue', NULL, NULL, 'Balama', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mavala', NULL, NULL, 'Balama', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Chiure', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiure', NULL, NULL, 'Chiure', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiure Velho', NULL, NULL, 'Chiure', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Katapua', NULL, NULL, 'Chiure', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mazeze', NULL, NULL, 'Chiure', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Namogelia', NULL, NULL, 'Chiure', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ocua', NULL, NULL, 'Chiure', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Cidade de Lichinga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Lichinga', NULL, NULL, 'Cidade de Lichinga', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Cidade de Pemba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Pemba', NULL, NULL, 'Cidade de Pemba', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Cuamba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cuamba', NULL, NULL, 'Cuamba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Etarara', NULL, NULL, 'Cuamba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Lurio', NULL, NULL, 'Cuamba', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Ibo', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ibo', NULL, NULL, 'Ibo', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quirimba', NULL, NULL, 'Ibo', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Lago', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cobue', NULL, NULL, 'Lago', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Luhno', NULL, NULL, 'Lago', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Maniamba', NULL, NULL, 'Lago', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metangula', NULL, NULL, 'Lago', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Lichinga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chimbonila', NULL, NULL, 'Lichinga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Lione', NULL, NULL, 'Lichinga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Meponda', NULL, NULL, 'Lichinga', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Macomia', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chai', NULL, NULL, 'Macomia', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Macomia', NULL, NULL, 'Macomia', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mucojo', NULL, NULL, 'Macomia', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quiterajo', NULL, NULL, 'Macomia', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Majune', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Malanga', NULL, NULL, 'Majune', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muaquia', NULL, NULL, 'Majune', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nairrubi', NULL, NULL, 'Majune', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Mandimba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mandimba', NULL, NULL, 'Mandimba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mitande', NULL, NULL, 'Mandimba', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Marrupa', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Marangira', NULL, NULL, 'Marrupa', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Marrupa', NULL, NULL, 'Marrupa', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nungo', NULL, NULL, 'Marrupa', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Maua', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Maiaca', NULL, NULL, 'Maua', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Maua', NULL, NULL, 'Maua', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Mavago', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'M''Sawize', NULL, NULL, 'Mavago', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mavago', NULL, NULL, 'Mavago', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Mecanhelas', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiuta', NULL, NULL, 'Mecanhelas', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Insaca', NULL, NULL, 'Mecanhelas', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Mecufi', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mecufi', NULL, NULL, 'Mecufi', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Murrebue', NULL, NULL, 'Mecufi', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Mecula', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Matondovela', NULL, NULL, 'Mecula', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mecula', NULL, NULL, 'Mecula', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Meluco', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Meluco', NULL, NULL, 'Meluco', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muaguide', NULL, NULL, 'Meluco', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Metarica', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metarica', NULL, NULL, 'Metarica', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nacumua', NULL, NULL, 'Metarica', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Mocimboa da Praia', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Diaca', NULL, NULL, 'Mocimboa da Praia', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mbau', NULL, NULL, 'Mocimboa da Praia', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mocimboa da Praia', NULL, NULL, 'Mocimboa da Praia', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Montepuez', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mapupulo', NULL, NULL, 'Montepuez', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mirate', NULL, NULL, 'Montepuez', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Montepuez', NULL, NULL, 'Montepuez', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nairoto', NULL, NULL, 'Montepuez', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Namanhumbir', NULL, NULL, 'Montepuez', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Mueda', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chapa', NULL, NULL, 'Mueda', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Imbuo', NULL, NULL, 'Mueda', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mueda', NULL, NULL, 'Mueda', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'N''Gapa', NULL, NULL, 'Mueda', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Negomano', NULL, NULL, 'Mueda', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Muembe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiconono', NULL, NULL, 'Muembe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muembe', NULL, NULL, 'Muembe', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Muidumbe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chitunda', NULL, NULL, 'Muidumbe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Miteda', NULL, NULL, 'Muidumbe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muidumbe', NULL, NULL, 'Muidumbe', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Namuno', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Hucula', NULL, NULL, 'Namuno', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Machoca', NULL, NULL, 'Namuno', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Meloco', NULL, NULL, 'Namuno', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'N''Cumpe', NULL, NULL, 'Namuno', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Namuno', NULL, NULL, 'Namuno', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Papai', NULL, NULL, 'Namuno', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Nangade', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'M''Tamba', NULL, NULL, 'Nangade', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nangade', NULL, NULL, 'Nangade', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Ngauma', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Itepela', NULL, NULL, 'Ngauma', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Massangulo', NULL, NULL, 'Ngauma', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Nipepe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muipite', NULL, NULL, 'Nipepe', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nipepe', NULL, NULL, 'Nipepe', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Palma', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Olumbi', NULL, NULL, 'Palma', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Palma', NULL, NULL, 'Palma', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Pundanhar', NULL, NULL, 'Palma', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quionga', NULL, NULL, 'Palma', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Pemba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metuge', NULL, NULL, 'Pemba', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mieze', NULL, NULL, 'Pemba', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Quissanga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Bilibiza', NULL, NULL, 'Quissanga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mahate', NULL, NULL, 'Quissanga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quissanga', NULL, NULL, 'Quissanga', NULL);

INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, '0', 'Sanga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Lussimbesse', NULL, NULL, 'Sanga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Macaloge', NULL, NULL, 'Sanga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Matchedje', NULL, NULL, 'Sanga', NULL);
INSERT INTO domains.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Unango', NULL, NULL, 'Sanga', NULL);


INSERT INTO domains.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Cabo Delgado', NULL, NULL, NULL, NULL);
INSERT INTO domains.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Niassa', NULL, NULL, NULL, NULL);


INSERT INTO domains.rega_tipo (category, key, value, ordering, parent, tooltip) VALUES ('rega_tipo', NULL, NULL, '0', NULL, NULL);
INSERT INTO domains.rega_tipo (category, key, value, ordering, parent, tooltip) VALUES ('rega_tipo', 'Asperção', NULL, NULL, NULL, NULL);
INSERT INTO domains.rega_tipo (category, key, value, ordering, parent, tooltip) VALUES ('rega_tipo', 'Goteo', NULL, NULL, NULL, NULL);
INSERT INTO domains.rega_tipo (category, key, value, ordering, parent, tooltip) VALUES ('rega_tipo', 'Gravidade', NULL, NULL, NULL, NULL);
INSERT INTO domains.rega_tipo (category, key, value, ordering, parent, tooltip) VALUES ('rega_tipo', 'Regional', NULL, NULL, NULL, NULL);

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, '0', 'Megaruma', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Megaruma', NULL, NULL, 'Megaruma', NULL);

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, '0', 'Messalo', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Messalo', NULL, NULL, 'Messalo', NULL);

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, '0', 'Montepuez', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Montepuez', NULL, NULL, 'Montepuez', NULL);

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, '0', 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Meapia', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Metava', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Metori', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Miezi', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Miruco', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muaguide', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muizi', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Ridi', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N OM1', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Tara-Quilite', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Tari', NULL, NULL, 'Orla Marítima 1', NULL);

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, '0', 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Buizili', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Chafi', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Diquide', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Messingue', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muacamula', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muembe-Nanomo', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muenha', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Necumbi', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N OM2', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Sicoro/Lingula', NULL, NULL, 'Orla Marítima 2', NULL);

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, '0', 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Bundaze-Monga', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Calundi/Uncudi', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Macanga', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Mecumbi', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Mepuira', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Meranvi', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Mipama', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Nango/Mepuira', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Quigode', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Quinhevo', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N OM3', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Sinheu/Mutamba', NULL, NULL, 'Orla Marítima 3', NULL);

INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, '0', 'Rovuma', NULL);
INSERT INTO domains.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Rovuma', NULL, NULL, 'Rovuma', NULL);



COMMIT;
