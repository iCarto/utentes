-- Revert utentes:changes_in_departaments_perms_and_names from pg

BEGIN;

ALTER TABLE utentes.documentos DROP CONSTRAINT documentos_departamento_fkey;
UPDATE domains.groups SET (key, value) = ('D. Administrativo', null) WHERE key = 'Departamento Administrativo';
UPDATE domains.groups SET (key, value) = ('Direcção', null) WHERE key = 'Direcção';
UPDATE domains.groups SET (key, value) = ('D. Financeiro', null) WHERE key = 'Departamento Financeiro';
UPDATE domains.groups SET (key, value) = ('D. Jurídico', null) WHERE key = 'Departamento Jurídico';
UPDATE domains.groups SET (key, value) = ('D. Técnico', null) WHERE key = 'Departamento Técnico';

-- DROP SCHEMA users;

COMMIT;
