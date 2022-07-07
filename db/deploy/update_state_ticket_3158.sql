-- Deploy utentes:update_state_ticket_3158 to pg

BEGIN;

UPDATE utentes.licencias SET estado = 'Pendente Parecer Técnico (DRH)' WHERE estado = 'Pendente Emissão Licença (DSU-J)';
UPDATE utentes.exploracaos SET estado_lic = 'Pendente Parecer Técnico (DRH)' WHERE estado_lic = 'Pendente Emissão Licença (DSU-J)';

COMMIT;
