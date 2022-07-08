-- Verify utentes:alter_table_fontes_analise_remove_fonte_rename_comen_lab on pg

BEGIN;

SELECT obser_lab FROM inventario.fontes_analise WHERE FALSE;

ROLLBACK;
