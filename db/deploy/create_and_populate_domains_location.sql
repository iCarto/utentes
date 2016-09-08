-- Deploy sixhiara:create_and_populate_domains_location to pg

BEGIN;

CREATE TABLE inventario_dominios.bacia (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- GRANT SELECT ON inventario_dominios.bacia TO inventario_read;


-- INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', NULL, NULL, 0, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Megaruma', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Messalo', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Montepuez', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Orla Marítima 1', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Orla Marítima 2', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Orla Marítima 3', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.bacia (category, key, value, ordering, parent, tooltip) VALUES ('bacia', 'Rovuma', NULL, NULL, NULL, NULL);


CREATE TABLE inventario_dominios.distrito (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    UNIQUE (key, parent)
);
-- GRANT SELECT ON inventario_dominios.distrito TO inventario_read;

-- INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', NULL, NULL, 0, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Ancuabe', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Balama', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Chiure', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Pemba', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Ibo', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Macomia', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mecufi', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Meluco', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mocimboa da Praia', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Montepuez', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mueda', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Muidumbe', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Namuno', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Nangade', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Palma', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Pemba', NULL, NULL, 'Cabo Delgado', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Quissanga', NULL, NULL, 'Cabo Delgado', NULL);
-- INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', NULL, NULL, 0, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cidade de Lichinga', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Cuamba', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Lago', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Lichinga', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Majune', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mandimba', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Marrupa', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Maua', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mavago', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mecanhelas', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Mecula', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Metarica', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Muembe', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Ngauma', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Nipepe', NULL, NULL, 'Niassa', NULL);
INSERT INTO inventario_dominios.distrito (category, key, value, ordering, parent, tooltip) VALUES ('distrito', 'Sanga', NULL, NULL, 'Niassa', NULL);


CREATE TABLE inventario_dominios.posto (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    UNIQUE (key, parent)
);
-- GRANT SELECT ON inventario_dominios.posto TO inventario_read;

-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Ancuabe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ancuabe', NULL, NULL, 'Ancuabe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mesa', NULL, NULL, 'Ancuabe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metoro', NULL, NULL, 'Ancuabe', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Balama', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Balama', NULL, NULL, 'Balama', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Impiri', NULL, NULL, 'Balama', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Kuekue', NULL, NULL, 'Balama', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mavala', NULL, NULL, 'Balama', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Chiure', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiure', NULL, NULL, 'Chiure', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiure Velho', NULL, NULL, 'Chiure', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Katapua', NULL, NULL, 'Chiure', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mazeze', NULL, NULL, 'Chiure', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Namogelia', NULL, NULL, 'Chiure', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ocua', NULL, NULL, 'Chiure', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Cidade de Lichinga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Lichinga', NULL, NULL, 'Cidade de Lichinga', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Cidade de Pemba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cidade de Pemba', NULL, NULL, 'Cidade de Pemba', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Cuamba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cuamba', NULL, NULL, 'Cuamba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Etarara', NULL, NULL, 'Cuamba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Lurio', NULL, NULL, 'Cuamba', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Ibo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Ibo', NULL, NULL, 'Ibo', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quirimba', NULL, NULL, 'Ibo', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Lago', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Cobue', NULL, NULL, 'Lago', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Luhno', NULL, NULL, 'Lago', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Maniamba', NULL, NULL, 'Lago', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metangula', NULL, NULL, 'Lago', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Lichinga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chimbonila', NULL, NULL, 'Lichinga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Lione', NULL, NULL, 'Lichinga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Meponda', NULL, NULL, 'Lichinga', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Macomia', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chai', NULL, NULL, 'Macomia', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Macomia', NULL, NULL, 'Macomia', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mucojo', NULL, NULL, 'Macomia', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quiterajo', NULL, NULL, 'Macomia', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Majune', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Malanga', NULL, NULL, 'Majune', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muaquia', NULL, NULL, 'Majune', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nairrubi', NULL, NULL, 'Majune', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Mandimba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mandimba', NULL, NULL, 'Mandimba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mitande', NULL, NULL, 'Mandimba', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Marrupa', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Marangira', NULL, NULL, 'Marrupa', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Marrupa', NULL, NULL, 'Marrupa', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nungo', NULL, NULL, 'Marrupa', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Maua', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Maiaca', NULL, NULL, 'Maua', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Maua', NULL, NULL, 'Maua', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Mavago', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'M''Sawize', NULL, NULL, 'Mavago', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mavago', NULL, NULL, 'Mavago', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Mecanhelas', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiuta', NULL, NULL, 'Mecanhelas', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Insaca', NULL, NULL, 'Mecanhelas', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Mecufi', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mecufi', NULL, NULL, 'Mecufi', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Murrebue', NULL, NULL, 'Mecufi', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Mecula', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Matondovela', NULL, NULL, 'Mecula', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mecula', NULL, NULL, 'Mecula', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Meluco', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Meluco', NULL, NULL, 'Meluco', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muaguide', NULL, NULL, 'Meluco', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Metarica', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metarica', NULL, NULL, 'Metarica', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nacumua', NULL, NULL, 'Metarica', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Mocimboa da Praia', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Diaca', NULL, NULL, 'Mocimboa da Praia', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mbau', NULL, NULL, 'Mocimboa da Praia', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mocimboa da Praia', NULL, NULL, 'Mocimboa da Praia', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Montepuez', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mapupulo', NULL, NULL, 'Montepuez', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mirate', NULL, NULL, 'Montepuez', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Montepuez', NULL, NULL, 'Montepuez', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nairoto', NULL, NULL, 'Montepuez', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Namanhumbir', NULL, NULL, 'Montepuez', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Mueda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chapa', NULL, NULL, 'Mueda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Imbuo', NULL, NULL, 'Mueda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mueda', NULL, NULL, 'Mueda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'N''Gapa', NULL, NULL, 'Mueda', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Negomano', NULL, NULL, 'Mueda', NULL);
-- INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Muembe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chiconono', NULL, NULL, 'Muembe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muembe', NULL, NULL, 'Muembe', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Muidumbe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Chitunda', NULL, NULL, 'Muidumbe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Miteda', NULL, NULL, 'Muidumbe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muidumbe', NULL, NULL, 'Muidumbe', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Namuno', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Hucula', NULL, NULL, 'Namuno', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Machoca', NULL, NULL, 'Namuno', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Meloco', NULL, NULL, 'Namuno', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'N''Cumpe', NULL, NULL, 'Namuno', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Namuno', NULL, NULL, 'Namuno', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Papai', NULL, NULL, 'Namuno', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Nangade', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'M''Tamba', NULL, NULL, 'Nangade', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nangade', NULL, NULL, 'Nangade', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Ngauma', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Itepela', NULL, NULL, 'Ngauma', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Massangulo', NULL, NULL, 'Ngauma', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Nipepe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Muipite', NULL, NULL, 'Nipepe', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Nipepe', NULL, NULL, 'Nipepe', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Palma', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Olumbi', NULL, NULL, 'Palma', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Palma', NULL, NULL, 'Palma', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Pundanhar', NULL, NULL, 'Palma', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quionga', NULL, NULL, 'Palma', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Pemba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Metuge', NULL, NULL, 'Pemba', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mieze', NULL, NULL, 'Pemba', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Quissanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Bilibiza', NULL, NULL, 'Quissanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Mahate', NULL, NULL, 'Quissanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Quissanga', NULL, NULL, 'Quissanga', NULL);
--INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', NULL, NULL, 0, 'Sanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Lussimbesse', NULL, NULL, 'Sanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Macaloge', NULL, NULL, 'Sanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Matchedje', NULL, NULL, 'Sanga', NULL);
INSERT INTO inventario_dominios.posto (category, key, value, ordering, parent, tooltip) VALUES ('posto', 'Unango', NULL, NULL, 'Sanga', NULL);

