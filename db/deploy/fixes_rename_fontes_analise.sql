-- Deploy utentes:fixes_rename_fontes_analise to pg

BEGIN;

ALTER SEQUENCE inventario.analise_gid_seq RENAME TO fontes_analise_gid_seq;
ALTER INDEX inventario.analise_pkey RENAME TO fontes_analise_pkey;
ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT analise_c_nitrat_fkey TO fontes_analise_c_nitrat_fkey;

ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT analise_c_nitrit_fkey TO fontes_analise_c_nitrit_fkey;
ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT analise_cod_fonte_fkey TO fontes_analise_cod_fonte_fkey;
ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT analise_cond_most_fkey TO fontes_analise_cond_most_fkey;

COMMIT;
