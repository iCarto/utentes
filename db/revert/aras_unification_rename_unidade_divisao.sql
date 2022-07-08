-- Revert utentes:aras_unification_rename_unidade_divisao from pg

BEGIN;

ALTER TABLE domains.divisao ALTER COLUMN category SET DEFAULT 'unidade';
UPDATE domains.divisao SET category = 'unidade';

ALTER INDEX cbase.divisoes_pkey RENAME TO unidades_pkey;
ALTER INDEX cbase.divisoes_geom_idx RENAME TO unidades_geom_idx;

ALTER INDEX cbase_ara.divisoes_pkey RENAME TO unidades_pkey;
ALTER INDEX cbase_ara.divisoes_geom_idx RENAME TO unidades_geom_idx;

ALTER INDEX domains.divisao_key_key RENAME TO unidade_key_key;
ALTER INDEX inventario_dominios. divisao_key_key RENAME TO unidade_key_key;


ALTER TABLE cbase_ara.divisoes RENAME CONSTRAINT divisoes_gid_fkey TO unidades_gid_fkey;
ALTER TABLE inventario.fontes RENAME CONSTRAINT fontes_loc_divisao_fkey TO fontes_loc_unidad_fkey;
ALTER TABLE utentes.documentos RENAME CONSTRAINT documentos_divisao_fkey TO documentos_unidade_fkey;
ALTER TABLE utentes.exploracaos RENAME CONSTRAINT exploracaos_loc_divisao_fkey TO exploracaos_loc_unidad_fkey;
ALTER TABLE utentes.users RENAME CONSTRAINT users_divisao_fkey TO users_unidade_fkey;


ALTER TABLE cbase.bacias RENAME COLUMN divisao TO unidade;
ALTER TABLE cbase_ara.bacias RENAME COLUMN divisao TO unidade;
ALTER TABLE domains.datos_aras RENAME COLUMN divisoes TO unidades;
ALTER TABLE inventario.fontes RENAME COLUMN loc_divisao TO loc_unidad;
ALTER TABLE utentes.documentos RENAME COLUMN divisao TO unidade;
ALTER TABLE utentes.exploracaos RENAME COLUMN loc_divisao TO loc_unidad;
ALTER TABLE utentes.exploracaos RENAME COLUMN parecer_divisao TO p_unid;
ALTER TABLE utentes.users RENAME COLUMN divisao TO unidade;
ALTER TABLE utentes.renovacoes RENAME COLUMN parecer_divisao TO p_unid;

ALTER TABLE cbase.divisoes RENAME TO unidades;
ALTER TABLE cbase_ara.divisoes RENAME TO unidades;
ALTER TABLE domains.divisao RENAME TO unidade;
ALTER TABLE inventario_dominios.divisao RENAME TO unidade;

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
