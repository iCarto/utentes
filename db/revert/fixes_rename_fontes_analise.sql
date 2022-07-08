-- Revert utentes:fixes_rename_fontes_analise from pg

BEGIN;

ALTER SEQUENCE inventario.fontes_analise_gid_seq RENAME TO analise_gid_seq;
ALTER INDEX inventario.fontes_analise_pkey RENAME TO analise_pkey;
ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT fontes_analise_c_nitrat_fkey TO analise_c_nitrat_fkey;
ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT fontes_analise_c_nitrit_fkey TO analise_c_nitrit_fkey;
ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT fontes_analise_cod_fonte_fkey TO analise_cod_fonte_fkey;
ALTER TABLE inventario.fontes_analise RENAME CONSTRAINT fontes_analise_cond_most_fkey TO analise_cond_most_fkey;

COMMIT;
