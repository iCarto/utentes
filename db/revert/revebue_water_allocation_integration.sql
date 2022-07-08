-- Revert utentes:revebue_water_allocation_integration from pg

BEGIN;

DROP VIEW integrations.water_allocation_revubue;
DROP SCHEMA integrations;

DROP USER revubue;

REVOKE ALL ON SCHEMA PUBLIC FROM integrations_role;
REVOKE ALL ON public.spatial_ref_sys FROM integrations_role;
DROP ROLE integrations_role;

COMMIT;
