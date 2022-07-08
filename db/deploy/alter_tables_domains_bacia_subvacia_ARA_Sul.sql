-- Deploy utentes:alter_tables_domains_bacia_subvacia_ARA_Sul to pg
BEGIN;

DELETE FROM domains.bacia WHERE app = '{Sul}';
DELETE FROM domains.subacia WHERE app = '{Sul}';

INSERT INTO domains.bacia (category, key, ordering, parent, app) VALUES
('bacia', null, 0, 'UGBI', '{Sul}'),
('bacia', null, 0, 'UGBL', '{Sul}'),
('bacia', null, 0, 'UGBS', '{Sul}'),
('bacia', null, 0, 'UGBU', '{Sul}');

INSERT INTO domains.bacia (category, key, parent, app) VALUES
('bacia', 'Incomati', 'UGBI', '{Sul}'),
('bacia', 'Limpopo', 'UGBL', '{Sul}'),
('bacia', 'Chiendsele', 'UGBS', '{Sul}'),
('bacia', 'Das Pedras', 'UGBS', '{Sul}'),
('bacia', 'Davetave', 'UGBS', '{Sul}'),
('bacia', 'Govuro', 'UGBS', '{Sul}'),
('bacia', 'Inhanombe', 'UGBS', '{Sul}'),
('bacia', 'Inharrime', 'UGBS', '{Sul}'),
('bacia', 'Inhavumalala', 'UGBS', '{Sul}'),
('bacia', 'Maducha', 'UGBS', '{Sul}'),
('bacia', 'Mucambe', 'UGBS', '{Sul}'),
('bacia', 'Mulalace', 'UGBS', '{Sul}'),
('bacia', 'Mutamba', 'UGBS', '{Sul}'),
('bacia', 'Nhametando', 'UGBS', '{Sul}'),
('bacia', 'Panga', 'UGBS', '{Sul}'),
('bacia', 'Save', 'UGBS', '{Sul}'),
('bacia', 'Sem identificar', 'UGBS', '{Sul}'),
('bacia', 'Bacias costeiras', 'UGBS', '{Sul}'),
('bacia', 'Bacias endorreicas', 'UGBS', '{Sul}'),
('bacia', 'Umbelúzi', 'UGBU', '{Sul}'),
('bacia', 'Fúti', 'UGBU', '{Sul}'),
('bacia', 'Maputo', 'UGBU', '{Sul}'),
('bacia', 'Matola', 'UGBU', '{Sul}'),
('bacia', 'Tembe', 'UGBU', '{Sul}'),
('bacia', 'Sem identificar', 'UGBU', '{Sul}'),
('bacia', 'Bacias costeiras', 'UGBU', '{Sul}');

INSERT INTO domains.subacia (category, key, ordering, parent, app) VALUES
('subacia', null, 0, 'Incomati', '{Sul}'),
('subacia', null, 0, 'Limpopo', '{Sul}'),
('subacia', null, 0, 'Chiendsele', '{Sul}'),
('subacia', null, 0, 'Das Pedras', '{Sul}'),
('subacia', null, 0, 'Davetave', '{Sul}'),
('subacia', null, 0, 'Govuro', '{Sul}'),
('subacia', null, 0, 'Inhanombe', '{Sul}'),
('subacia', null, 0, 'Inharrime', '{Sul}'),
('subacia', null, 0, 'Inhavumalala', '{Sul}'),
('subacia', null, 0, 'Maducha', '{Sul}'),
('subacia', null, 0, 'Mucambe', '{Sul}'),
('subacia', null, 0, 'Mulalace', '{Sul}'),
('subacia', null, 0, 'Mutamba', '{Sul}'),
('subacia', null, 0, 'Nhametando', '{Sul}'),
('subacia', null, 0, 'Panga', '{Sul}'),
('subacia', null, 0, 'Save', '{Sul}'),
('subacia', null, 0, 'Sem identificar', '{Sul}'),
('subacia', null, 0, 'Bacias costeiras', '{Sul}'),
('subacia', null, 0, 'Bacias endorreicas', '{Sul}'),
('subacia', null, 0, 'Umbelúzi', '{Sul}'),
('subacia', null, 0, 'Fúti', '{Sul}'),
('subacia', null, 0, 'Maputo', '{Sul}'),
('subacia', null, 0, 'Matola', '{Sul}'),
('subacia', null, 0, 'Tembe', '{Sul}'),
('subacia', null, 0, 'Sem identificar', '{Sul}'),
('subacia', null, 0, 'Bacias costeiras', '{Sul}');

INSERT INTO domains.subacia (category, key, parent, app) VALUES
('subacia', 'Incomati', 'Incomati', '{Sul}'),
('subacia', 'Limpopo', 'Limpopo', '{Sul}'),
('subacia', 'Chiendsele', 'Chiendsele', '{Sul}'),
('subacia', 'Das Pedras', 'Das Pedras', '{Sul}'),
('subacia', 'Davetave', 'Davetave', '{Sul}'),
('subacia', 'Govuro', 'Govuro', '{Sul}'),
('subacia', 'Inhanombe', 'Inhanombe', '{Sul}'),
('subacia', 'Inharrime', 'Inharrime', '{Sul}'),
('subacia', 'Inhavumalala', 'Inhavumalala', '{Sul}'),
('subacia', 'Maducha', 'Maducha', '{Sul}'),
('subacia', 'Mucambe', 'Mucambe', '{Sul}'),
('subacia', 'Mulalace', 'Mulalace', '{Sul}'),
('subacia', 'Mutamba', 'Mutamba', '{Sul}'),
('subacia', 'Nhametando', 'Nhametando', '{Sul}'),
('subacia', 'Panga', 'Panga', '{Sul}'),
('subacia', 'Save', 'Save', '{Sul}'),
('subacia', 'Sem identificar', 'Sem identificar', '{Sul}'),
('subacia', 'Bacias endorreicas', 'Bacias endorreicas', '{Sul}'),
('subacia', 'Umbelúzi', 'Umbelúzi', '{Sul}'),
('subacia', 'Fúti', 'Fúti', '{Sul}'),
('subacia', 'Maputo', 'Maputo', '{Sul}'),
('subacia', 'Matola', 'Matola', '{Sul}'),
('subacia', 'Tembe', 'Tembe', '{Sul}'),
('subacia', 'Bacias costeiras', 'Bacias costeiras', '{Sul}');

COMMIT;
