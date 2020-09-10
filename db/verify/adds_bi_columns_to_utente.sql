-- Verify utentes:adds_bi_columns_to_utente on pg

BEGIN;

SELECT bi_di_pas, bi_d_emis, bi_l_emis FROM utentes.utentes WHERE false;

ROLLBACK;
