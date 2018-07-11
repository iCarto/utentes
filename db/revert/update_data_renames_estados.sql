-- Revert utentes:update_data_renames_estados from pg

BEGIN;

update domains.licencia_estado SET key = replace(key, 'DA', 'D. Adm') where key like '%DA%';
update domains.licencia_estado SET key = replace(key, 'DJ', 'D. Jur') where key like '%DJ%';
update domains.licencia_estado SET key = replace(key, 'DT', 'R. Cad DT') where key like '%DT%';
update domains.licencia_estado SET key = replace(key, 'DF', 'D. Fin') where key like '%DF%';


update utentes.exploracaos set req_obs = replace(req_obs::text, 'DA', 'D. Adm')::jsonb where req_obs::text like '%DA%';
update utentes.exploracaos set req_obs = replace(req_obs::text, 'DJ', 'D. Jur')::jsonb where req_obs::text like '%DJ%';
update utentes.exploracaos set req_obs = replace(req_obs::text, 'DT', 'R. Cad DT')::jsonb where req_obs::text like '%DT%';
update utentes.exploracaos set req_obs = replace(req_obs::text, 'DF', 'D. Fin')::jsonb where req_obs::text like '%DF%';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
