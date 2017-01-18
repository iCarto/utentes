-- Deploy utentes:update_domains_licencia_estado_inserts_and_renames to pg

BEGIN;

UPDATE domains.licencia_estado SET ordering = ordering + 1 WHERE ordering >= 5;
UPDATE domains.licencia_estado SET ordering = ordering + 1 WHERE ordering >= 8;

UPDATE domains.licencia_estado SET key = 'Não aprovada' WHERE key = 'Denegada';
UPDATE domains.licencia_estado SET key = 'Pendente de aprovação tecnica (R. Cadastro)' WHERE key = 'Pendente aprobação tecnica (D. Cadastro)';
UPDATE domains.licencia_estado SET key = 'Pendente da emisão (D. Jurídico)' WHERE key = 'Pendente emisão (D. Jurídico)';
UPDATE domains.licencia_estado SET key = 'Pendente da firma (Direcção)' WHERE key = 'Pendente firma (Direcção)';
UPDATE domains.licencia_estado SET key = 'Pendente de revisão da solicitação (D. Jurídico)' WHERE key = 'Pendente revisão solicitação (D. Jurídico)';
UPDATE domains.licencia_estado SET key = 'Pendente de revisão da solicitação (Direcção)' WHERE key = 'Pendente revisão solicitação (Direcção)';
UPDATE domains.licencia_estado SET key = 'Pendente de solicitação do utente' WHERE key = 'Pendente solicitação utente';


INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente de aprovação tecnica (Chefe DT)', NULL, 8, NULL, 'Avaliação técnica e entrevista realizada. Pendente revisão e aprovação pelo chefe do Departamento Técnico');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente de revisão da solicitação (Chefe DT)', NULL, 5, NULL, 'O utente tem entregado a solicitação. Pendente de revisão pelo chefe do Departamento Técnico');



COMMIT;