CREATE TABLE inventario_dominios.provincia (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- GRANT SELECT ON inventario_dominios.provincia TO inventario_read;

-- INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', NULL, NULL, 0, NULL, NULL);
INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Cabo Delgado', NULL, NULL, NULL, NULL);
INSERT INTO inventario_dominios.provincia (category, key, value, ordering, parent, tooltip) VALUES ('provincia', 'Niassa', NULL, NULL, NULL, NULL);

CREATE TABLE inventario_dominios.subacia (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    UNIQUE (key, parent)
);
-- GRANT SELECT ON inventario_dominios.subacia TO inventario_read;

-- INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, 0, 'Megaruma', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Megaruma', NULL, NULL, 'Megaruma', NULL);
-- INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, 0, 'Messalo', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Messalo', NULL, NULL, 'Messalo', NULL);
-- INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, 0, 'Montepuez', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Montepuez', NULL, NULL, 'Montepuez', NULL);
-- INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, 0, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Meapia', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Metava', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Metori', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Miezi', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Miruco', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muaguide', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muizi', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Ridi', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N OM1', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Tara-Quilite', NULL, NULL, 'Orla Marítima 1', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Tari', NULL, NULL, 'Orla Marítima 1', NULL);
--INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, 0, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Buizili', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Chafi', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Diquide', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Messingue', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muacamula', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muembe-Nanomo', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Muenha', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Necumbi', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N OM2', NULL, NULL, 'Orla Marítima 2', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Sicoro/Lingula', NULL, NULL, 'Orla Marítima 2', NULL);
--INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, 0, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Bundaze-Monga', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Calundi/Uncudi', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Macanga', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Mecumbi', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Mepuira', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Meranvi', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Mipama', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Nango/Mepuira', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Quigode', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Quinhevo', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'S/N OM3', NULL, NULL, 'Orla Marítima 3', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Sinheu/Mutamba', NULL, NULL, 'Orla Marítima 3', NULL);
--INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', NULL, NULL, 0, 'Rovuma', NULL);
INSERT INTO inventario_dominios.subacia (category, key, value, ordering, parent, tooltip) VALUES ('subacia', 'Rovuma', NULL, NULL, 'Rovuma', NULL);

COMMIT;
