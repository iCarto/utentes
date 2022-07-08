-- Deploy utentes:update_domains_licencia_estado_inserts_and_renames to pg

BEGIN;

UPDATE domains.licencia_estado SET ordering = ordering + 1 WHERE ordering >= 5;
UPDATE domains.licencia_estado SET ordering = ordering + 1 WHERE ordering >= 8;
UPDATE domains.licencia_estado SET ordering = ordering - 1 WHERE ordering >= 10;


UPDATE domains.licencia_estado SET key = 'Não aprovada' WHERE key = 'Denegada';
UPDATE domains.licencia_estado SET key = 'Pendente de aprovação técnica (R. Cadastro)' WHERE key = 'Pendente aprobação tecnica (D. Cadastro)';
UPDATE domains.licencia_estado SET key = 'Pendente da emisão (D. Jurídico)' WHERE key = 'Pendente emisão (D. Jurídico)';
UPDATE domains.licencia_estado SET key = 'Pendente da firma (Direcção)' WHERE key = 'Pendente firma (Direcção)';
UPDATE domains.licencia_estado SET key = 'Pendente de revisão da solicitação (D. Jurídico)' WHERE key = 'Pendente revisão solicitação (D. Jurídico)';
UPDATE domains.licencia_estado SET key = 'Pendente de revisão da solicitação (Direcção)' WHERE key = 'Pendente revisão solicitação (Direcção)';
UPDATE domains.licencia_estado SET key = 'Pendente de solicitação do utente' WHERE key = 'Pendente solicitação utente';


INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente de aprovação técnica (Chefe DT)', NULL, 8, NULL, 'Avaliação técnica e entrevista realizada. Pendente revisão e aprovação pelo chefe do Departamento Técnico');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip) VALUES ('licencia_estado', 'Pendente de revisão da solicitação (Chefe DT)', NULL, 5, NULL, 'O utente tem entregado a solicitação. Pendente de revisão pelo chefe do Departamento Técnico');

UPDATE domains.licencia_estado SET tooltip = 'Pendente que os técnicos do departamento de cadastro saiam a terreno a realizar a avaliação técnica e entrevista com o utente' WHERE key = 'Pendente de aprovação técnica (R. Cadastro)';
UPDATE domains.licencia_estado SET tooltip = 'Pendente de revisão e emissão da licença pelo departamento jurídico' WHERE key = 'Pendente da emisão (D. Jurídico)';
UPDATE domains.licencia_estado SET tooltip = 'Licença emitida. Pendente da revisão e assinatura de direcção para sua aprovação definitiva.' WHERE key = 'Pendente da firma (Direcção)';
UPDATE domains.licencia_estado SET tooltip = 'O utente tem entregado a solicitação. Pendente de revisão pelo departamento jurídico' WHERE key = 'Pendente de revisão da solicitação (D. Jurídico)';
UPDATE domains.licencia_estado SET tooltip = 'O utente tem entregado a solicitação. Pendente de revisão pelo chefe do Departamento Técnico' WHERE key = 'Pendente de revisão da solicitação (Chefe DT)';
UPDATE domains.licencia_estado SET tooltip = 'O utente tem entregado a solicitação. Pendente de revisão por direcção' WHERE key = 'Pendente de revisão da solicitação (Direcção)';
UPDATE domains.licencia_estado SET tooltip = 'O utente ainda não tem entregado a carta de solicitação' WHERE key = 'Pendente de solicitação do utente';


UPDATE utentes.licencias SET estado = 'Pendente de aprovação técnica (Chefe DT)' WHERE estado = 'Pendente aprobação tecnica (Dirección)';
DELETE FROM domains.licencia_estado WHERE key = 'Pendente aprobação tecnica (Dirección)';


COMMIT;
