-- Revert sixhiara:populate_elle_map_todas from pg

BEGIN;

DELETE FROM elle._map WHERE mapa = 'TODAS';
DELETE FROM elle._map_style WHERE nombre_estilo = 'TODAS';

COMMIT;
