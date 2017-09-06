-- Revert utentes:drop_trigger_calculate_area_exploracao from pg

BEGIN;

-- We don't want to restore the triggers here

COMMIT;
