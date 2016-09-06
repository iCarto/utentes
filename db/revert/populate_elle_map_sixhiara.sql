-- Revert sixhiara:populate_elle_data from pg

BEGIN;

DELETE FROM elle._map;
DELETE FROM elle._map_overview;
DELETE FROM elle._map_style;
DELETE FROM elle._map_overview_style;

COMMIT;
