-- Verify sixhiara:create_table_exploracaos on pg

BEGIN;

SELECT gid, exp_name, exp_id, d_soli, loc_provin, loc_distri, loc_post, loc_nucleo, loc_endere, loc_bacia, rio, utente, uten_nuit, abastecem,  saneament, agricultu, pecuaria, piscicult, industria, pro_energ, tipo_subt, tipo_supe, con_l_su, con_l_sb, con_l_to, est_l_su, est_l_sb, pagamento, observacio, geom
FROM inventario.exploracaos
WHERE false;

ROLLBACK;
