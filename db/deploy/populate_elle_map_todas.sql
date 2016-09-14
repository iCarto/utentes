-- Deploy sixhiara:populate_elle_map_todas to pg

BEGIN;
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'zp_nascentes', 'zp_nascentes', 0, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'zp_fontes', 'zp_fontes', 1, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'zp_costa', 'zp_costa', 2, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'zp_albufeiras', 'zp_albufeiras', 3, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'usos_da_terra', 'usos_da_terra', 4, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'solos', 'solos', 5, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'rios', 'rios', 7, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'reserva_zona_tampao', 'reserva_zona_tampao', 8, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'rejilla_50000', 'rejilla_50000', 9, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'rejilla_350000', 'rejilla_350000', 10, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'provincia', 'provincia', 11, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'provinces', 'provinces', 12, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'postos_administrativos', 'postos_administrativos', 13, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'pontos_vertido', 'pontos_vertido', 14, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'piezometria', 'piezometria', 15, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'paises_limitrofes', 'paises_limitrofes', 16, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'lixeira', 'lixeira', 17, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'litologia', 'litologia', 18, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'lagos_embalses', 'lagos_embalses', 19, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'industrias', 'industrias', 20, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'industria_agro_pecuarias_menor', 'industria_agro_pecuarias_menor', 21, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'industria_agro_pecuarias', 'industria_agro_pecuarias', 22, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'hoteis', 'hoteis', 23, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'grandes_lagos', 'grandes_lagos', 24, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'geomorfologia_mzq', 'geomorfologia_mzq', 25, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'geomorfologia250_lbrn_cd', 'geomorfologia250_lbrn_cd', 26, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'geologia250_lbrn_cd', 'geologia250_lbrn_cd', 27, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'fontes_proteccao', 'fontes_proteccao', 28, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'fontes_analiticas_2014', 'fontes_analiticas_2014', 29, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'fontes_analiticas_2012', 'fontes_analiticas_2012', 30, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'fontes_analiticas', 'fontes_analiticas', 31, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'fontes', 'fontes', 32, true, NULL, NULL, NULL, 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'exploracoes', 'exploracoes', 33, true, NULL, NULL, NULL, 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'estradas', 'estradas', 34, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'estacoes_evaporacion', 'estacoes_evaporacion', 35, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'estacoes', 'estacoes', 36, true, NULL, NULL, NULL, 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'elevaciones', 'elevaciones', 37, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'distritos', 'distritos', 38, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'curvas_nivel_10m', 'curvas_nivel_10m', 39, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'concessoes_florestais', 'concessoes_florestais', 40, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'comunicaciones', 'comunicaciones', 41, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'cidades_vilas', 'cidades_vilas', 42, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'centros_saude', 'centros_saude', 43, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'centro_educacional', 'centro_educacional', 44, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'cemiterios', 'cemiterios', 45, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'bombas_combustivel', 'bombas_combustivel', 46, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'batimetria', 'batimetria', 47, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'barragens', 'barragens', 48, true, NULL, NULL, NULL, 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'bacias', 'bacias', 49, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'areas_exploracao_petroleo_gas', 'areas_exploracao_petroleo_gas', 50, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'areas_exploracao_mineira', 'areas_exploracao_mineira', 51, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'areas_conservacao', 'areas_conservacao', 52, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'aras', 'aras', 53, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'aldeias', 'aldeias', 54, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'albufeiras', 'albufeiras', 55, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'acuiferos_base', 'acuiferos_base', 56, true, NULL, NULL, NULL, 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', 'acuiferos', 'acuiferos', 57, true, NULL, NULL, NULL, 'inventario', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) SELECT nombre_capa, 'TODAS', type, definicion, label FROM elle._map_style WHERE nombre_estilo='SIXHIARA';

COMMIT;
