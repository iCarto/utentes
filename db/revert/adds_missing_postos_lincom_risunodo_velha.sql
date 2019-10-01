-- Revert utentes:adds_missing_postos_lincom_risunodo_velha from pg

BEGIN;

DELETE FROM cbase.postos WHERE nome IN ('Ilha Licom', 'Ilha Risunodo');
DELETE FROM cbase_ara.postos WHERE nome IN ('Ilha Licom', 'Ilha Risunodo');
DELETE FROM inventario_dominios.posto WHERE key IN ('Ilha Licom', 'Ilha Risunodo');
DELETE FROM domains.postos WHERE key IN ('Ilha Licom', 'Ilha Risunodo');

UPDATE cbase.postos SET loc_distri = 'Nacala-A-Velha' WHERE loc_distri = 'Nacala A Velha';
UPDATE cbase_ara.postos SET loc_distri = 'Nacala-A-Velha' WHERE loc_distri = 'Nacala A Velha';
UPDATE domains.posto SET parent = 'Nacala-A-Velha' WHERE parent = 'Nacala A Velha';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
