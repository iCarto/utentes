-- Revert utentes:modify_values_of_domain_tip_barra from pg

BEGIN;

UPDATE inventario_dominios.tip_barra SET key = 'Açude' WHERE key = 'Minibarragem';
UPDATE inventario_dominios.tip_barra SET key = 'Reserv. Esc' WHERE key = 'Microbarragem';

COMMIT;
