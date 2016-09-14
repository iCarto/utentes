-- Deploy sixhiara:populate_elle_data to pg

BEGIN;



INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'curvas_nivel_10m', 'curvas_nivel_10m', 1, false, NULL, NULL, 'Elevações', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'batimetria', 'batimetria', 2, true, NULL, NULL, 'Limites Administrativos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'provinces', 'provinces', 3, true, NULL, NULL, 'Limites Administrativos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'paises_limitrofes', 'paises_limitrofes', 4, true, NULL, NULL, 'Limites Administrativos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'grandes_lagos', 'grandes_lagos', 5, true, NULL, '200000', 'Limites Administrativos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'postos_administrativos', 'postos_administrativos', 6, true, '500000', NULL, 'Limites Administrativos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'distritos', 'distritos', 7, true, NULL, '500000', 'Limites Administrativos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'provincia', 'provincia', 8, true, NULL, '1500000', 'Limites Administrativos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'zp_albufeiras', 'zp_albufeiras', 9, false, NULL, NULL, 'Zonas Protecção', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'zp_costa', 'zp_costa', 10, false, NULL, NULL, 'Zonas Protecção', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'zp_fontes', 'zp_fontes', 11, false, NULL, NULL, 'Zonas Protecção', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'zp_nascentes', 'zp_nascentes', 12, false, NULL, NULL, 'Zonas Protecção', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'lixeira', 'lixeira', 13, false, NULL, NULL, 'Equipamentos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'bombas_combustivel', 'bombas_combustivel', 14, false, NULL, NULL, 'Equipamentos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'cemiterios', 'cemiterios', 15, false, NULL, NULL, 'Equipamentos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'centro_educacional', 'centro_educacional', 16, false, NULL, NULL, 'Equipamentos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'centros_saude', 'centros_saude', 17, false, NULL, NULL, 'Equipamentos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'hoteis', 'hoteis', 18, false, NULL, NULL, 'Equipamentos', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'subbacias', 'bacias', 19, true, '500000', '150000', 'Hidrologia', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'bacias', 'bacias', 20, true, NULL, '500000', 'Hidrologia', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'lagos_embalses', 'lagos_embalses', 21, true, '999999', NULL, 'Hidrologia', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'rios', 'rios', 22, true, '500000', NULL, 'Hidrologia', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'estradas', 'estradas', 23, true, '199999', NULL, 'Estradas', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'aldeias', 'aldeias', 24, false, '500000', NULL, 'Assentamentos populacionais', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'cidades_vilas', 'cidades_vilas', 25, true, '600000', NULL, 'Assentamentos populacionais', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'exploracoes', 'exploracoes', 26, true, '199999', NULL, 'BDD_Técnica', 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'acuiferos', 'acuiferos', 27, true, '199999', NULL, 'BDD_Técnica', 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'albufeiras', 'albufeiras', 28, true, '999999', NULL, 'BDD_Técnica', 'cbase', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'barragens', 'barragens', 29, true, '199999', NULL, 'BDD_Técnica', 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'fontes', 'fontes', 30, true, '199999', NULL, 'BDD_Técnica', 'inventario', NULL);
INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('SIXHIARA', 'estacoes', 'estacoes', 31, true, '199999', NULL, 'BDD_Técnica', 'inventario', NULL);








--
-- Data for Name: elle._map_overview; Type: TABLE DATA; Schema: elle; Owner: postgres
--



--
-- Data for Name: elle._map_overview_style; Type: TABLE DATA; Schema: elle; Owner: postgres
--



--
-- Data for Name: elle._map_style; Type: TABLE DATA; Schema: elle; Owner: postgres
--

INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('estradas', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7996" xlink:type="simple" xlink:href="states#id(''7996'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="7996">
    <nullValueSymbol type="null"></nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="string">Other</key>
        <value type="reference">
        <reference id_state="8100" xlink:type="simple" xlink:href="states#id(''8100'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Primary</key>
        <value type="reference">
        <reference id_state="8106" xlink:type="simple" xlink:href="states#id(''8106'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Secondary</key>
        <value type="reference">
        <reference id_state="8111" xlink:type="simple" xlink:href="states#id(''8111'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Tertiary</key>
        <value type="reference">
        <reference id_state="8116" xlink:type="simple" xlink:href="states#id(''8116'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Vicinal</key>
        <value type="reference">
        <reference id_state="8119" xlink:type="simple" xlink:href="states#id(''8119'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">false</useDefaultSymbol>
    <keys type="list">
      <item type="string">Other</item>
      <item type="string">Primary</item>
      <item type="string">Secondary</item>
      <item type="string">Tertiary</item>
      <item type="string">Vicinal</item>
    </keys>
    <fieldNames type="list">
      <item type="string">tipo</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="8000" xlink:type="simple" xlink:href="states#id(''8000'')" />
      </item>
      <item type="reference">
        <reference id_state="8001" xlink:type="simple" xlink:href="states#id(''8001'')" />
      </item>
      <item type="reference">
        <reference id_state="8002" xlink:type="simple" xlink:href="states#id(''8002'')" />
      </item>
      <item type="reference">
        <reference id_state="8003" xlink:type="simple" xlink:href="states#id(''8003'')" />
      </item>
      <item type="reference">
        <reference id_state="8004" xlink:type="simple" xlink:href="states#id(''8004'')" />
      </item>
      <item type="reference">
        <reference id_state="8005" xlink:type="simple" xlink:href="states#id(''8005'')" />
      </item>
      <item type="reference">
        <reference id_state="8006" xlink:type="simple" xlink:href="states#id(''8006'')" />
      </item>
      <item type="reference">
        <reference id_state="8007" xlink:type="simple" xlink:href="states#id(''8007'')" />
      </item>
      <item type="reference">
        <reference id_state="8008" xlink:type="simple" xlink:href="states#id(''8008'')" />
      </item>
      <item type="reference">
        <reference id_state="8009" xlink:type="simple" xlink:href="states#id(''8009'')" />
      </item>
      <item type="reference">
        <reference id_state="8010" xlink:type="simple" xlink:href="states#id(''8010'')" />
      </item>
      <item type="reference">
        <reference id_state="8011" xlink:type="simple" xlink:href="states#id(''8011'')" />
      </item>
      <item type="reference">
        <reference id_state="8012" xlink:type="simple" xlink:href="states#id(''8012'')" />
      </item>
      <item type="reference">
        <reference id_state="8013" xlink:type="simple" xlink:href="states#id(''8013'')" />
      </item>
      <item type="reference">
        <reference id_state="8014" xlink:type="simple" xlink:href="states#id(''8014'')" />
      </item>
      <item type="reference">
        <reference id_state="8015" xlink:type="simple" xlink:href="states#id(''8015'')" />
      </item>
      <item type="reference">
        <reference id_state="8016" xlink:type="simple" xlink:href="states#id(''8016'')" />
      </item>
      <item type="reference">
        <reference id_state="8017" xlink:type="simple" xlink:href="states#id(''8017'')" />
      </item>
      <item type="reference">
        <reference id_state="8018" xlink:type="simple" xlink:href="states#id(''8018'')" />
      </item>
      <item type="reference">
        <reference id_state="8019" xlink:type="simple" xlink:href="states#id(''8019'')" />
      </item>
      <item type="reference">
        <reference id_state="8020" xlink:type="simple" xlink:href="states#id(''8020'')" />
      </item>
      <item type="reference">
        <reference id_state="8021" xlink:type="simple" xlink:href="states#id(''8021'')" />
      </item>
      <item type="reference">
        <reference id_state="8022" xlink:type="simple" xlink:href="states#id(''8022'')" />
      </item>
      <item type="reference">
        <reference id_state="8023" xlink:type="simple" xlink:href="states#id(''8023'')" />
      </item>
      <item type="reference">
        <reference id_state="8024" xlink:type="simple" xlink:href="states#id(''8024'')" />
      </item>
      <item type="reference">
        <reference id_state="8025" xlink:type="simple" xlink:href="states#id(''8025'')" />
      </item>
      <item type="reference">
        <reference id_state="8026" xlink:type="simple" xlink:href="states#id(''8026'')" />
      </item>
      <item type="reference">
        <reference id_state="8027" xlink:type="simple" xlink:href="states#id(''8027'')" />
      </item>
      <item type="reference">
        <reference id_state="8028" xlink:type="simple" xlink:href="states#id(''8028'')" />
      </item>
      <item type="reference">
        <reference id_state="8029" xlink:type="simple" xlink:href="states#id(''8029'')" />
      </item>
      <item type="reference">
        <reference id_state="8030" xlink:type="simple" xlink:href="states#id(''8030'')" />
      </item>
      <item type="reference">
        <reference id_state="8031" xlink:type="simple" xlink:href="states#id(''8031'')" />
      </item>
      <item type="reference">
        <reference id_state="8032" xlink:type="simple" xlink:href="states#id(''8032'')" />
      </item>
      <item type="reference">
        <reference id_state="8033" xlink:type="simple" xlink:href="states#id(''8033'')" />
      </item>
      <item type="reference">
        <reference id_state="8034" xlink:type="simple" xlink:href="states#id(''8034'')" />
      </item>
      <item type="reference">
        <reference id_state="8035" xlink:type="simple" xlink:href="states#id(''8035'')" />
      </item>
      <item type="reference">
        <reference id_state="8036" xlink:type="simple" xlink:href="states#id(''8036'')" />
      </item>
      <item type="reference">
        <reference id_state="8037" xlink:type="simple" xlink:href="states#id(''8037'')" />
      </item>
      <item type="reference">
        <reference id_state="8038" xlink:type="simple" xlink:href="states#id(''8038'')" />
      </item>
      <item type="reference">
        <reference id_state="8039" xlink:type="simple" xlink:href="states#id(''8039'')" />
      </item>
      <item type="reference">
        <reference id_state="8040" xlink:type="simple" xlink:href="states#id(''8040'')" />
      </item>
      <item type="reference">
        <reference id_state="8041" xlink:type="simple" xlink:href="states#id(''8041'')" />
      </item>
      <item type="reference">
        <reference id_state="8042" xlink:type="simple" xlink:href="states#id(''8042'')" />
      </item>
      <item type="reference">
        <reference id_state="8043" xlink:type="simple" xlink:href="states#id(''8043'')" />
      </item>
      <item type="reference">
        <reference id_state="8044" xlink:type="simple" xlink:href="states#id(''8044'')" />
      </item>
      <item type="reference">
        <reference id_state="8045" xlink:type="simple" xlink:href="states#id(''8045'')" />
      </item>
      <item type="reference">
        <reference id_state="8046" xlink:type="simple" xlink:href="states#id(''8046'')" />
      </item>
      <item type="reference">
        <reference id_state="8047" xlink:type="simple" xlink:href="states#id(''8047'')" />
      </item>
      <item type="reference">
        <reference id_state="8048" xlink:type="simple" xlink:href="states#id(''8048'')" />
      </item>
      <item type="reference">
        <reference id_state="8049" xlink:type="simple" xlink:href="states#id(''8049'')" />
      </item>
      <item type="reference">
        <reference id_state="8050" xlink:type="simple" xlink:href="states#id(''8050'')" />
      </item>
      <item type="reference">
        <reference id_state="8051" xlink:type="simple" xlink:href="states#id(''8051'')" />
      </item>
      <item type="reference">
        <reference id_state="8052" xlink:type="simple" xlink:href="states#id(''8052'')" />
      </item>
      <item type="reference">
        <reference id_state="8053" xlink:type="simple" xlink:href="states#id(''8053'')" />
      </item>
      <item type="reference">
        <reference id_state="8054" xlink:type="simple" xlink:href="states#id(''8054'')" />
      </item>
      <item type="reference">
        <reference id_state="8055" xlink:type="simple" xlink:href="states#id(''8055'')" />
      </item>
      <item type="reference">
        <reference id_state="8056" xlink:type="simple" xlink:href="states#id(''8056'')" />
      </item>
      <item type="reference">
        <reference id_state="8057" xlink:type="simple" xlink:href="states#id(''8057'')" />
      </item>
      <item type="reference">
        <reference id_state="8058" xlink:type="simple" xlink:href="states#id(''8058'')" />
      </item>
      <item type="reference">
        <reference id_state="8059" xlink:type="simple" xlink:href="states#id(''8059'')" />
      </item>
      <item type="reference">
        <reference id_state="8060" xlink:type="simple" xlink:href="states#id(''8060'')" />
      </item>
      <item type="reference">
        <reference id_state="8061" xlink:type="simple" xlink:href="states#id(''8061'')" />
      </item>
      <item type="reference">
        <reference id_state="8062" xlink:type="simple" xlink:href="states#id(''8062'')" />
      </item>
      <item type="reference">
        <reference id_state="8063" xlink:type="simple" xlink:href="states#id(''8063'')" />
      </item>
      <item type="reference">
        <reference id_state="8064" xlink:type="simple" xlink:href="states#id(''8064'')" />
      </item>
      <item type="reference">
        <reference id_state="8065" xlink:type="simple" xlink:href="states#id(''8065'')" />
      </item>
      <item type="reference">
        <reference id_state="8066" xlink:type="simple" xlink:href="states#id(''8066'')" />
      </item>
      <item type="reference">
        <reference id_state="8067" xlink:type="simple" xlink:href="states#id(''8067'')" />
      </item>
      <item type="reference">
        <reference id_state="8068" xlink:type="simple" xlink:href="states#id(''8068'')" />
      </item>
      <item type="reference">
        <reference id_state="8069" xlink:type="simple" xlink:href="states#id(''8069'')" />
      </item>
      <item type="reference">
        <reference id_state="8070" xlink:type="simple" xlink:href="states#id(''8070'')" />
      </item>
      <item type="reference">
        <reference id_state="8071" xlink:type="simple" xlink:href="states#id(''8071'')" />
      </item>
      <item type="reference">
        <reference id_state="8072" xlink:type="simple" xlink:href="states#id(''8072'')" />
      </item>
      <item type="reference">
        <reference id_state="8073" xlink:type="simple" xlink:href="states#id(''8073'')" />
      </item>
      <item type="reference">
        <reference id_state="8074" xlink:type="simple" xlink:href="states#id(''8074'')" />
      </item>
      <item type="reference">
        <reference id_state="8075" xlink:type="simple" xlink:href="states#id(''8075'')" />
      </item>
      <item type="reference">
        <reference id_state="8076" xlink:type="simple" xlink:href="states#id(''8076'')" />
      </item>
      <item type="reference">
        <reference id_state="8077" xlink:type="simple" xlink:href="states#id(''8077'')" />
      </item>
      <item type="reference">
        <reference id_state="8078" xlink:type="simple" xlink:href="states#id(''8078'')" />
      </item>
      <item type="reference">
        <reference id_state="8079" xlink:type="simple" xlink:href="states#id(''8079'')" />
      </item>
      <item type="reference">
        <reference id_state="8080" xlink:type="simple" xlink:href="states#id(''8080'')" />
      </item>
      <item type="reference">
        <reference id_state="8081" xlink:type="simple" xlink:href="states#id(''8081'')" />
      </item>
      <item type="reference">
        <reference id_state="8082" xlink:type="simple" xlink:href="states#id(''8082'')" />
      </item>
      <item type="reference">
        <reference id_state="8083" xlink:type="simple" xlink:href="states#id(''8083'')" />
      </item>
      <item type="reference">
        <reference id_state="8084" xlink:type="simple" xlink:href="states#id(''8084'')" />
      </item>
      <item type="reference">
        <reference id_state="8085" xlink:type="simple" xlink:href="states#id(''8085'')" />
      </item>
      <item type="reference">
        <reference id_state="8086" xlink:type="simple" xlink:href="states#id(''8086'')" />
      </item>
      <item type="reference">
        <reference id_state="8087" xlink:type="simple" xlink:href="states#id(''8087'')" />
      </item>
      <item type="reference">
        <reference id_state="8088" xlink:type="simple" xlink:href="states#id(''8088'')" />
      </item>
      <item type="reference">
        <reference id_state="8089" xlink:type="simple" xlink:href="states#id(''8089'')" />
      </item>
      <item type="reference">
        <reference id_state="8090" xlink:type="simple" xlink:href="states#id(''8090'')" />
      </item>
      <item type="reference">
        <reference id_state="8091" xlink:type="simple" xlink:href="states#id(''8091'')" />
      </item>
      <item type="reference">
        <reference id_state="8092" xlink:type="simple" xlink:href="states#id(''8092'')" />
      </item>
      <item type="reference">
        <reference id_state="8093" xlink:type="simple" xlink:href="states#id(''8093'')" />
      </item>
      <item type="reference">
        <reference id_state="8094" xlink:type="simple" xlink:href="states#id(''8094'')" />
      </item>
      <item type="reference">
        <reference id_state="8095" xlink:type="simple" xlink:href="states#id(''8095'')" />
      </item>
      <item type="reference">
        <reference id_state="8096" xlink:type="simple" xlink:href="states#id(''8096'')" />
      </item>
      <item type="reference">
        <reference id_state="8097" xlink:type="simple" xlink:href="states#id(''8097'')" />
      </item>
      <item type="reference">
        <reference id_state="8098" xlink:type="simple" xlink:href="states#id(''8098'')" />
      </item>
      <item type="reference">
        <reference id_state="8099" xlink:type="simple" xlink:href="states#id(''8099'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">8</shapeType>
    <fieldTypes type="list">
      <item type="integer">8</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7997" xlink:type="simple" xlink:href="states#id(''7997'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleLineSymbol id="7997">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7998" xlink:type="simple" xlink:href="states#id(''7998'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="7999" xlink:type="simple" xlink:href="states#id(''7999'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="7998">
    <red type="integer">250</red>
    <blue type="integer">130</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="7999">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__AwtColor id="8000">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8001">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8002">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8003">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8004">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8005">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8006">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8007">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8008">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8009">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8010">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8011">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8012">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8013">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8014">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8015">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8016">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8017">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8018">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8019">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8020">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8021">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8022">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8023">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8024">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8025">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8026">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8027">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8028">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8029">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8030">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8031">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8032">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8033">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8034">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8035">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8036">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8037">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8038">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8039">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8040">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8041">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8042">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8043">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8044">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8045">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8046">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8047">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8048">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8049">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8050">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8051">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8052">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8053">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8054">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8055">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8056">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8057">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8058">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8059">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8060">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8061">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8062">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8063">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8064">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8065">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8066">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8067">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8068">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8069">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8070">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8071">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8072">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8073">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8074">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8075">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8076">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8077">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8078">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8079">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8080">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8081">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8082">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8083">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8084">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8085">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8086">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8087">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8088">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8089">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8090">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8091">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8092">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8093">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8094">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8095">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8096">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8097">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8098">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8099">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8100">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8103" xlink:type="simple" xlink:href="states#id(''8103'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8101" xlink:type="simple" xlink:href="states#id(''8101'')" />
    </color>
    <description type="string">Other</description>
    <lineStyle type="reference">
        <reference id_state="8102" xlink:type="simple" xlink:href="states#id(''8102'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8101">
    <red type="integer">153</red>
    <blue type="integer">153</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8102">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8103">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8104" xlink:type="simple" xlink:href="states#id(''8104'')" />
    </color>
    <description type="string">Other version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8105" xlink:type="simple" xlink:href="states#id(''8105'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8104">
    <red type="integer">255</red>
    <blue type="integer">0</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8105">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8106">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8109" xlink:type="simple" xlink:href="states#id(''8109'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8107" xlink:type="simple" xlink:href="states#id(''8107'')" />
    </color>
    <description type="string">Primary</description>
    <lineStyle type="reference">
        <reference id_state="8108" xlink:type="simple" xlink:href="states#id(''8108'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8107">
    <red type="integer">153</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8108">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8109">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8104" xlink:type="simple" xlink:href="states#id(''8104'')" />
    </color>
    <description type="string">Primary version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8110" xlink:type="simple" xlink:href="states#id(''8110'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8110">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8111">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8114" xlink:type="simple" xlink:href="states#id(''8114'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8112" xlink:type="simple" xlink:href="states#id(''8112'')" />
    </color>
    <description type="string">Secondary</description>
    <lineStyle type="reference">
        <reference id_state="8113" xlink:type="simple" xlink:href="states#id(''8113'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8112">
    <red type="integer">102</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8113">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.4</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8114">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8104" xlink:type="simple" xlink:href="states#id(''8104'')" />
    </color>
    <description type="string">Secondary version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8115" xlink:type="simple" xlink:href="states#id(''8115'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8115">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.4</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8116">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8117" xlink:type="simple" xlink:href="states#id(''8117'')" />
    </color>
    <description type="string">Tertiary</description>
    <lineStyle type="reference">
        <reference id_state="8118" xlink:type="simple" xlink:href="states#id(''8118'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8117">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">102</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8118">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8119">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8122" xlink:type="simple" xlink:href="states#id(''8122'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8120" xlink:type="simple" xlink:href="states#id(''8120'')" />
    </color>
    <description type="string">Vicinal</description>
    <lineStyle type="reference">
        <reference id_state="8121" xlink:type="simple" xlink:href="states#id(''8121'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8120">
    <red type="integer">51</red>
    <blue type="integer">51</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8121">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8122">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8104" xlink:type="simple" xlink:href="states#id(''8104'')" />
    </color>
    <description type="string">Vicinal version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8123" xlink:type="simple" xlink:href="states#id(''8123'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8123">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('cemiterios', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8319" xlink:type="simple" xlink:href="states#id(''8319'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8319">
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8320" xlink:type="simple" xlink:href="states#id(''8320'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__PictureMarkerSymbol id="8320">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="8327" xlink:type="simple" xlink:href="states#id(''8327'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8323" xlink:type="simple" xlink:href="states#id(''8323'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8321" xlink:type="simple" xlink:href="states#id(''8321'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8326" xlink:type="simple" xlink:href="states#id(''8326'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8322" xlink:type="simple" xlink:href="states#id(''8322'')" />
    </offset>
    <size type="double">16.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="8321">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="8322">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="8323">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="8325" xlink:type="simple" xlink:href="states#id(''8325'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8323" xlink:type="simple" xlink:href="states#id(''8323'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8321" xlink:type="simple" xlink:href="states#id(''8321'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Peak 1</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8324" xlink:type="simple" xlink:href="states#id(''8324'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8322" xlink:type="simple" xlink:href="states#id(''8322'')" />
    </offset>
    <size type="double">16.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__SVGStyle id="8324">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Peak%201.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Peak%201.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="8325">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Peak%201_sel.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Peak%201_sel.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="8326">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Peak%201.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Peak%201.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="8327">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Peak%201_sel.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Peak%201_sel.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('estacoes', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="utf-8"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7655" xlink:type="simple" xlink:href="states#id(''7655'')" />
<states>
  <Persistence__FILTER_EXPRESSION_LEGEND_PERSISTENCE_DEFINITION_NAME id="7655">
    <useDefaultSymbol type="boolean">false</useDefaultSymbol>
    <fieldNames type="list">
      <item type="string">gid</item>
      <item type="string">estazon</item>
      <item type="string">cod_estac</item>
      <item type="string">tip_estac</item>
      <item type="string">provincia</item>
      <item type="string">distrito</item>
      <item type="string">posto_adm</item>
      <item type="string">nucleo</item>
      <item type="string">altitude</item>
      <item type="string">bacia</item>
      <item type="string">subacia</item>
      <item type="string">rio</item>
      <item type="string">estado</item>
      <item type="string">ano_const</item>
      <item type="string">gestao</item>
      <item type="string">n_tecnico</item>
      <item type="string">responsab</item>
      <item type="string">telefone</item>
      <item type="string">ano_inici</item>
      <item type="string">ano_fin</item>
      <item type="string">n_anos</item>
      <item type="string">frec_toma</item>
      <item type="string">frec_regi</item>
      <item type="string">n_precis</item>
      <item type="string">n_lin_em</item>
      <item type="string">n_t_outro</item>
      <item type="string">v_precis</item>
      <item type="string">n_molinet</item>
      <item type="string">v_t_outro</item>
      <item type="string">tip_pluvi</item>
      <item type="string">n_pluviom</item>
      <item type="string">coment</item>
      <item type="string">et_id</item>
      <item type="string">nivel</item>
      <item type="string">lin_em</item>
      <item type="string">n_outros</item>
      <item type="string">velocidad</item>
      <item type="string">molinetes</item>
      <item type="string">v_outros</item>
      <item type="string">caudal</item>
      <item type="string">pluviomet</item>
      <item type="string">geom</item>
    </fieldNames>
    <shapeType type="integer">1</shapeType>
    <fieldTypes type="list">
      <item type="integer">4</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">7</item>
      <item type="integer">7</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">8</item>
      <item type="integer">7</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">66</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <itemStringArray type="list">
      <item type="string">tip_estac = ''Hidrométrica'' and estado = ''Bo''</item>
      <item type="string">tip_estac = ''Pluviométrica'' and estado = ''Bo''</item>
      <item type="string">tip_estac = ''Hidrométrica'' and estado = ''Não operacional''</item>
      <item type="string">tip_estac = ''Pluviométrica'' and estado = ''Não operacional''</item>
      <item type="string">tip_estac = ''Pluviométrica'' and estado Is Null  </item>
    </itemStringArray>
    <itemSymbolArray type="list">
      <item type="reference">
        <reference id_state="7659" xlink:type="simple" xlink:href="states#id(''7659'')" />
      </item>
      <item type="reference">
        <reference id_state="7666" xlink:type="simple" xlink:href="states#id(''7666'')" />
      </item>
      <item type="reference">
        <reference id_state="7672" xlink:type="simple" xlink:href="states#id(''7672'')" />
      </item>
      <item type="reference">
        <reference id_state="7678" xlink:type="simple" xlink:href="states#id(''7678'')" />
      </item>
      <item type="reference">
        <reference id_state="7684" xlink:type="simple" xlink:href="states#id(''7684'')" />
      </item>
    </itemSymbolArray>
    <defaultSymbol type="reference">
        <reference id_state="7656" xlink:type="simple" xlink:href="states#id(''7656'')" />
    </defaultSymbol>
  </Persistence__FILTER_EXPRESSION_LEGEND_PERSISTENCE_DEFINITION_NAME>
  <Persistence__SimpleMarkerSymbol id="7656">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7657" xlink:type="simple" xlink:href="states#id(''7657'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Valor padr�o</description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="7657">
    <red type="integer">204</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="7658">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="7659">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7665" xlink:type="simple" xlink:href="states#id(''7665'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7661" xlink:type="simple" xlink:href="states#id(''7661'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Hidrométrica - Bo</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7664" xlink:type="simple" xlink:href="states#id(''7664'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="7660">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__PictureMarkerSymbol id="7661">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7663" xlink:type="simple" xlink:href="states#id(''7663'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7661" xlink:type="simple" xlink:href="states#id(''7661'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7662" xlink:type="simple" xlink:href="states#id(''7662'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7662">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7663">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7664">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7665">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="7666">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7671" xlink:type="simple" xlink:href="states#id(''7671'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7667" xlink:type="simple" xlink:href="states#id(''7667'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Pluviométrica - Bo</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7670" xlink:type="simple" xlink:href="states#id(''7670'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="7667">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7669" xlink:type="simple" xlink:href="states#id(''7669'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7667" xlink:type="simple" xlink:href="states#id(''7667'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7668" xlink:type="simple" xlink:href="states#id(''7668'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7668">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7669">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7670">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7671">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="7672">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7677" xlink:type="simple" xlink:href="states#id(''7677'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7673" xlink:type="simple" xlink:href="states#id(''7673'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Hidrométrica - Não operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7676" xlink:type="simple" xlink:href="states#id(''7676'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="7673">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7675" xlink:type="simple" xlink:href="states#id(''7675'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7673" xlink:type="simple" xlink:href="states#id(''7673'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7674" xlink:type="simple" xlink:href="states#id(''7674'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7674">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7675">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7676">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7677">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="7678">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7683" xlink:type="simple" xlink:href="states#id(''7683'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7679" xlink:type="simple" xlink:href="states#id(''7679'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Pluviométrica - Não operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7682" xlink:type="simple" xlink:href="states#id(''7682'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="7679">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7681" xlink:type="simple" xlink:href="states#id(''7681'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7679" xlink:type="simple" xlink:href="states#id(''7679'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7680" xlink:type="simple" xlink:href="states#id(''7680'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7680">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7681">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7682">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7683">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="7684">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7689" xlink:type="simple" xlink:href="states#id(''7689'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7685" xlink:type="simple" xlink:href="states#id(''7685'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Pluviométrica - Não operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7688" xlink:type="simple" xlink:href="states#id(''7688'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="7685">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7687" xlink:type="simple" xlink:href="states#id(''7687'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7685" xlink:type="simple" xlink:href="states#id(''7685'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7660" xlink:type="simple" xlink:href="states#id(''7660'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7686" xlink:type="simple" xlink:href="states#id(''7686'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7658" xlink:type="simple" xlink:href="states#id(''7658'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7686">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7687">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7688">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7689">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7690" xlink:type="simple" xlink:href="states#id(''7690'')" />
<states>
  <Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME id="7690">
    <zoomConstraints type="reference">
        <reference id_state="7698" xlink:type="simple" xlink:href="states#id(''7698'')" />
    </zoomConstraints>
    <unit type="integer">-1</unit>
    <allowOverlapping type="boolean">false</allowOverlapping>
    <placementConstraints type="reference">
        <reference id_state="7697" xlink:type="simple" xlink:href="states#id(''7697'')" />
    </placementConstraints>
    <referenceSystem type="integer">0</referenceSystem>
    <labelingMethod type="reference">
        <reference id_state="7691" xlink:type="simple" xlink:href="states#id(''7691'')" />
    </labelingMethod>
  </Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME>
  <Persistence__DefaultLabelingMethod id="7691">
    <defaultLabel type="reference">
        <reference id_state="7692" xlink:type="simple" xlink:href="states#id(''7692'')" />
    </defaultLabel>
  </Persistence__DefaultLabelingMethod>
  <Persistence__LabelClass id="7692">
    <texts type="list">
      <item type="string"></item>
    </texts>
    <unit type="integer">-1</unit>
    <scale type="double">NaN</scale>
    <sqlQuery type="string"></sqlQuery>
    <visible type="boolean">true</visible>
    <labelExpressions type="list">
      <item type="string"></item>
    </labelExpressions>
    <priority type="integer">0</priority>
    <referenceSystem type="integer">0</referenceSystem>
    <name type="string"></name>
    <textSymbol type="reference">
        <reference id_state="7693" xlink:type="simple" xlink:href="states#id(''7693'')" />
    </textSymbol>
    <useSQL type="boolean">false</useSQL>
  </Persistence__LabelClass>
  <Persistence__SimpleTextSymbol id="7693">
    <haloWidth type="float">3.0</haloWidth>
    <unit type="integer">-1</unit>
    <textColor type="reference">
        <reference id_state="7695" xlink:type="simple" xlink:href="states#id(''7695'')" />
    </textColor>
    <text type="string"></text>
    <hasHalo type="boolean">false</hasHalo>
    <rotation type="double">0.0</rotation>
    <font type="reference">
        <reference id_state="7694" xlink:type="simple" xlink:href="states#id(''7694'')" />
    </font>
    <description type="null"></description>
    <autoResize type="boolean">false</autoResize>
    <referenceSystem type="integer">0</referenceSystem>
    <haloColor type="reference">
        <reference id_state="7696" xlink:type="simple" xlink:href="states#id(''7696'')" />
    </haloColor>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleTextSymbol>
  <Persistence__AwtFont id="7694">
    <style type="integer">0</style>
    <name type="string">Arial Black</name>
    <size type="integer">7</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="7695">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7696">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME id="7697">
    <aboveTheLine type="boolean">false</aboveTheLine>
    <duplicateLabelsMode type="integer">4</duplicateLabelsMode>
    <belowTheLine type="boolean">false</belowTheLine>
    <fitInsidePolygon type="boolean">false</fitInsidePolygon>
    <onTheLine type="boolean">false</onTheLine>
    <locationAlongLine type="integer">0</locationAlongLine>
    <pageOriented type="boolean">false</pageOriented>
    <placementMode type="integer">6</placementMode>
  </Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME>
  <Persistence__ZoomConstraintsImpl id="7698">
    <minScale type="long">-1</minScale>
    <maxScale type="long">-1</maxScale>
    <mode type="integer">0</mode>
  </Persistence__ZoomConstraintsImpl>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('fontes', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7699" xlink:type="simple" xlink:href="states#id(''7699'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="7699">
    <nullValueSymbol type="reference">
        <reference id_state="7703" xlink:type="simple" xlink:href="states#id(''7703'')" />
    </nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="string">Base</key>
        <value type="reference">
        <reference id_state="7805" xlink:type="simple" xlink:href="states#id(''7805'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Base e qualidade</key>
        <value type="reference">
        <reference id_state="7807" xlink:type="simple" xlink:href="states#id(''7807'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Velho-Sustitu�do</key>
        <value type="reference">
        <reference id_state="7809" xlink:type="simple" xlink:href="states#id(''7809'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">true</useDefaultSymbol>
    <keys type="list">
      <item type="string">Base</item>
      <item type="string">Base e qualidade</item>
      <item type="string">Velho-Sustitu�do</item>
    </keys>
    <fieldNames type="list">
      <item type="string">red_monit</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="7705" xlink:type="simple" xlink:href="states#id(''7705'')" />
      </item>
      <item type="reference">
        <reference id_state="7706" xlink:type="simple" xlink:href="states#id(''7706'')" />
      </item>
      <item type="reference">
        <reference id_state="7707" xlink:type="simple" xlink:href="states#id(''7707'')" />
      </item>
      <item type="reference">
        <reference id_state="7708" xlink:type="simple" xlink:href="states#id(''7708'')" />
      </item>
      <item type="reference">
        <reference id_state="7709" xlink:type="simple" xlink:href="states#id(''7709'')" />
      </item>
      <item type="reference">
        <reference id_state="7710" xlink:type="simple" xlink:href="states#id(''7710'')" />
      </item>
      <item type="reference">
        <reference id_state="7711" xlink:type="simple" xlink:href="states#id(''7711'')" />
      </item>
      <item type="reference">
        <reference id_state="7712" xlink:type="simple" xlink:href="states#id(''7712'')" />
      </item>
      <item type="reference">
        <reference id_state="7713" xlink:type="simple" xlink:href="states#id(''7713'')" />
      </item>
      <item type="reference">
        <reference id_state="7714" xlink:type="simple" xlink:href="states#id(''7714'')" />
      </item>
      <item type="reference">
        <reference id_state="7715" xlink:type="simple" xlink:href="states#id(''7715'')" />
      </item>
      <item type="reference">
        <reference id_state="7716" xlink:type="simple" xlink:href="states#id(''7716'')" />
      </item>
      <item type="reference">
        <reference id_state="7717" xlink:type="simple" xlink:href="states#id(''7717'')" />
      </item>
      <item type="reference">
        <reference id_state="7718" xlink:type="simple" xlink:href="states#id(''7718'')" />
      </item>
      <item type="reference">
        <reference id_state="7719" xlink:type="simple" xlink:href="states#id(''7719'')" />
      </item>
      <item type="reference">
        <reference id_state="7720" xlink:type="simple" xlink:href="states#id(''7720'')" />
      </item>
      <item type="reference">
        <reference id_state="7721" xlink:type="simple" xlink:href="states#id(''7721'')" />
      </item>
      <item type="reference">
        <reference id_state="7722" xlink:type="simple" xlink:href="states#id(''7722'')" />
      </item>
      <item type="reference">
        <reference id_state="7723" xlink:type="simple" xlink:href="states#id(''7723'')" />
      </item>
      <item type="reference">
        <reference id_state="7724" xlink:type="simple" xlink:href="states#id(''7724'')" />
      </item>
      <item type="reference">
        <reference id_state="7725" xlink:type="simple" xlink:href="states#id(''7725'')" />
      </item>
      <item type="reference">
        <reference id_state="7726" xlink:type="simple" xlink:href="states#id(''7726'')" />
      </item>
      <item type="reference">
        <reference id_state="7727" xlink:type="simple" xlink:href="states#id(''7727'')" />
      </item>
      <item type="reference">
        <reference id_state="7728" xlink:type="simple" xlink:href="states#id(''7728'')" />
      </item>
      <item type="reference">
        <reference id_state="7729" xlink:type="simple" xlink:href="states#id(''7729'')" />
      </item>
      <item type="reference">
        <reference id_state="7730" xlink:type="simple" xlink:href="states#id(''7730'')" />
      </item>
      <item type="reference">
        <reference id_state="7731" xlink:type="simple" xlink:href="states#id(''7731'')" />
      </item>
      <item type="reference">
        <reference id_state="7732" xlink:type="simple" xlink:href="states#id(''7732'')" />
      </item>
      <item type="reference">
        <reference id_state="7733" xlink:type="simple" xlink:href="states#id(''7733'')" />
      </item>
      <item type="reference">
        <reference id_state="7734" xlink:type="simple" xlink:href="states#id(''7734'')" />
      </item>
      <item type="reference">
        <reference id_state="7735" xlink:type="simple" xlink:href="states#id(''7735'')" />
      </item>
      <item type="reference">
        <reference id_state="7736" xlink:type="simple" xlink:href="states#id(''7736'')" />
      </item>
      <item type="reference">
        <reference id_state="7737" xlink:type="simple" xlink:href="states#id(''7737'')" />
      </item>
      <item type="reference">
        <reference id_state="7738" xlink:type="simple" xlink:href="states#id(''7738'')" />
      </item>
      <item type="reference">
        <reference id_state="7739" xlink:type="simple" xlink:href="states#id(''7739'')" />
      </item>
      <item type="reference">
        <reference id_state="7740" xlink:type="simple" xlink:href="states#id(''7740'')" />
      </item>
      <item type="reference">
        <reference id_state="7741" xlink:type="simple" xlink:href="states#id(''7741'')" />
      </item>
      <item type="reference">
        <reference id_state="7742" xlink:type="simple" xlink:href="states#id(''7742'')" />
      </item>
      <item type="reference">
        <reference id_state="7743" xlink:type="simple" xlink:href="states#id(''7743'')" />
      </item>
      <item type="reference">
        <reference id_state="7744" xlink:type="simple" xlink:href="states#id(''7744'')" />
      </item>
      <item type="reference">
        <reference id_state="7745" xlink:type="simple" xlink:href="states#id(''7745'')" />
      </item>
      <item type="reference">
        <reference id_state="7746" xlink:type="simple" xlink:href="states#id(''7746'')" />
      </item>
      <item type="reference">
        <reference id_state="7747" xlink:type="simple" xlink:href="states#id(''7747'')" />
      </item>
      <item type="reference">
        <reference id_state="7748" xlink:type="simple" xlink:href="states#id(''7748'')" />
      </item>
      <item type="reference">
        <reference id_state="7749" xlink:type="simple" xlink:href="states#id(''7749'')" />
      </item>
      <item type="reference">
        <reference id_state="7750" xlink:type="simple" xlink:href="states#id(''7750'')" />
      </item>
      <item type="reference">
        <reference id_state="7751" xlink:type="simple" xlink:href="states#id(''7751'')" />
      </item>
      <item type="reference">
        <reference id_state="7752" xlink:type="simple" xlink:href="states#id(''7752'')" />
      </item>
      <item type="reference">
        <reference id_state="7753" xlink:type="simple" xlink:href="states#id(''7753'')" />
      </item>
      <item type="reference">
        <reference id_state="7754" xlink:type="simple" xlink:href="states#id(''7754'')" />
      </item>
      <item type="reference">
        <reference id_state="7755" xlink:type="simple" xlink:href="states#id(''7755'')" />
      </item>
      <item type="reference">
        <reference id_state="7756" xlink:type="simple" xlink:href="states#id(''7756'')" />
      </item>
      <item type="reference">
        <reference id_state="7757" xlink:type="simple" xlink:href="states#id(''7757'')" />
      </item>
      <item type="reference">
        <reference id_state="7758" xlink:type="simple" xlink:href="states#id(''7758'')" />
      </item>
      <item type="reference">
        <reference id_state="7759" xlink:type="simple" xlink:href="states#id(''7759'')" />
      </item>
      <item type="reference">
        <reference id_state="7760" xlink:type="simple" xlink:href="states#id(''7760'')" />
      </item>
      <item type="reference">
        <reference id_state="7761" xlink:type="simple" xlink:href="states#id(''7761'')" />
      </item>
      <item type="reference">
        <reference id_state="7762" xlink:type="simple" xlink:href="states#id(''7762'')" />
      </item>
      <item type="reference">
        <reference id_state="7763" xlink:type="simple" xlink:href="states#id(''7763'')" />
      </item>
      <item type="reference">
        <reference id_state="7764" xlink:type="simple" xlink:href="states#id(''7764'')" />
      </item>
      <item type="reference">
        <reference id_state="7765" xlink:type="simple" xlink:href="states#id(''7765'')" />
      </item>
      <item type="reference">
        <reference id_state="7766" xlink:type="simple" xlink:href="states#id(''7766'')" />
      </item>
      <item type="reference">
        <reference id_state="7767" xlink:type="simple" xlink:href="states#id(''7767'')" />
      </item>
      <item type="reference">
        <reference id_state="7768" xlink:type="simple" xlink:href="states#id(''7768'')" />
      </item>
      <item type="reference">
        <reference id_state="7769" xlink:type="simple" xlink:href="states#id(''7769'')" />
      </item>
      <item type="reference">
        <reference id_state="7770" xlink:type="simple" xlink:href="states#id(''7770'')" />
      </item>
      <item type="reference">
        <reference id_state="7771" xlink:type="simple" xlink:href="states#id(''7771'')" />
      </item>
      <item type="reference">
        <reference id_state="7772" xlink:type="simple" xlink:href="states#id(''7772'')" />
      </item>
      <item type="reference">
        <reference id_state="7773" xlink:type="simple" xlink:href="states#id(''7773'')" />
      </item>
      <item type="reference">
        <reference id_state="7774" xlink:type="simple" xlink:href="states#id(''7774'')" />
      </item>
      <item type="reference">
        <reference id_state="7775" xlink:type="simple" xlink:href="states#id(''7775'')" />
      </item>
      <item type="reference">
        <reference id_state="7776" xlink:type="simple" xlink:href="states#id(''7776'')" />
      </item>
      <item type="reference">
        <reference id_state="7777" xlink:type="simple" xlink:href="states#id(''7777'')" />
      </item>
      <item type="reference">
        <reference id_state="7778" xlink:type="simple" xlink:href="states#id(''7778'')" />
      </item>
      <item type="reference">
        <reference id_state="7779" xlink:type="simple" xlink:href="states#id(''7779'')" />
      </item>
      <item type="reference">
        <reference id_state="7780" xlink:type="simple" xlink:href="states#id(''7780'')" />
      </item>
      <item type="reference">
        <reference id_state="7781" xlink:type="simple" xlink:href="states#id(''7781'')" />
      </item>
      <item type="reference">
        <reference id_state="7782" xlink:type="simple" xlink:href="states#id(''7782'')" />
      </item>
      <item type="reference">
        <reference id_state="7783" xlink:type="simple" xlink:href="states#id(''7783'')" />
      </item>
      <item type="reference">
        <reference id_state="7784" xlink:type="simple" xlink:href="states#id(''7784'')" />
      </item>
      <item type="reference">
        <reference id_state="7785" xlink:type="simple" xlink:href="states#id(''7785'')" />
      </item>
      <item type="reference">
        <reference id_state="7786" xlink:type="simple" xlink:href="states#id(''7786'')" />
      </item>
      <item type="reference">
        <reference id_state="7787" xlink:type="simple" xlink:href="states#id(''7787'')" />
      </item>
      <item type="reference">
        <reference id_state="7788" xlink:type="simple" xlink:href="states#id(''7788'')" />
      </item>
      <item type="reference">
        <reference id_state="7789" xlink:type="simple" xlink:href="states#id(''7789'')" />
      </item>
      <item type="reference">
        <reference id_state="7790" xlink:type="simple" xlink:href="states#id(''7790'')" />
      </item>
      <item type="reference">
        <reference id_state="7791" xlink:type="simple" xlink:href="states#id(''7791'')" />
      </item>
      <item type="reference">
        <reference id_state="7792" xlink:type="simple" xlink:href="states#id(''7792'')" />
      </item>
      <item type="reference">
        <reference id_state="7793" xlink:type="simple" xlink:href="states#id(''7793'')" />
      </item>
      <item type="reference">
        <reference id_state="7794" xlink:type="simple" xlink:href="states#id(''7794'')" />
      </item>
      <item type="reference">
        <reference id_state="7795" xlink:type="simple" xlink:href="states#id(''7795'')" />
      </item>
      <item type="reference">
        <reference id_state="7796" xlink:type="simple" xlink:href="states#id(''7796'')" />
      </item>
      <item type="reference">
        <reference id_state="7797" xlink:type="simple" xlink:href="states#id(''7797'')" />
      </item>
      <item type="reference">
        <reference id_state="7798" xlink:type="simple" xlink:href="states#id(''7798'')" />
      </item>
      <item type="reference">
        <reference id_state="7799" xlink:type="simple" xlink:href="states#id(''7799'')" />
      </item>
      <item type="reference">
        <reference id_state="7800" xlink:type="simple" xlink:href="states#id(''7800'')" />
      </item>
      <item type="reference">
        <reference id_state="7801" xlink:type="simple" xlink:href="states#id(''7801'')" />
      </item>
      <item type="reference">
        <reference id_state="7802" xlink:type="simple" xlink:href="states#id(''7802'')" />
      </item>
      <item type="reference">
        <reference id_state="7803" xlink:type="simple" xlink:href="states#id(''7803'')" />
      </item>
      <item type="reference">
        <reference id_state="7804" xlink:type="simple" xlink:href="states#id(''7804'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">1</shapeType>
    <fieldTypes type="list">
      <item type="integer">8</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7700" xlink:type="simple" xlink:href="states#id(''7700'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleMarkerSymbol id="7700">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7701" xlink:type="simple" xlink:href="states#id(''7701'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Padr�o</description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="7702" xlink:type="simple" xlink:href="states#id(''7702'')" />
    </offset>
    <size type="double">4.0</size>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="7701">
    <red type="integer">0</red>
    <blue type="integer">102</blue>
    <green type="integer">51</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="7702">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__SimpleMarkerSymbol id="7703">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7704" xlink:type="simple" xlink:href="states#id(''7704'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Default</description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="7702" xlink:type="simple" xlink:href="states#id(''7702'')" />
    </offset>
    <size type="double">4.0</size>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="7704">
    <red type="integer">218</red>
    <blue type="integer">100</blue>
    <green type="integer">89</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7705">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7706">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7707">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7708">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7709">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7710">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7711">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7712">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7713">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7714">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7715">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7716">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7717">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7718">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7719">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7720">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7721">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7722">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7723">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7724">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7725">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7726">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7727">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7728">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7729">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7730">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7731">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7732">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7733">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7734">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7735">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7736">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7737">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7738">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7739">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7740">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7741">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7742">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7743">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7744">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7745">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7746">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7747">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7748">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7749">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7750">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7751">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7752">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7753">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7754">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7755">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7756">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7757">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7758">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7759">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7760">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7761">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7762">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7763">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7764">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7765">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7766">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7767">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7768">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7769">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7770">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7771">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7772">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7773">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7774">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7775">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7776">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7777">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7778">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7779">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7780">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7781">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7782">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7783">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7784">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7785">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7786">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7787">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7788">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7789">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7790">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7791">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7792">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7793">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7794">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7795">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7796">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7797">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7798">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7799">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7800">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7801">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7802">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7803">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7804">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleMarkerSymbol id="7805">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7806" xlink:type="simple" xlink:href="states#id(''7806'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Base</description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="7702" xlink:type="simple" xlink:href="states#id(''7702'')" />
    </offset>
    <size type="double">8.0</size>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="7806">
    <red type="integer">0</red>
    <blue type="integer">51</blue>
    <green type="integer">102</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleMarkerSymbol id="7807">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7808" xlink:type="simple" xlink:href="states#id(''7808'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Base e qualidade</description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="7702" xlink:type="simple" xlink:href="states#id(''7702'')" />
    </offset>
    <size type="double">8.0</size>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="7808">
    <red type="integer">153</red>
    <blue type="integer">0</blue>
    <green type="integer">51</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleMarkerSymbol id="7809">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7701" xlink:type="simple" xlink:href="states#id(''7701'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Velho-Sustitu�do</description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="7702" xlink:type="simple" xlink:href="states#id(''7702'')" />
    </offset>
    <size type="double">8.0</size>
  </Persistence__SimpleMarkerSymbol>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7810" xlink:type="simple" xlink:href="states#id(''7810'')" />
<states>
  <Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME id="7810">
    <zoomConstraints type="reference">
        <reference id_state="7819" xlink:type="simple" xlink:href="states#id(''7819'')" />
    </zoomConstraints>
    <unit type="integer">-1</unit>
    <allowOverlapping type="boolean">false</allowOverlapping>
    <placementConstraints type="reference">
        <reference id_state="7817" xlink:type="simple" xlink:href="states#id(''7817'')" />
    </placementConstraints>
    <referenceSystem type="integer">0</referenceSystem>
    <labelingMethod type="reference">
        <reference id_state="7811" xlink:type="simple" xlink:href="states#id(''7811'')" />
    </labelingMethod>
  </Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME>
  <Persistence__DefaultLabelingMethod id="7811">
    <defaultLabel type="reference">
        <reference id_state="7812" xlink:type="simple" xlink:href="states#id(''7812'')" />
    </defaultLabel>
  </Persistence__DefaultLabelingMethod>
  <Persistence__LabelClass id="7812">
    <texts type="list">
      <item type="string">PE-13</item>
    </texts>
    <unit type="integer">-1</unit>
    <scale type="double">1.3333333333333333</scale>
    <sqlQuery type="string">red_monit = ''Base'' or red_monit = ''Base - 2014'' or red_monit = ''Base e qualidade'' or red_monit = ''Base e qualidade - 2014''</sqlQuery>
    <visible type="boolean">true</visible>
    <labelExpressions type="list">
      <item type="string">cod_fonte</item>
    </labelExpressions>
    <priority type="integer">0</priority>
    <referenceSystem type="integer">0</referenceSystem>
    <name type="string"></name>
    <textSymbol type="reference">
        <reference id_state="7813" xlink:type="simple" xlink:href="states#id(''7813'')" />
    </textSymbol>
    <useSQL type="boolean">true</useSQL>
  </Persistence__LabelClass>
  <Persistence__SimpleTextSymbol id="7813">
    <haloWidth type="float">3.0</haloWidth>
    <unit type="integer">-1</unit>
    <textColor type="reference">
        <reference id_state="7815" xlink:type="simple" xlink:href="states#id(''7815'')" />
    </textColor>
    <text type="string">PE-13</text>
    <hasHalo type="boolean">false</hasHalo>
    <rotation type="double">0.0</rotation>
    <font type="reference">
        <reference id_state="7814" xlink:type="simple" xlink:href="states#id(''7814'')" />
    </font>
    <description type="null"></description>
    <autoResize type="boolean">false</autoResize>
    <referenceSystem type="integer">0</referenceSystem>
    <haloColor type="reference">
        <reference id_state="7816" xlink:type="simple" xlink:href="states#id(''7816'')" />
    </haloColor>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleTextSymbol>
  <Persistence__AwtFont id="7814">
    <style type="integer">0</style>
    <name type="string">Arial Black</name>
    <size type="integer">7</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="7815">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7816">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME id="7817">
    <aboveTheLine type="boolean">false</aboveTheLine>
    <duplicateLabelsMode type="integer">4</duplicateLabelsMode>
    <pointPositioner type="reference">
        <reference id_state="7818" xlink:type="simple" xlink:href="states#id(''7818'')" />
    </pointPositioner>
    <belowTheLine type="boolean">false</belowTheLine>
    <fitInsidePolygon type="boolean">false</fitInsidePolygon>
    <onTheLine type="boolean">false</onTheLine>
    <locationAlongLine type="integer">0</locationAlongLine>
    <pageOriented type="boolean">false</pageOriented>
    <placementMode type="integer">5</placementMode>
  </Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME>
  <Persistence__POINT_LABEL_POSITIONER_PERSISTENCE_NAME id="7818">
    <preferenceVector type="list">
      <item type="integer">2</item>
      <item type="integer">2</item>
      <item type="integer">1</item>
      <item type="integer">3</item>
      <item type="integer">2</item>
      <item type="integer">3</item>
      <item type="integer">3</item>
      <item type="integer">2</item>
    </preferenceVector>
    <description type="string">Preferencialmente em cima a direita, por�m permitindo qualquer posi��o</description>
  </Persistence__POINT_LABEL_POSITIONER_PERSISTENCE_NAME>
  <Persistence__ZoomConstraintsImpl id="7819">
    <minScale type="long">-1</minScale>
    <maxScale type="long">-1</maxScale>
    <mode type="integer">0</mode>
  </Persistence__ZoomConstraintsImpl>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('barragens', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="utf-8"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7820" xlink:type="simple" xlink:href="states#id(''7820'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="7820">
    <nullValueSymbol type="null"></nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="string">Bo</key>
        <value type="reference">
        <reference id_state="7924" xlink:type="simple" xlink:href="states#id(''7924'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Em carteira</key>
        <value type="reference">
        <reference id_state="7931" xlink:type="simple" xlink:href="states#id(''7931'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Não operacional</key>
        <value type="reference">
        <reference id_state="7937" xlink:type="simple" xlink:href="states#id(''7937'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">false</useDefaultSymbol>
    <keys type="list">
      <item type="string">Bo</item>
      <item type="string">Em carteira</item>
      <item type="string">Não operacional</item>
    </keys>
    <fieldNames type="list">
      <item type="string">estado</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="7824" xlink:type="simple" xlink:href="states#id(''7824'')" />
      </item>
      <item type="reference">
        <reference id_state="7825" xlink:type="simple" xlink:href="states#id(''7825'')" />
      </item>
      <item type="reference">
        <reference id_state="7826" xlink:type="simple" xlink:href="states#id(''7826'')" />
      </item>
      <item type="reference">
        <reference id_state="7827" xlink:type="simple" xlink:href="states#id(''7827'')" />
      </item>
      <item type="reference">
        <reference id_state="7828" xlink:type="simple" xlink:href="states#id(''7828'')" />
      </item>
      <item type="reference">
        <reference id_state="7829" xlink:type="simple" xlink:href="states#id(''7829'')" />
      </item>
      <item type="reference">
        <reference id_state="7830" xlink:type="simple" xlink:href="states#id(''7830'')" />
      </item>
      <item type="reference">
        <reference id_state="7831" xlink:type="simple" xlink:href="states#id(''7831'')" />
      </item>
      <item type="reference">
        <reference id_state="7832" xlink:type="simple" xlink:href="states#id(''7832'')" />
      </item>
      <item type="reference">
        <reference id_state="7833" xlink:type="simple" xlink:href="states#id(''7833'')" />
      </item>
      <item type="reference">
        <reference id_state="7834" xlink:type="simple" xlink:href="states#id(''7834'')" />
      </item>
      <item type="reference">
        <reference id_state="7835" xlink:type="simple" xlink:href="states#id(''7835'')" />
      </item>
      <item type="reference">
        <reference id_state="7836" xlink:type="simple" xlink:href="states#id(''7836'')" />
      </item>
      <item type="reference">
        <reference id_state="7837" xlink:type="simple" xlink:href="states#id(''7837'')" />
      </item>
      <item type="reference">
        <reference id_state="7838" xlink:type="simple" xlink:href="states#id(''7838'')" />
      </item>
      <item type="reference">
        <reference id_state="7839" xlink:type="simple" xlink:href="states#id(''7839'')" />
      </item>
      <item type="reference">
        <reference id_state="7840" xlink:type="simple" xlink:href="states#id(''7840'')" />
      </item>
      <item type="reference">
        <reference id_state="7841" xlink:type="simple" xlink:href="states#id(''7841'')" />
      </item>
      <item type="reference">
        <reference id_state="7842" xlink:type="simple" xlink:href="states#id(''7842'')" />
      </item>
      <item type="reference">
        <reference id_state="7843" xlink:type="simple" xlink:href="states#id(''7843'')" />
      </item>
      <item type="reference">
        <reference id_state="7844" xlink:type="simple" xlink:href="states#id(''7844'')" />
      </item>
      <item type="reference">
        <reference id_state="7845" xlink:type="simple" xlink:href="states#id(''7845'')" />
      </item>
      <item type="reference">
        <reference id_state="7846" xlink:type="simple" xlink:href="states#id(''7846'')" />
      </item>
      <item type="reference">
        <reference id_state="7847" xlink:type="simple" xlink:href="states#id(''7847'')" />
      </item>
      <item type="reference">
        <reference id_state="7848" xlink:type="simple" xlink:href="states#id(''7848'')" />
      </item>
      <item type="reference">
        <reference id_state="7849" xlink:type="simple" xlink:href="states#id(''7849'')" />
      </item>
      <item type="reference">
        <reference id_state="7850" xlink:type="simple" xlink:href="states#id(''7850'')" />
      </item>
      <item type="reference">
        <reference id_state="7851" xlink:type="simple" xlink:href="states#id(''7851'')" />
      </item>
      <item type="reference">
        <reference id_state="7852" xlink:type="simple" xlink:href="states#id(''7852'')" />
      </item>
      <item type="reference">
        <reference id_state="7853" xlink:type="simple" xlink:href="states#id(''7853'')" />
      </item>
      <item type="reference">
        <reference id_state="7854" xlink:type="simple" xlink:href="states#id(''7854'')" />
      </item>
      <item type="reference">
        <reference id_state="7855" xlink:type="simple" xlink:href="states#id(''7855'')" />
      </item>
      <item type="reference">
        <reference id_state="7856" xlink:type="simple" xlink:href="states#id(''7856'')" />
      </item>
      <item type="reference">
        <reference id_state="7857" xlink:type="simple" xlink:href="states#id(''7857'')" />
      </item>
      <item type="reference">
        <reference id_state="7858" xlink:type="simple" xlink:href="states#id(''7858'')" />
      </item>
      <item type="reference">
        <reference id_state="7859" xlink:type="simple" xlink:href="states#id(''7859'')" />
      </item>
      <item type="reference">
        <reference id_state="7860" xlink:type="simple" xlink:href="states#id(''7860'')" />
      </item>
      <item type="reference">
        <reference id_state="7861" xlink:type="simple" xlink:href="states#id(''7861'')" />
      </item>
      <item type="reference">
        <reference id_state="7862" xlink:type="simple" xlink:href="states#id(''7862'')" />
      </item>
      <item type="reference">
        <reference id_state="7863" xlink:type="simple" xlink:href="states#id(''7863'')" />
      </item>
      <item type="reference">
        <reference id_state="7864" xlink:type="simple" xlink:href="states#id(''7864'')" />
      </item>
      <item type="reference">
        <reference id_state="7865" xlink:type="simple" xlink:href="states#id(''7865'')" />
      </item>
      <item type="reference">
        <reference id_state="7866" xlink:type="simple" xlink:href="states#id(''7866'')" />
      </item>
      <item type="reference">
        <reference id_state="7867" xlink:type="simple" xlink:href="states#id(''7867'')" />
      </item>
      <item type="reference">
        <reference id_state="7868" xlink:type="simple" xlink:href="states#id(''7868'')" />
      </item>
      <item type="reference">
        <reference id_state="7869" xlink:type="simple" xlink:href="states#id(''7869'')" />
      </item>
      <item type="reference">
        <reference id_state="7870" xlink:type="simple" xlink:href="states#id(''7870'')" />
      </item>
      <item type="reference">
        <reference id_state="7871" xlink:type="simple" xlink:href="states#id(''7871'')" />
      </item>
      <item type="reference">
        <reference id_state="7872" xlink:type="simple" xlink:href="states#id(''7872'')" />
      </item>
      <item type="reference">
        <reference id_state="7873" xlink:type="simple" xlink:href="states#id(''7873'')" />
      </item>
      <item type="reference">
        <reference id_state="7874" xlink:type="simple" xlink:href="states#id(''7874'')" />
      </item>
      <item type="reference">
        <reference id_state="7875" xlink:type="simple" xlink:href="states#id(''7875'')" />
      </item>
      <item type="reference">
        <reference id_state="7876" xlink:type="simple" xlink:href="states#id(''7876'')" />
      </item>
      <item type="reference">
        <reference id_state="7877" xlink:type="simple" xlink:href="states#id(''7877'')" />
      </item>
      <item type="reference">
        <reference id_state="7878" xlink:type="simple" xlink:href="states#id(''7878'')" />
      </item>
      <item type="reference">
        <reference id_state="7879" xlink:type="simple" xlink:href="states#id(''7879'')" />
      </item>
      <item type="reference">
        <reference id_state="7880" xlink:type="simple" xlink:href="states#id(''7880'')" />
      </item>
      <item type="reference">
        <reference id_state="7881" xlink:type="simple" xlink:href="states#id(''7881'')" />
      </item>
      <item type="reference">
        <reference id_state="7882" xlink:type="simple" xlink:href="states#id(''7882'')" />
      </item>
      <item type="reference">
        <reference id_state="7883" xlink:type="simple" xlink:href="states#id(''7883'')" />
      </item>
      <item type="reference">
        <reference id_state="7884" xlink:type="simple" xlink:href="states#id(''7884'')" />
      </item>
      <item type="reference">
        <reference id_state="7885" xlink:type="simple" xlink:href="states#id(''7885'')" />
      </item>
      <item type="reference">
        <reference id_state="7886" xlink:type="simple" xlink:href="states#id(''7886'')" />
      </item>
      <item type="reference">
        <reference id_state="7887" xlink:type="simple" xlink:href="states#id(''7887'')" />
      </item>
      <item type="reference">
        <reference id_state="7888" xlink:type="simple" xlink:href="states#id(''7888'')" />
      </item>
      <item type="reference">
        <reference id_state="7889" xlink:type="simple" xlink:href="states#id(''7889'')" />
      </item>
      <item type="reference">
        <reference id_state="7890" xlink:type="simple" xlink:href="states#id(''7890'')" />
      </item>
      <item type="reference">
        <reference id_state="7891" xlink:type="simple" xlink:href="states#id(''7891'')" />
      </item>
      <item type="reference">
        <reference id_state="7892" xlink:type="simple" xlink:href="states#id(''7892'')" />
      </item>
      <item type="reference">
        <reference id_state="7893" xlink:type="simple" xlink:href="states#id(''7893'')" />
      </item>
      <item type="reference">
        <reference id_state="7894" xlink:type="simple" xlink:href="states#id(''7894'')" />
      </item>
      <item type="reference">
        <reference id_state="7895" xlink:type="simple" xlink:href="states#id(''7895'')" />
      </item>
      <item type="reference">
        <reference id_state="7896" xlink:type="simple" xlink:href="states#id(''7896'')" />
      </item>
      <item type="reference">
        <reference id_state="7897" xlink:type="simple" xlink:href="states#id(''7897'')" />
      </item>
      <item type="reference">
        <reference id_state="7898" xlink:type="simple" xlink:href="states#id(''7898'')" />
      </item>
      <item type="reference">
        <reference id_state="7899" xlink:type="simple" xlink:href="states#id(''7899'')" />
      </item>
      <item type="reference">
        <reference id_state="7900" xlink:type="simple" xlink:href="states#id(''7900'')" />
      </item>
      <item type="reference">
        <reference id_state="7901" xlink:type="simple" xlink:href="states#id(''7901'')" />
      </item>
      <item type="reference">
        <reference id_state="7902" xlink:type="simple" xlink:href="states#id(''7902'')" />
      </item>
      <item type="reference">
        <reference id_state="7903" xlink:type="simple" xlink:href="states#id(''7903'')" />
      </item>
      <item type="reference">
        <reference id_state="7904" xlink:type="simple" xlink:href="states#id(''7904'')" />
      </item>
      <item type="reference">
        <reference id_state="7905" xlink:type="simple" xlink:href="states#id(''7905'')" />
      </item>
      <item type="reference">
        <reference id_state="7906" xlink:type="simple" xlink:href="states#id(''7906'')" />
      </item>
      <item type="reference">
        <reference id_state="7907" xlink:type="simple" xlink:href="states#id(''7907'')" />
      </item>
      <item type="reference">
        <reference id_state="7908" xlink:type="simple" xlink:href="states#id(''7908'')" />
      </item>
      <item type="reference">
        <reference id_state="7909" xlink:type="simple" xlink:href="states#id(''7909'')" />
      </item>
      <item type="reference">
        <reference id_state="7910" xlink:type="simple" xlink:href="states#id(''7910'')" />
      </item>
      <item type="reference">
        <reference id_state="7911" xlink:type="simple" xlink:href="states#id(''7911'')" />
      </item>
      <item type="reference">
        <reference id_state="7912" xlink:type="simple" xlink:href="states#id(''7912'')" />
      </item>
      <item type="reference">
        <reference id_state="7913" xlink:type="simple" xlink:href="states#id(''7913'')" />
      </item>
      <item type="reference">
        <reference id_state="7914" xlink:type="simple" xlink:href="states#id(''7914'')" />
      </item>
      <item type="reference">
        <reference id_state="7915" xlink:type="simple" xlink:href="states#id(''7915'')" />
      </item>
      <item type="reference">
        <reference id_state="7916" xlink:type="simple" xlink:href="states#id(''7916'')" />
      </item>
      <item type="reference">
        <reference id_state="7917" xlink:type="simple" xlink:href="states#id(''7917'')" />
      </item>
      <item type="reference">
        <reference id_state="7918" xlink:type="simple" xlink:href="states#id(''7918'')" />
      </item>
      <item type="reference">
        <reference id_state="7919" xlink:type="simple" xlink:href="states#id(''7919'')" />
      </item>
      <item type="reference">
        <reference id_state="7920" xlink:type="simple" xlink:href="states#id(''7920'')" />
      </item>
      <item type="reference">
        <reference id_state="7921" xlink:type="simple" xlink:href="states#id(''7921'')" />
      </item>
      <item type="reference">
        <reference id_state="7922" xlink:type="simple" xlink:href="states#id(''7922'')" />
      </item>
      <item type="reference">
        <reference id_state="7923" xlink:type="simple" xlink:href="states#id(''7923'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">1</shapeType>
    <fieldTypes type="list">
      <item type="integer">8</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7821" xlink:type="simple" xlink:href="states#id(''7821'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleMarkerSymbol id="7821">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7822" xlink:type="simple" xlink:href="states#id(''7822'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="7823" xlink:type="simple" xlink:href="states#id(''7823'')" />
    </offset>
    <size type="double">4.0</size>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="7822">
    <red type="integer">219</red>
    <blue type="integer">207</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="7823">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__AwtColor id="7824">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7825">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7826">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7827">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7828">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7829">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7830">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7831">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7832">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7833">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7834">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7835">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7836">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7837">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7838">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7839">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7840">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7841">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7842">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7843">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7844">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7845">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7846">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7847">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7848">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7849">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7850">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7851">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7852">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7853">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7854">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7855">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7856">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7857">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7858">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7859">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7860">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7861">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7862">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7863">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7864">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7865">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7866">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7867">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7868">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7869">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7870">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7871">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7872">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7873">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7874">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7875">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7876">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7877">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7878">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7879">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7880">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7881">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7882">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7883">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7884">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7885">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7886">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7887">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7888">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7889">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7890">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7891">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7892">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7893">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7894">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7895">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7896">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7897">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7898">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7899">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7900">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7901">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7902">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7903">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7904">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7905">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7906">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7907">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7908">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7909">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7910">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7911">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7912">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7913">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7914">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7915">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7916">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7917">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7918">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7919">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7920">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7921">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7922">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7923">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__PictureMarkerSymbol id="7924">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7930" xlink:type="simple" xlink:href="states#id(''7930'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7926" xlink:type="simple" xlink:href="states#id(''7926'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7925" xlink:type="simple" xlink:href="states#id(''7925'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Bo</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7929" xlink:type="simple" xlink:href="states#id(''7929'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7823" xlink:type="simple" xlink:href="states#id(''7823'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="7925">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__PictureMarkerSymbol id="7926">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7928" xlink:type="simple" xlink:href="states#id(''7928'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7926" xlink:type="simple" xlink:href="states#id(''7926'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7925" xlink:type="simple" xlink:href="states#id(''7925'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Dam</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7927" xlink:type="simple" xlink:href="states#id(''7927'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7823" xlink:type="simple" xlink:href="states#id(''7823'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7927">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7928">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7929">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7930">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="7931">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7936" xlink:type="simple" xlink:href="states#id(''7936'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7932" xlink:type="simple" xlink:href="states#id(''7932'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7925" xlink:type="simple" xlink:href="states#id(''7925'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Em carteira</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7935" xlink:type="simple" xlink:href="states#id(''7935'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7823" xlink:type="simple" xlink:href="states#id(''7823'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="7932">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7934" xlink:type="simple" xlink:href="states#id(''7934'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7932" xlink:type="simple" xlink:href="states#id(''7932'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7925" xlink:type="simple" xlink:href="states#id(''7925'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Em carteira</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7933" xlink:type="simple" xlink:href="states#id(''7933'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7823" xlink:type="simple" xlink:href="states#id(''7823'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7933">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Barragem_icono3.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Barragem_icono3.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7934">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7935">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Barragem_icono3.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Barragem_icono3.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7936">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="7937">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7942" xlink:type="simple" xlink:href="states#id(''7942'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7938" xlink:type="simple" xlink:href="states#id(''7938'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7925" xlink:type="simple" xlink:href="states#id(''7925'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Não operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7941" xlink:type="simple" xlink:href="states#id(''7941'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7823" xlink:type="simple" xlink:href="states#id(''7823'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="7938">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7940" xlink:type="simple" xlink:href="states#id(''7940'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7938" xlink:type="simple" xlink:href="states#id(''7938'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7925" xlink:type="simple" xlink:href="states#id(''7925'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Não operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7939" xlink:type="simple" xlink:href="states#id(''7939'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7823" xlink:type="simple" xlink:href="states#id(''7823'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="7939">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_icono2.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_icono2.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7940">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7941">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_icono2.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_icono2.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="7942">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7943" xlink:type="simple" xlink:href="states#id(''7943'')" />
<states>
  <Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME id="7943">
    <zoomConstraints type="reference">
        <reference id_state="7951" xlink:type="simple" xlink:href="states#id(''7951'')" />
    </zoomConstraints>
    <unit type="integer">-1</unit>
    <allowOverlapping type="boolean">false</allowOverlapping>
    <placementConstraints type="reference">
        <reference id_state="7950" xlink:type="simple" xlink:href="states#id(''7950'')" />
    </placementConstraints>
    <referenceSystem type="integer">0</referenceSystem>
    <labelingMethod type="reference">
        <reference id_state="7944" xlink:type="simple" xlink:href="states#id(''7944'')" />
    </labelingMethod>
  </Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME>
  <Persistence__DefaultLabelingMethod id="7944">
    <defaultLabel type="reference">
        <reference id_state="7945" xlink:type="simple" xlink:href="states#id(''7945'')" />
    </defaultLabel>
  </Persistence__DefaultLabelingMethod>
  <Persistence__LabelClass id="7945">
    <texts type="list">
      <item type="string"></item>
    </texts>
    <unit type="integer">-1</unit>
    <scale type="double">NaN</scale>
    <sqlQuery type="string"></sqlQuery>
    <visible type="boolean">true</visible>
    <labelExpressions type="list">
      <item type="string"></item>
    </labelExpressions>
    <priority type="integer">0</priority>
    <referenceSystem type="integer">0</referenceSystem>
    <name type="string"></name>
    <textSymbol type="reference">
        <reference id_state="7946" xlink:type="simple" xlink:href="states#id(''7946'')" />
    </textSymbol>
    <useSQL type="boolean">false</useSQL>
  </Persistence__LabelClass>
  <Persistence__SimpleTextSymbol id="7946">
    <haloWidth type="float">3.0</haloWidth>
    <unit type="integer">-1</unit>
    <textColor type="reference">
        <reference id_state="7948" xlink:type="simple" xlink:href="states#id(''7948'')" />
    </textColor>
    <text type="string"></text>
    <hasHalo type="boolean">false</hasHalo>
    <rotation type="double">0.0</rotation>
    <font type="reference">
        <reference id_state="7947" xlink:type="simple" xlink:href="states#id(''7947'')" />
    </font>
    <description type="null"></description>
    <autoResize type="boolean">false</autoResize>
    <referenceSystem type="integer">0</referenceSystem>
    <haloColor type="reference">
        <reference id_state="7949" xlink:type="simple" xlink:href="states#id(''7949'')" />
    </haloColor>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleTextSymbol>
  <Persistence__AwtFont id="7947">
    <style type="integer">0</style>
    <name type="string">Arial Black</name>
    <size type="integer">8</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="7948">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7949">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME id="7950">
    <aboveTheLine type="boolean">false</aboveTheLine>
    <duplicateLabelsMode type="integer">4</duplicateLabelsMode>
    <belowTheLine type="boolean">false</belowTheLine>
    <fitInsidePolygon type="boolean">false</fitInsidePolygon>
    <onTheLine type="boolean">false</onTheLine>
    <locationAlongLine type="integer">0</locationAlongLine>
    <pageOriented type="boolean">false</pageOriented>
    <placementMode type="integer">6</placementMode>
  </Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME>
  <Persistence__ZoomConstraintsImpl id="7951">
    <minScale type="long">-1</minScale>
    <maxScale type="long">-1</maxScale>
    <mode type="integer">0</mode>
  </Persistence__ZoomConstraintsImpl>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('albufeiras', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7952" xlink:type="simple" xlink:href="states#id(''7952'')" />
<states>
  <Persistence__SimgleSymbolLegend id="7952">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7953" xlink:type="simple" xlink:href="states#id(''7953'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="7953">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="7954" xlink:type="simple" xlink:href="states#id(''7954'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="7955" xlink:type="simple" xlink:href="states#id(''7955'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="7954">
    <red type="integer">0</red>
    <blue type="integer">102</blue>
    <green type="integer">51</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="7955">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7956" xlink:type="simple" xlink:href="states#id(''7956'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="7957" xlink:type="simple" xlink:href="states#id(''7957'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="7956">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="7957">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);

INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('exploracoes', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7958" xlink:type="simple" xlink:href="states#id(''7958'')" />
<states>
  <Persistence__SimgleSymbolLegend id="7958">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7959" xlink:type="simple" xlink:href="states#id(''7959'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="7959">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="7960" xlink:type="simple" xlink:href="states#id(''7960'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="7961" xlink:type="simple" xlink:href="states#id(''7961'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="7960">
    <red type="integer">0</red>
    <blue type="integer">51</blue>
    <green type="integer">255</green>
    <alpha type="integer">78</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="7961">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7962" xlink:type="simple" xlink:href="states#id(''7962'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="7963" xlink:type="simple" xlink:href="states#id(''7963'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="7962">
    <red type="integer">0</red>
    <blue type="integer">51</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="7963">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);

INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('acuiferos', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7958" xlink:type="simple" xlink:href="states#id(''7958'')" />
<states>
  <Persistence__SimgleSymbolLegend id="7958">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7959" xlink:type="simple" xlink:href="states#id(''7959'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="7959">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="7960" xlink:type="simple" xlink:href="states#id(''7960'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="7961" xlink:type="simple" xlink:href="states#id(''7961'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="7960">
    <red type="integer">0</red>
    <blue type="integer">102</blue>
    <green type="integer">51</green>
    <alpha type="integer">78</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="7961">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="7962" xlink:type="simple" xlink:href="states#id(''7962'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="7963" xlink:type="simple" xlink:href="states#id(''7963'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="7962">
    <red type="integer">0</red>
    <blue type="integer">102</blue>
    <green type="integer">51</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="7963">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('cidades_vilas', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7964" xlink:type="simple" xlink:href="states#id(''7964'')" />
<states>
  <Persistence__SimgleSymbolLegend id="7964">
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7965" xlink:type="simple" xlink:href="states#id(''7965'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__PictureMarkerSymbol id="7965">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7972" xlink:type="simple" xlink:href="states#id(''7972'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7968" xlink:type="simple" xlink:href="states#id(''7968'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7966" xlink:type="simple" xlink:href="states#id(''7966'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7971" xlink:type="simple" xlink:href="states#id(''7971'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7967" xlink:type="simple" xlink:href="states#id(''7967'')" />
    </offset>
    <size type="double">8.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="7966">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="7967">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="7968">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7970" xlink:type="simple" xlink:href="states#id(''7970'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7968" xlink:type="simple" xlink:href="states#id(''7968'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7966" xlink:type="simple" xlink:href="states#id(''7966'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Circle 5</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7969" xlink:type="simple" xlink:href="states#id(''7969'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7967" xlink:type="simple" xlink:href="states#id(''7967'')" />
    </offset>
    <size type="double">8.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__SVGStyle id="7969">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%205.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%205.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="7970">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%205_sel.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%205_sel.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="7971">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%205.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%205.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="7972">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%205_sel.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%205_sel.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7973" xlink:type="simple" xlink:href="states#id(''7973'')" />
<states>
  <Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME id="7973">
    <zoomConstraints type="reference">
        <reference id_state="7981" xlink:type="simple" xlink:href="states#id(''7981'')" />
    </zoomConstraints>
    <unit type="integer">-1</unit>
    <allowOverlapping type="boolean">false</allowOverlapping>
    <placementConstraints type="reference">
        <reference id_state="7980" xlink:type="simple" xlink:href="states#id(''7980'')" />
    </placementConstraints>
    <referenceSystem type="integer">0</referenceSystem>
    <labelingMethod type="reference">
        <reference id_state="7974" xlink:type="simple" xlink:href="states#id(''7974'')" />
    </labelingMethod>
  </Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME>
  <Persistence__DefaultLabelingMethod id="7974">
    <defaultLabel type="reference">
        <reference id_state="7975" xlink:type="simple" xlink:href="states#id(''7975'')" />
    </defaultLabel>
  </Persistence__DefaultLabelingMethod>
  <Persistence__LabelClass id="7975">
    <texts type="list">
      <item type="string">Metuge</item>
    </texts>
    <unit type="integer">-1</unit>
    <scale type="double">1.3333333333333333</scale>
    <sqlQuery type="string"></sqlQuery>
    <visible type="boolean">true</visible>
    <labelExpressions type="list">
      <item type="string">nome</item>
    </labelExpressions>
    <priority type="integer">0</priority>
    <referenceSystem type="integer">0</referenceSystem>
    <name type="string"></name>
    <textSymbol type="reference">
        <reference id_state="7976" xlink:type="simple" xlink:href="states#id(''7976'')" />
    </textSymbol>
    <useSQL type="boolean">false</useSQL>
  </Persistence__LabelClass>
  <Persistence__SimpleTextSymbol id="7976">
    <haloWidth type="float">3.0</haloWidth>
    <unit type="integer">-1</unit>
    <textColor type="reference">
        <reference id_state="7978" xlink:type="simple" xlink:href="states#id(''7978'')" />
    </textColor>
    <text type="string">Metuge</text>
    <hasHalo type="boolean">false</hasHalo>
    <rotation type="double">0.0</rotation>
    <font type="reference">
        <reference id_state="7977" xlink:type="simple" xlink:href="states#id(''7977'')" />
    </font>
    <description type="null"></description>
    <autoResize type="boolean">false</autoResize>
    <referenceSystem type="integer">0</referenceSystem>
    <haloColor type="reference">
        <reference id_state="7979" xlink:type="simple" xlink:href="states#id(''7979'')" />
    </haloColor>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleTextSymbol>
  <Persistence__AwtFont id="7977">
    <style type="integer">0</style>
    <name type="string">Tahoma</name>
    <size type="integer">8</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="7978">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="7979">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME id="7980">
    <aboveTheLine type="boolean">false</aboveTheLine>
    <duplicateLabelsMode type="integer">4</duplicateLabelsMode>
    <belowTheLine type="boolean">false</belowTheLine>
    <fitInsidePolygon type="boolean">false</fitInsidePolygon>
    <onTheLine type="boolean">false</onTheLine>
    <locationAlongLine type="integer">0</locationAlongLine>
    <pageOriented type="boolean">false</pageOriented>
    <placementMode type="integer">6</placementMode>
  </Persistence__POINT_PLACEM_CONSTRAINTS_PERSIST_NAME>
  <Persistence__ZoomConstraintsImpl id="7981">
    <minScale type="long">-1</minScale>
    <maxScale type="long">-1</maxScale>
    <mode type="integer">0</mode>
  </Persistence__ZoomConstraintsImpl>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('aldeias', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7982" xlink:type="simple" xlink:href="states#id(''7982'')" />
<states>
  <Persistence__SimgleSymbolLegend id="7982">
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="7983" xlink:type="simple" xlink:href="states#id(''7983'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__PictureMarkerSymbol id="7983">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="7991" xlink:type="simple" xlink:href="states#id(''7991'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7986" xlink:type="simple" xlink:href="states#id(''7986'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7984" xlink:type="simple" xlink:href="states#id(''7984'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7990" xlink:type="simple" xlink:href="states#id(''7990'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7985" xlink:type="simple" xlink:href="states#id(''7985'')" />
    </offset>
    <size type="double">4.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="7984">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="7985">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="7986">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="7989" xlink:type="simple" xlink:href="states#id(''7989'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="7986" xlink:type="simple" xlink:href="states#id(''7986'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="7987" xlink:type="simple" xlink:href="states#id(''7987'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Circle 1</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="7988" xlink:type="simple" xlink:href="states#id(''7988'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="7985" xlink:type="simple" xlink:href="states#id(''7985'')" />
    </offset>
    <size type="double">4.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="7987">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SVGStyle id="7988">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%201.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%201.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="7989">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%201_sel.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%201_sel.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="7990">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%201.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%201.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
  <Persistence__SVGStyle id="7991">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Circle%201_sel.svg</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Circle%201_sel.svg</sourceSymbolInLibrary>
  </Persistence__SVGStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="7992" xlink:type="simple" xlink:href="states#id(''7992'')" />
<states>
  <Persistence__AttrInTableLabelingStrategy id="7992">
    <zoomConstraints type="null"></zoomConstraints>
    <HeightField type="null"></HeightField>
    <useFixedColor type="boolean">true</useFixedColor>
    <ColorField type="null"></ColorField>
    <fixedSize type="double">8.0</fixedSize>
    <RotationField type="null"></RotationField>
    <fixedColor type="reference">
        <reference id_state="7994" xlink:type="simple" xlink:href="states#id(''7994'')" />
    </fixedColor>
    <font type="reference">
        <reference id_state="7993" xlink:type="simple" xlink:href="states#id(''7993'')" />
    </font>
    <referenceSystem type="integer">0</referenceSystem>
    <useFixedSize type="boolean">true</useFixedSize>
    <colorFont type="null"></colorFont>
    <TextField type="string">nome</TextField>
    <Unit type="integer">-1</Unit>
    <labelingMethod type="reference">
        <reference id_state="7995" xlink:type="simple" xlink:href="states#id(''7995'')" />
    </labelingMethod>
  </Persistence__AttrInTableLabelingStrategy>
  <Persistence__AwtFont id="7993">
    <style type="integer">0</style>
    <name type="string">SansSerif</name>
    <size type="integer">14</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="7994">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__DefaultLabelingMethod id="7995">
    <defaultLabel type="null"></defaultLabel>
  </Persistence__DefaultLabelingMethod>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('rios', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8124" xlink:type="simple" xlink:href="states#id(''8124'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8124">
    <shapeType type="integer">8</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8125" xlink:type="simple" xlink:href="states#id(''8125'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleLineSymbol id="8125">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8126" xlink:type="simple" xlink:href="states#id(''8126'')" />
    </color>
    <description type="string"></description>
    <lineStyle type="reference">
        <reference id_state="8127" xlink:type="simple" xlink:href="states#id(''8127'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8126">
    <red type="integer">0</red>
    <blue type="integer">153</blue>
    <green type="integer">102</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8127">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8128" xlink:type="simple" xlink:href="states#id(''8128'')" />
<states>
  <Persistence__AttrInTableLabelingStrategy id="8128">
    <zoomConstraints type="null"></zoomConstraints>
    <HeightField type="null"></HeightField>
    <useFixedColor type="boolean">true</useFixedColor>
    <ColorField type="null"></ColorField>
    <fixedSize type="double">10.0</fixedSize>
    <RotationField type="null"></RotationField>
    <fixedColor type="reference">
        <reference id_state="8130" xlink:type="simple" xlink:href="states#id(''8130'')" />
    </fixedColor>
    <font type="reference">
        <reference id_state="8129" xlink:type="simple" xlink:href="states#id(''8129'')" />
    </font>
    <referenceSystem type="integer">0</referenceSystem>
    <useFixedSize type="boolean">true</useFixedSize>
    <colorFont type="null"></colorFont>
    <TextField type="string">nome</TextField>
    <Unit type="integer">-1</Unit>
    <labelingMethod type="reference">
        <reference id_state="8131" xlink:type="simple" xlink:href="states#id(''8131'')" />
    </labelingMethod>
  </Persistence__AttrInTableLabelingStrategy>
  <Persistence__AwtFont id="8129">
    <style type="integer">0</style>
    <name type="string">Tahoma</name>
    <size type="integer">14</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="8130">
    <red type="integer">0</red>
    <blue type="integer">153</blue>
    <green type="integer">102</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__DefaultLabelingMethod id="8131">
    <defaultLabel type="null"></defaultLabel>
  </Persistence__DefaultLabelingMethod>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('lagos_embalses', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8132" xlink:type="simple" xlink:href="states#id(''8132'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8132">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8133" xlink:type="simple" xlink:href="states#id(''8133'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8133">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8134" xlink:type="simple" xlink:href="states#id(''8134'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8135" xlink:type="simple" xlink:href="states#id(''8135'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8134">
    <red type="integer">0</red>
    <blue type="integer">102</blue>
    <green type="integer">51</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8135">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8134" xlink:type="simple" xlink:href="states#id(''8134'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8136" xlink:type="simple" xlink:href="states#id(''8136'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8136">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);

INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('subbacias', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="UTF-8"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="120" xlink:type="simple" xlink:href="states#id(''120'')" />
<states>
  <Persistence__SimgleSymbolLegend id="120">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="121" xlink:type="simple" xlink:href="states#id(''121'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="121">
    <hasFill type="boolean">false</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="122" xlink:type="simple" xlink:href="states#id(''122'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="123" xlink:type="simple" xlink:href="states#id(''123'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="122">
    <red type="integer">169</red>
    <blue type="integer">205</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="123">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="124" xlink:type="simple" xlink:href="states#id(''124'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="125" xlink:type="simple" xlink:href="states#id(''125'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="124">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="125">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="UTF-8"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="126" xlink:type="simple" xlink:href="states#id(''126'')" />
<states>
  <Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME id="126">
    <zoomConstraints type="reference">
        <reference id_state="134" xlink:type="simple" xlink:href="states#id(''134'')" />
    </zoomConstraints>
    <unit type="integer">-1</unit>
    <allowOverlapping type="boolean">false</allowOverlapping>
    <placementConstraints type="reference">
        <reference id_state="133" xlink:type="simple" xlink:href="states#id(''133'')" />
    </placementConstraints>
    <referenceSystem type="integer">0</referenceSystem>
    <labelingMethod type="reference">
        <reference id_state="127" xlink:type="simple" xlink:href="states#id(''127'')" />
    </labelingMethod>
  </Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME>
  <Persistence__DefaultLabelingMethod id="127">
    <defaultLabel type="reference">
        <reference id_state="128" xlink:type="simple" xlink:href="states#id(''128'')" />
    </defaultLabel>
  </Persistence__DefaultLabelingMethod>
  <Persistence__LabelClass id="128">
    <texts type="list">
      <item type="string">Sinheu / Mutamba</item>
    </texts>
    <unit type="integer">-1</unit>
    <scale type="double">1.3333333333333333</scale>
    <sqlQuery type="string"></sqlQuery>
    <visible type="boolean">true</visible>
    <labelExpressions type="list">
      <item type="string">subacia</item>
    </labelExpressions>
    <priority type="integer">0</priority>
    <referenceSystem type="integer">0</referenceSystem>
    <name type="string"></name>
    <textSymbol type="reference">
        <reference id_state="129" xlink:type="simple" xlink:href="states#id(''129'')" />
    </textSymbol>
    <useSQL type="boolean">false</useSQL>
  </Persistence__LabelClass>
  <Persistence__SimpleTextSymbol id="129">
    <haloWidth type="float">2.0</haloWidth>
    <unit type="integer">-1</unit>
    <textColor type="reference">
        <reference id_state="131" xlink:type="simple" xlink:href="states#id(''131'')" />
    </textColor>
    <text type="string">Sinheu / Mutamba</text>
    <hasHalo type="boolean">true</hasHalo>
    <rotation type="double">0.0</rotation>
    <font type="reference">
        <reference id_state="130" xlink:type="simple" xlink:href="states#id(''130'')" />
    </font>
    <description type="null"></description>
    <autoResize type="boolean">false</autoResize>
    <referenceSystem type="integer">0</referenceSystem>
    <haloColor type="reference">
        <reference id_state="132" xlink:type="simple" xlink:href="states#id(''132'')" />
    </haloColor>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleTextSymbol>
  <Persistence__AwtFont id="130">
    <style type="integer">0</style>
    <name type="string">Tahoma</name>
    <size type="integer">10</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="131">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="132">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__POLYGON_PLACE_CONSTRAINTS id="133">
    <aboveTheLine type="boolean">false</aboveTheLine>
    <duplicateLabelsMode type="integer">2</duplicateLabelsMode>
    <belowTheLine type="boolean">false</belowTheLine>
    <fitInsidePolygon type="boolean">true</fitInsidePolygon>
    <onTheLine type="boolean">false</onTheLine>
    <locationAlongLine type="integer">0</locationAlongLine>
    <pageOriented type="boolean">false</pageOriented>
    <placementMode type="integer">9</placementMode>
  </Persistence__POLYGON_PLACE_CONSTRAINTS>
  <Persistence__ZoomConstraintsImpl id="134">
    <minScale type="long">-1</minScale>
    <maxScale type="long">-1</maxScale>
    <mode type="integer">0</mode>
  </Persistence__ZoomConstraintsImpl>
</states>
</XMLPersitence>
');

INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('bacias', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8137" xlink:type="simple" xlink:href="states#id(''8137'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="8137">
    <nullValueSymbol type="reference">
        <reference id_state="8143" xlink:type="simple" xlink:href="states#id(''8143'')" />
    </nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="string">Megaruma</key>
        <value type="reference">
        <reference id_state="8247" xlink:type="simple" xlink:href="states#id(''8247'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Messalo</key>
        <value type="reference">
        <reference id_state="8251" xlink:type="simple" xlink:href="states#id(''8251'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Montepuez</key>
        <value type="reference">
        <reference id_state="8255" xlink:type="simple" xlink:href="states#id(''8255'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Orla maritima 1</key>
        <value type="reference">
        <reference id_state="8259" xlink:type="simple" xlink:href="states#id(''8259'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Orla maritima 2</key>
        <value type="reference">
        <reference id_state="8267" xlink:type="simple" xlink:href="states#id(''8267'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Orla maritima 3</key>
        <value type="reference">
        <reference id_state="8273" xlink:type="simple" xlink:href="states#id(''8273'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Rovuma</key>
        <value type="reference">
        <reference id_state="8276" xlink:type="simple" xlink:href="states#id(''8276'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">false</useDefaultSymbol>
    <keys type="list">
      <item type="string">Megaruma</item>
      <item type="string">Messalo</item>
      <item type="string">Montepuez</item>
      <item type="string">Orla maritima 1</item>
      <item type="string">Orla maritima 2</item>
      <item type="string">Orla maritima 3</item>
      <item type="string">Rovuma</item>
    </keys>
    <fieldNames type="list">
      <item type="string">nome</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="8147" xlink:type="simple" xlink:href="states#id(''8147'')" />
      </item>
      <item type="reference">
        <reference id_state="8148" xlink:type="simple" xlink:href="states#id(''8148'')" />
      </item>
      <item type="reference">
        <reference id_state="8149" xlink:type="simple" xlink:href="states#id(''8149'')" />
      </item>
      <item type="reference">
        <reference id_state="8150" xlink:type="simple" xlink:href="states#id(''8150'')" />
      </item>
      <item type="reference">
        <reference id_state="8151" xlink:type="simple" xlink:href="states#id(''8151'')" />
      </item>
      <item type="reference">
        <reference id_state="8152" xlink:type="simple" xlink:href="states#id(''8152'')" />
      </item>
      <item type="reference">
        <reference id_state="8153" xlink:type="simple" xlink:href="states#id(''8153'')" />
      </item>
      <item type="reference">
        <reference id_state="8154" xlink:type="simple" xlink:href="states#id(''8154'')" />
      </item>
      <item type="reference">
        <reference id_state="8155" xlink:type="simple" xlink:href="states#id(''8155'')" />
      </item>
      <item type="reference">
        <reference id_state="8156" xlink:type="simple" xlink:href="states#id(''8156'')" />
      </item>
      <item type="reference">
        <reference id_state="8157" xlink:type="simple" xlink:href="states#id(''8157'')" />
      </item>
      <item type="reference">
        <reference id_state="8158" xlink:type="simple" xlink:href="states#id(''8158'')" />
      </item>
      <item type="reference">
        <reference id_state="8159" xlink:type="simple" xlink:href="states#id(''8159'')" />
      </item>
      <item type="reference">
        <reference id_state="8160" xlink:type="simple" xlink:href="states#id(''8160'')" />
      </item>
      <item type="reference">
        <reference id_state="8161" xlink:type="simple" xlink:href="states#id(''8161'')" />
      </item>
      <item type="reference">
        <reference id_state="8162" xlink:type="simple" xlink:href="states#id(''8162'')" />
      </item>
      <item type="reference">
        <reference id_state="8163" xlink:type="simple" xlink:href="states#id(''8163'')" />
      </item>
      <item type="reference">
        <reference id_state="8164" xlink:type="simple" xlink:href="states#id(''8164'')" />
      </item>
      <item type="reference">
        <reference id_state="8165" xlink:type="simple" xlink:href="states#id(''8165'')" />
      </item>
      <item type="reference">
        <reference id_state="8166" xlink:type="simple" xlink:href="states#id(''8166'')" />
      </item>
      <item type="reference">
        <reference id_state="8167" xlink:type="simple" xlink:href="states#id(''8167'')" />
      </item>
      <item type="reference">
        <reference id_state="8168" xlink:type="simple" xlink:href="states#id(''8168'')" />
      </item>
      <item type="reference">
        <reference id_state="8169" xlink:type="simple" xlink:href="states#id(''8169'')" />
      </item>
      <item type="reference">
        <reference id_state="8170" xlink:type="simple" xlink:href="states#id(''8170'')" />
      </item>
      <item type="reference">
        <reference id_state="8171" xlink:type="simple" xlink:href="states#id(''8171'')" />
      </item>
      <item type="reference">
        <reference id_state="8172" xlink:type="simple" xlink:href="states#id(''8172'')" />
      </item>
      <item type="reference">
        <reference id_state="8173" xlink:type="simple" xlink:href="states#id(''8173'')" />
      </item>
      <item type="reference">
        <reference id_state="8174" xlink:type="simple" xlink:href="states#id(''8174'')" />
      </item>
      <item type="reference">
        <reference id_state="8175" xlink:type="simple" xlink:href="states#id(''8175'')" />
      </item>
      <item type="reference">
        <reference id_state="8176" xlink:type="simple" xlink:href="states#id(''8176'')" />
      </item>
      <item type="reference">
        <reference id_state="8177" xlink:type="simple" xlink:href="states#id(''8177'')" />
      </item>
      <item type="reference">
        <reference id_state="8178" xlink:type="simple" xlink:href="states#id(''8178'')" />
      </item>
      <item type="reference">
        <reference id_state="8179" xlink:type="simple" xlink:href="states#id(''8179'')" />
      </item>
      <item type="reference">
        <reference id_state="8180" xlink:type="simple" xlink:href="states#id(''8180'')" />
      </item>
      <item type="reference">
        <reference id_state="8181" xlink:type="simple" xlink:href="states#id(''8181'')" />
      </item>
      <item type="reference">
        <reference id_state="8182" xlink:type="simple" xlink:href="states#id(''8182'')" />
      </item>
      <item type="reference">
        <reference id_state="8183" xlink:type="simple" xlink:href="states#id(''8183'')" />
      </item>
      <item type="reference">
        <reference id_state="8184" xlink:type="simple" xlink:href="states#id(''8184'')" />
      </item>
      <item type="reference">
        <reference id_state="8185" xlink:type="simple" xlink:href="states#id(''8185'')" />
      </item>
      <item type="reference">
        <reference id_state="8186" xlink:type="simple" xlink:href="states#id(''8186'')" />
      </item>
      <item type="reference">
        <reference id_state="8187" xlink:type="simple" xlink:href="states#id(''8187'')" />
      </item>
      <item type="reference">
        <reference id_state="8188" xlink:type="simple" xlink:href="states#id(''8188'')" />
      </item>
      <item type="reference">
        <reference id_state="8189" xlink:type="simple" xlink:href="states#id(''8189'')" />
      </item>
      <item type="reference">
        <reference id_state="8190" xlink:type="simple" xlink:href="states#id(''8190'')" />
      </item>
      <item type="reference">
        <reference id_state="8191" xlink:type="simple" xlink:href="states#id(''8191'')" />
      </item>
      <item type="reference">
        <reference id_state="8192" xlink:type="simple" xlink:href="states#id(''8192'')" />
      </item>
      <item type="reference">
        <reference id_state="8193" xlink:type="simple" xlink:href="states#id(''8193'')" />
      </item>
      <item type="reference">
        <reference id_state="8194" xlink:type="simple" xlink:href="states#id(''8194'')" />
      </item>
      <item type="reference">
        <reference id_state="8195" xlink:type="simple" xlink:href="states#id(''8195'')" />
      </item>
      <item type="reference">
        <reference id_state="8196" xlink:type="simple" xlink:href="states#id(''8196'')" />
      </item>
      <item type="reference">
        <reference id_state="8197" xlink:type="simple" xlink:href="states#id(''8197'')" />
      </item>
      <item type="reference">
        <reference id_state="8198" xlink:type="simple" xlink:href="states#id(''8198'')" />
      </item>
      <item type="reference">
        <reference id_state="8199" xlink:type="simple" xlink:href="states#id(''8199'')" />
      </item>
      <item type="reference">
        <reference id_state="8200" xlink:type="simple" xlink:href="states#id(''8200'')" />
      </item>
      <item type="reference">
        <reference id_state="8201" xlink:type="simple" xlink:href="states#id(''8201'')" />
      </item>
      <item type="reference">
        <reference id_state="8202" xlink:type="simple" xlink:href="states#id(''8202'')" />
      </item>
      <item type="reference">
        <reference id_state="8203" xlink:type="simple" xlink:href="states#id(''8203'')" />
      </item>
      <item type="reference">
        <reference id_state="8204" xlink:type="simple" xlink:href="states#id(''8204'')" />
      </item>
      <item type="reference">
        <reference id_state="8205" xlink:type="simple" xlink:href="states#id(''8205'')" />
      </item>
      <item type="reference">
        <reference id_state="8206" xlink:type="simple" xlink:href="states#id(''8206'')" />
      </item>
      <item type="reference">
        <reference id_state="8207" xlink:type="simple" xlink:href="states#id(''8207'')" />
      </item>
      <item type="reference">
        <reference id_state="8208" xlink:type="simple" xlink:href="states#id(''8208'')" />
      </item>
      <item type="reference">
        <reference id_state="8209" xlink:type="simple" xlink:href="states#id(''8209'')" />
      </item>
      <item type="reference">
        <reference id_state="8210" xlink:type="simple" xlink:href="states#id(''8210'')" />
      </item>
      <item type="reference">
        <reference id_state="8211" xlink:type="simple" xlink:href="states#id(''8211'')" />
      </item>
      <item type="reference">
        <reference id_state="8212" xlink:type="simple" xlink:href="states#id(''8212'')" />
      </item>
      <item type="reference">
        <reference id_state="8213" xlink:type="simple" xlink:href="states#id(''8213'')" />
      </item>
      <item type="reference">
        <reference id_state="8214" xlink:type="simple" xlink:href="states#id(''8214'')" />
      </item>
      <item type="reference">
        <reference id_state="8215" xlink:type="simple" xlink:href="states#id(''8215'')" />
      </item>
      <item type="reference">
        <reference id_state="8216" xlink:type="simple" xlink:href="states#id(''8216'')" />
      </item>
      <item type="reference">
        <reference id_state="8217" xlink:type="simple" xlink:href="states#id(''8217'')" />
      </item>
      <item type="reference">
        <reference id_state="8218" xlink:type="simple" xlink:href="states#id(''8218'')" />
      </item>
      <item type="reference">
        <reference id_state="8219" xlink:type="simple" xlink:href="states#id(''8219'')" />
      </item>
      <item type="reference">
        <reference id_state="8220" xlink:type="simple" xlink:href="states#id(''8220'')" />
      </item>
      <item type="reference">
        <reference id_state="8221" xlink:type="simple" xlink:href="states#id(''8221'')" />
      </item>
      <item type="reference">
        <reference id_state="8222" xlink:type="simple" xlink:href="states#id(''8222'')" />
      </item>
      <item type="reference">
        <reference id_state="8223" xlink:type="simple" xlink:href="states#id(''8223'')" />
      </item>
      <item type="reference">
        <reference id_state="8224" xlink:type="simple" xlink:href="states#id(''8224'')" />
      </item>
      <item type="reference">
        <reference id_state="8225" xlink:type="simple" xlink:href="states#id(''8225'')" />
      </item>
      <item type="reference">
        <reference id_state="8226" xlink:type="simple" xlink:href="states#id(''8226'')" />
      </item>
      <item type="reference">
        <reference id_state="8227" xlink:type="simple" xlink:href="states#id(''8227'')" />
      </item>
      <item type="reference">
        <reference id_state="8228" xlink:type="simple" xlink:href="states#id(''8228'')" />
      </item>
      <item type="reference">
        <reference id_state="8229" xlink:type="simple" xlink:href="states#id(''8229'')" />
      </item>
      <item type="reference">
        <reference id_state="8230" xlink:type="simple" xlink:href="states#id(''8230'')" />
      </item>
      <item type="reference">
        <reference id_state="8231" xlink:type="simple" xlink:href="states#id(''8231'')" />
      </item>
      <item type="reference">
        <reference id_state="8232" xlink:type="simple" xlink:href="states#id(''8232'')" />
      </item>
      <item type="reference">
        <reference id_state="8233" xlink:type="simple" xlink:href="states#id(''8233'')" />
      </item>
      <item type="reference">
        <reference id_state="8234" xlink:type="simple" xlink:href="states#id(''8234'')" />
      </item>
      <item type="reference">
        <reference id_state="8235" xlink:type="simple" xlink:href="states#id(''8235'')" />
      </item>
      <item type="reference">
        <reference id_state="8236" xlink:type="simple" xlink:href="states#id(''8236'')" />
      </item>
      <item type="reference">
        <reference id_state="8237" xlink:type="simple" xlink:href="states#id(''8237'')" />
      </item>
      <item type="reference">
        <reference id_state="8238" xlink:type="simple" xlink:href="states#id(''8238'')" />
      </item>
      <item type="reference">
        <reference id_state="8239" xlink:type="simple" xlink:href="states#id(''8239'')" />
      </item>
      <item type="reference">
        <reference id_state="8240" xlink:type="simple" xlink:href="states#id(''8240'')" />
      </item>
      <item type="reference">
        <reference id_state="8241" xlink:type="simple" xlink:href="states#id(''8241'')" />
      </item>
      <item type="reference">
        <reference id_state="8242" xlink:type="simple" xlink:href="states#id(''8242'')" />
      </item>
      <item type="reference">
        <reference id_state="8243" xlink:type="simple" xlink:href="states#id(''8243'')" />
      </item>
      <item type="reference">
        <reference id_state="8244" xlink:type="simple" xlink:href="states#id(''8244'')" />
      </item>
      <item type="reference">
        <reference id_state="8245" xlink:type="simple" xlink:href="states#id(''8245'')" />
      </item>
      <item type="reference">
        <reference id_state="8246" xlink:type="simple" xlink:href="states#id(''8246'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">9</shapeType>
    <fieldTypes type="list">
      <item type="integer">8</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8138" xlink:type="simple" xlink:href="states#id(''8138'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleFillSymbol id="8138">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8139" xlink:type="simple" xlink:href="states#id(''8139'')" />
    </color>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8140" xlink:type="simple" xlink:href="states#id(''8140'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8139">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8140">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8142" xlink:type="simple" xlink:href="states#id(''8142'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8141">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8142">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8143">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8144" xlink:type="simple" xlink:href="states#id(''8144'')" />
    </color>
    <description type="string">Default</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8145" xlink:type="simple" xlink:href="states#id(''8145'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8144">
    <red type="integer">185</red>
    <blue type="integer">133</blue>
    <green type="integer">4</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8145">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8146" xlink:type="simple" xlink:href="states#id(''8146'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8146">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__AwtColor id="8147">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8148">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8149">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8150">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8151">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8152">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8153">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8154">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8155">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8156">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8157">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8158">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8159">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8160">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8161">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8162">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8163">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8164">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8165">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8166">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8167">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8168">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8169">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8170">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8171">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8172">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8173">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8174">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8175">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8176">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8177">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8178">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8179">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8180">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8181">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8182">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8183">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8184">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8185">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8186">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8187">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8188">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8189">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8190">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8191">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8192">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8193">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8194">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8195">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8196">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8197">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8198">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8199">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8200">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8201">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8202">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8203">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8204">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8205">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8206">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8207">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8208">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8209">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8210">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8211">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8212">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8213">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8214">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8215">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8216">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8217">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8218">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8219">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8220">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8221">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8222">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8223">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8224">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8225">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8226">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8227">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8228">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8229">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8230">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8231">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8232">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8233">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8234">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8235">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8236">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8237">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8238">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8239">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8240">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8241">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8242">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8243">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8244">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8245">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8246">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleFillSymbol id="8247">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8248" xlink:type="simple" xlink:href="states#id(''8248'')" />
    </color>
    <description type="string">Megaruma</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8249" xlink:type="simple" xlink:href="states#id(''8249'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8248">
    <red type="integer">102</red>
    <blue type="integer">102</blue>
    <green type="integer">102</green>
    <alpha type="integer">130</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8249">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8250" xlink:type="simple" xlink:href="states#id(''8250'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8250">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8251">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8252" xlink:type="simple" xlink:href="states#id(''8252'')" />
    </color>
    <description type="string">Messalo</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8253" xlink:type="simple" xlink:href="states#id(''8253'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8252">
    <red type="integer">204</red>
    <blue type="integer">0</blue>
    <green type="integer">204</green>
    <alpha type="integer">130</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8253">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8254" xlink:type="simple" xlink:href="states#id(''8254'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8254">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8255">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8256" xlink:type="simple" xlink:href="states#id(''8256'')" />
    </color>
    <description type="string">Montepuez</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8257" xlink:type="simple" xlink:href="states#id(''8257'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8256">
    <red type="integer">147</red>
    <blue type="integer">45</blue>
    <green type="integer">45</green>
    <alpha type="integer">130</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8257">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8258" xlink:type="simple" xlink:href="states#id(''8258'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8258">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8259">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8263" xlink:type="simple" xlink:href="states#id(''8263'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8260" xlink:type="simple" xlink:href="states#id(''8260'')" />
    </color>
    <description type="string">Orla maritima 1</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8261" xlink:type="simple" xlink:href="states#id(''8261'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8260">
    <red type="integer">36</red>
    <blue type="integer">122</blue>
    <green type="integer">88</green>
    <alpha type="integer">130</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8261">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8262" xlink:type="simple" xlink:href="states#id(''8262'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8262">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8263">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8264" xlink:type="simple" xlink:href="states#id(''8264'')" />
    </color>
    <description type="string">Orla maritima 1 version for selection</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8265" xlink:type="simple" xlink:href="states#id(''8265'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8264">
    <red type="integer">255</red>
    <blue type="integer">0</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8265">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8266" xlink:type="simple" xlink:href="states#id(''8266'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8266">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8267">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8270" xlink:type="simple" xlink:href="states#id(''8270'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8260" xlink:type="simple" xlink:href="states#id(''8260'')" />
    </color>
    <description type="string">Orla maritima 2</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8268" xlink:type="simple" xlink:href="states#id(''8268'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__SimpleLineSymbol id="8268">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8269" xlink:type="simple" xlink:href="states#id(''8269'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8269">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8270">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8264" xlink:type="simple" xlink:href="states#id(''8264'')" />
    </color>
    <description type="string">Orla maritima 2 version for selection</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8271" xlink:type="simple" xlink:href="states#id(''8271'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__SimpleLineSymbol id="8271">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8272" xlink:type="simple" xlink:href="states#id(''8272'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8272">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8273">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8260" xlink:type="simple" xlink:href="states#id(''8260'')" />
    </color>
    <description type="string">Orla maritima 3</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8274" xlink:type="simple" xlink:href="states#id(''8274'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__SimpleLineSymbol id="8274">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8275" xlink:type="simple" xlink:href="states#id(''8275'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8275">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8276">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8280" xlink:type="simple" xlink:href="states#id(''8280'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8277" xlink:type="simple" xlink:href="states#id(''8277'')" />
    </color>
    <description type="string">Rovuma</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8278" xlink:type="simple" xlink:href="states#id(''8278'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8277">
    <red type="integer">157</red>
    <blue type="integer">139</blue>
    <green type="integer">218</green>
    <alpha type="integer">155</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8278">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8279" xlink:type="simple" xlink:href="states#id(''8279'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8279">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.5</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8280">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8264" xlink:type="simple" xlink:href="states#id(''8264'')" />
    </color>
    <description type="string">Rovuma version for selection</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8281" xlink:type="simple" xlink:href="states#id(''8281'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__SimpleLineSymbol id="8281">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8141" xlink:type="simple" xlink:href="states#id(''8141'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8282" xlink:type="simple" xlink:href="states#id(''8282'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8282">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8283" xlink:type="simple" xlink:href="states#id(''8283'')" />
<states>
  <Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME id="8283">
    <zoomConstraints type="reference">
        <reference id_state="8291" xlink:type="simple" xlink:href="states#id(''8291'')" />
    </zoomConstraints>
    <unit type="integer">-1</unit>
    <allowOverlapping type="boolean">false</allowOverlapping>
    <placementConstraints type="reference">
        <reference id_state="8290" xlink:type="simple" xlink:href="states#id(''8290'')" />
    </placementConstraints>
    <referenceSystem type="integer">0</referenceSystem>
    <labelingMethod type="reference">
        <reference id_state="8284" xlink:type="simple" xlink:href="states#id(''8284'')" />
    </labelingMethod>
  </Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME>
  <Persistence__DefaultLabelingMethod id="8284">
    <defaultLabel type="reference">
        <reference id_state="8285" xlink:type="simple" xlink:href="states#id(''8285'')" />
    </defaultLabel>
  </Persistence__DefaultLabelingMethod>
  <Persistence__LabelClass id="8285">
    <texts type="list">
      <item type="string">Rovuma</item>
    </texts>
    <unit type="integer">-1</unit>
    <scale type="double">1.3333333333333333</scale>
    <sqlQuery type="string"></sqlQuery>
    <visible type="boolean">true</visible>
    <labelExpressions type="list">
      <item type="string">nome</item>
    </labelExpressions>
    <priority type="integer">0</priority>
    <referenceSystem type="integer">0</referenceSystem>
    <name type="string"></name>
    <textSymbol type="reference">
        <reference id_state="8286" xlink:type="simple" xlink:href="states#id(''8286'')" />
    </textSymbol>
    <useSQL type="boolean">false</useSQL>
  </Persistence__LabelClass>
  <Persistence__SimpleTextSymbol id="8286">
    <haloWidth type="float">2.0</haloWidth>
    <unit type="integer">-1</unit>
    <textColor type="reference">
        <reference id_state="8288" xlink:type="simple" xlink:href="states#id(''8288'')" />
    </textColor>
    <text type="string">Rovuma</text>
    <hasHalo type="boolean">true</hasHalo>
    <rotation type="double">0.0</rotation>
    <font type="reference">
        <reference id_state="8287" xlink:type="simple" xlink:href="states#id(''8287'')" />
    </font>
    <description type="null"></description>
    <autoResize type="boolean">false</autoResize>
    <referenceSystem type="integer">0</referenceSystem>
    <haloColor type="reference">
        <reference id_state="8289" xlink:type="simple" xlink:href="states#id(''8289'')" />
    </haloColor>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleTextSymbol>
  <Persistence__AwtFont id="8287">
    <style type="integer">0</style>
    <name type="string">Tahoma</name>
    <size type="integer">10</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="8288">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8289">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__POLYGON_PLACE_CONSTRAINTS id="8290">
    <aboveTheLine type="boolean">false</aboveTheLine>
    <duplicateLabelsMode type="integer">2</duplicateLabelsMode>
    <belowTheLine type="boolean">false</belowTheLine>
    <fitInsidePolygon type="boolean">true</fitInsidePolygon>
    <onTheLine type="boolean">false</onTheLine>
    <locationAlongLine type="integer">0</locationAlongLine>
    <pageOriented type="boolean">false</pageOriented>
    <placementMode type="integer">9</placementMode>
  </Persistence__POLYGON_PLACE_CONSTRAINTS>
  <Persistence__ZoomConstraintsImpl id="8291">
    <minScale type="long">-1</minScale>
    <maxScale type="long">-1</maxScale>
    <mode type="integer">0</mode>
  </Persistence__ZoomConstraintsImpl>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('zp_albufeiras', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8477" xlink:type="simple" xlink:href="states#id(''8477'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8477">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8478" xlink:type="simple" xlink:href="states#id(''8478'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8478">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8479" xlink:type="simple" xlink:href="states#id(''8479'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8480" xlink:type="simple" xlink:href="states#id(''8480'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8479">
    <red type="integer">255</red>
    <blue type="integer">204</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8480">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8481" xlink:type="simple" xlink:href="states#id(''8481'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8482" xlink:type="simple" xlink:href="states#id(''8482'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8481">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8482">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </tempDashArray>
    <dashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('hoteis', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8292" xlink:type="simple" xlink:href="states#id(''8292'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8292">
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8293" xlink:type="simple" xlink:href="states#id(''8293'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__PictureMarkerSymbol id="8293">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="8300" xlink:type="simple" xlink:href="states#id(''8300'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8296" xlink:type="simple" xlink:href="states#id(''8296'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8294" xlink:type="simple" xlink:href="states#id(''8294'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8299" xlink:type="simple" xlink:href="states#id(''8299'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8295" xlink:type="simple" xlink:href="states#id(''8295'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="8294">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="8295">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="8296">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="8298" xlink:type="simple" xlink:href="states#id(''8298'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8296" xlink:type="simple" xlink:href="states#id(''8296'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8294" xlink:type="simple" xlink:href="states#id(''8294'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Hotel</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8297" xlink:type="simple" xlink:href="states#id(''8297'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8295" xlink:type="simple" xlink:href="states#id(''8295'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="8297">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Hotel.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/Hotel.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8298">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Hotel_sel.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/Hotel_sel.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8299">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Hotel.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/Hotel.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8300">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Hotel_sel.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/Hotel_sel.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('centros_saude', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8301" xlink:type="simple" xlink:href="states#id(''8301'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8301">
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8302" xlink:type="simple" xlink:href="states#id(''8302'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__PictureMarkerSymbol id="8302">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="8309" xlink:type="simple" xlink:href="states#id(''8309'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8305" xlink:type="simple" xlink:href="states#id(''8305'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8303" xlink:type="simple" xlink:href="states#id(''8303'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8308" xlink:type="simple" xlink:href="states#id(''8308'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8304" xlink:type="simple" xlink:href="states#id(''8304'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="8303">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="8304">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="8305">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="8307" xlink:type="simple" xlink:href="states#id(''8307'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8305" xlink:type="simple" xlink:href="states#id(''8305'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8303" xlink:type="simple" xlink:href="states#id(''8303'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Health</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8306" xlink:type="simple" xlink:href="states#id(''8306'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8304" xlink:type="simple" xlink:href="states#id(''8304'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="8306">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Health.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Health.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8307">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Health_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Health_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8308">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Health.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Health.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8309">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Health_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Health_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('centro_educacional', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8310" xlink:type="simple" xlink:href="states#id(''8310'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8310">
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8311" xlink:type="simple" xlink:href="states#id(''8311'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__PictureMarkerSymbol id="8311">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="8318" xlink:type="simple" xlink:href="states#id(''8318'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8314" xlink:type="simple" xlink:href="states#id(''8314'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8312" xlink:type="simple" xlink:href="states#id(''8312'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8317" xlink:type="simple" xlink:href="states#id(''8317'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8313" xlink:type="simple" xlink:href="states#id(''8313'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="8312">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="8313">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="8314">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="8316" xlink:type="simple" xlink:href="states#id(''8316'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8314" xlink:type="simple" xlink:href="states#id(''8314'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8312" xlink:type="simple" xlink:href="states#id(''8312'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">School</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8315" xlink:type="simple" xlink:href="states#id(''8315'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8313" xlink:type="simple" xlink:href="states#id(''8313'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="8315">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/School.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/School.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8316">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/School_sel.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/School_sel.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8317">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/School.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/School.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8318">
    <source type="url"><![CDATA[file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/School_sel.png]]></source>
    <sourceSymbolInLibrary type="string"><![CDATA[Simbologia_SIXHIARA/School_sel.png]]></sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('bombas_combustivel', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8328" xlink:type="simple" xlink:href="states#id(''8328'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8328">
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8329" xlink:type="simple" xlink:href="states#id(''8329'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__PictureMarkerSymbol id="8329">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="8336" xlink:type="simple" xlink:href="states#id(''8336'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8332" xlink:type="simple" xlink:href="states#id(''8332'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8330" xlink:type="simple" xlink:href="states#id(''8330'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8335" xlink:type="simple" xlink:href="states#id(''8335'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8331" xlink:type="simple" xlink:href="states#id(''8331'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="8330">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="8331">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="8332">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="8334" xlink:type="simple" xlink:href="states#id(''8334'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="8332" xlink:type="simple" xlink:href="states#id(''8332'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8330" xlink:type="simple" xlink:href="states#id(''8330'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Gas station</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="8333" xlink:type="simple" xlink:href="states#id(''8333'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="8331" xlink:type="simple" xlink:href="states#id(''8331'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="8333">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Gas%20station.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Gas%20station.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8334">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Gas%20station_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Gas%20station_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8335">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Gas%20station.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Gas%20station.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="8336">
    <source type="url">file:/C:/gvsig-desktop-2.2.0-2313-final-win-x86/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Gas%20station_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Gas%20station_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('lixeira', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8337" xlink:type="simple" xlink:href="states#id(''8337'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8337">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8338" xlink:type="simple" xlink:href="states#id(''8338'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8338">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8339" xlink:type="simple" xlink:href="states#id(''8339'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8340" xlink:type="simple" xlink:href="states#id(''8340'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8339">
    <red type="integer">153</red>
    <blue type="integer">0</blue>
    <green type="integer">102</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8340">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8341" xlink:type="simple" xlink:href="states#id(''8341'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8342" xlink:type="simple" xlink:href="states#id(''8342'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8341">
    <red type="integer">102</red>
    <blue type="integer">0</blue>
    <green type="integer">51</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8342">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('zp_nascentes', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8343" xlink:type="simple" xlink:href="states#id(''8343'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8343">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8344" xlink:type="simple" xlink:href="states#id(''8344'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8344">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8345" xlink:type="simple" xlink:href="states#id(''8345'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8346" xlink:type="simple" xlink:href="states#id(''8346'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8345">
    <red type="integer">102</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">56</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8346">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8347" xlink:type="simple" xlink:href="states#id(''8347'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8348" xlink:type="simple" xlink:href="states#id(''8348'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8347">
    <red type="integer">128</red>
    <blue type="integer">128</blue>
    <green type="integer">128</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8348">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </tempDashArray>
    <dashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('zp_fontes', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8349" xlink:type="simple" xlink:href="states#id(''8349'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="8349">
    <nullValueSymbol type="null"></nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="integer">50</key>
        <value type="reference">
        <reference id_state="8455" xlink:type="simple" xlink:href="states#id(''8455'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">100</key>
        <value type="reference">
        <reference id_state="8459" xlink:type="simple" xlink:href="states#id(''8459'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">150</key>
        <value type="reference">
        <reference id_state="8463" xlink:type="simple" xlink:href="states#id(''8463'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">250</key>
        <value type="reference">
        <reference id_state="8467" xlink:type="simple" xlink:href="states#id(''8467'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">false</useDefaultSymbol>
    <keys type="list">
      <item type="integer">50</item>
      <item type="integer">100</item>
      <item type="integer">150</item>
      <item type="integer">250</item>
    </keys>
    <fieldNames type="list">
      <item type="string">peri_prot</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="8355" xlink:type="simple" xlink:href="states#id(''8355'')" />
      </item>
      <item type="reference">
        <reference id_state="8356" xlink:type="simple" xlink:href="states#id(''8356'')" />
      </item>
      <item type="reference">
        <reference id_state="8357" xlink:type="simple" xlink:href="states#id(''8357'')" />
      </item>
      <item type="reference">
        <reference id_state="8358" xlink:type="simple" xlink:href="states#id(''8358'')" />
      </item>
      <item type="reference">
        <reference id_state="8359" xlink:type="simple" xlink:href="states#id(''8359'')" />
      </item>
      <item type="reference">
        <reference id_state="8360" xlink:type="simple" xlink:href="states#id(''8360'')" />
      </item>
      <item type="reference">
        <reference id_state="8361" xlink:type="simple" xlink:href="states#id(''8361'')" />
      </item>
      <item type="reference">
        <reference id_state="8362" xlink:type="simple" xlink:href="states#id(''8362'')" />
      </item>
      <item type="reference">
        <reference id_state="8363" xlink:type="simple" xlink:href="states#id(''8363'')" />
      </item>
      <item type="reference">
        <reference id_state="8364" xlink:type="simple" xlink:href="states#id(''8364'')" />
      </item>
      <item type="reference">
        <reference id_state="8365" xlink:type="simple" xlink:href="states#id(''8365'')" />
      </item>
      <item type="reference">
        <reference id_state="8366" xlink:type="simple" xlink:href="states#id(''8366'')" />
      </item>
      <item type="reference">
        <reference id_state="8367" xlink:type="simple" xlink:href="states#id(''8367'')" />
      </item>
      <item type="reference">
        <reference id_state="8368" xlink:type="simple" xlink:href="states#id(''8368'')" />
      </item>
      <item type="reference">
        <reference id_state="8369" xlink:type="simple" xlink:href="states#id(''8369'')" />
      </item>
      <item type="reference">
        <reference id_state="8370" xlink:type="simple" xlink:href="states#id(''8370'')" />
      </item>
      <item type="reference">
        <reference id_state="8371" xlink:type="simple" xlink:href="states#id(''8371'')" />
      </item>
      <item type="reference">
        <reference id_state="8372" xlink:type="simple" xlink:href="states#id(''8372'')" />
      </item>
      <item type="reference">
        <reference id_state="8373" xlink:type="simple" xlink:href="states#id(''8373'')" />
      </item>
      <item type="reference">
        <reference id_state="8374" xlink:type="simple" xlink:href="states#id(''8374'')" />
      </item>
      <item type="reference">
        <reference id_state="8375" xlink:type="simple" xlink:href="states#id(''8375'')" />
      </item>
      <item type="reference">
        <reference id_state="8376" xlink:type="simple" xlink:href="states#id(''8376'')" />
      </item>
      <item type="reference">
        <reference id_state="8377" xlink:type="simple" xlink:href="states#id(''8377'')" />
      </item>
      <item type="reference">
        <reference id_state="8378" xlink:type="simple" xlink:href="states#id(''8378'')" />
      </item>
      <item type="reference">
        <reference id_state="8379" xlink:type="simple" xlink:href="states#id(''8379'')" />
      </item>
      <item type="reference">
        <reference id_state="8380" xlink:type="simple" xlink:href="states#id(''8380'')" />
      </item>
      <item type="reference">
        <reference id_state="8381" xlink:type="simple" xlink:href="states#id(''8381'')" />
      </item>
      <item type="reference">
        <reference id_state="8382" xlink:type="simple" xlink:href="states#id(''8382'')" />
      </item>
      <item type="reference">
        <reference id_state="8383" xlink:type="simple" xlink:href="states#id(''8383'')" />
      </item>
      <item type="reference">
        <reference id_state="8384" xlink:type="simple" xlink:href="states#id(''8384'')" />
      </item>
      <item type="reference">
        <reference id_state="8385" xlink:type="simple" xlink:href="states#id(''8385'')" />
      </item>
      <item type="reference">
        <reference id_state="8386" xlink:type="simple" xlink:href="states#id(''8386'')" />
      </item>
      <item type="reference">
        <reference id_state="8387" xlink:type="simple" xlink:href="states#id(''8387'')" />
      </item>
      <item type="reference">
        <reference id_state="8388" xlink:type="simple" xlink:href="states#id(''8388'')" />
      </item>
      <item type="reference">
        <reference id_state="8389" xlink:type="simple" xlink:href="states#id(''8389'')" />
      </item>
      <item type="reference">
        <reference id_state="8390" xlink:type="simple" xlink:href="states#id(''8390'')" />
      </item>
      <item type="reference">
        <reference id_state="8391" xlink:type="simple" xlink:href="states#id(''8391'')" />
      </item>
      <item type="reference">
        <reference id_state="8392" xlink:type="simple" xlink:href="states#id(''8392'')" />
      </item>
      <item type="reference">
        <reference id_state="8393" xlink:type="simple" xlink:href="states#id(''8393'')" />
      </item>
      <item type="reference">
        <reference id_state="8394" xlink:type="simple" xlink:href="states#id(''8394'')" />
      </item>
      <item type="reference">
        <reference id_state="8395" xlink:type="simple" xlink:href="states#id(''8395'')" />
      </item>
      <item type="reference">
        <reference id_state="8396" xlink:type="simple" xlink:href="states#id(''8396'')" />
      </item>
      <item type="reference">
        <reference id_state="8397" xlink:type="simple" xlink:href="states#id(''8397'')" />
      </item>
      <item type="reference">
        <reference id_state="8398" xlink:type="simple" xlink:href="states#id(''8398'')" />
      </item>
      <item type="reference">
        <reference id_state="8399" xlink:type="simple" xlink:href="states#id(''8399'')" />
      </item>
      <item type="reference">
        <reference id_state="8400" xlink:type="simple" xlink:href="states#id(''8400'')" />
      </item>
      <item type="reference">
        <reference id_state="8401" xlink:type="simple" xlink:href="states#id(''8401'')" />
      </item>
      <item type="reference">
        <reference id_state="8402" xlink:type="simple" xlink:href="states#id(''8402'')" />
      </item>
      <item type="reference">
        <reference id_state="8403" xlink:type="simple" xlink:href="states#id(''8403'')" />
      </item>
      <item type="reference">
        <reference id_state="8404" xlink:type="simple" xlink:href="states#id(''8404'')" />
      </item>
      <item type="reference">
        <reference id_state="8405" xlink:type="simple" xlink:href="states#id(''8405'')" />
      </item>
      <item type="reference">
        <reference id_state="8406" xlink:type="simple" xlink:href="states#id(''8406'')" />
      </item>
      <item type="reference">
        <reference id_state="8407" xlink:type="simple" xlink:href="states#id(''8407'')" />
      </item>
      <item type="reference">
        <reference id_state="8408" xlink:type="simple" xlink:href="states#id(''8408'')" />
      </item>
      <item type="reference">
        <reference id_state="8409" xlink:type="simple" xlink:href="states#id(''8409'')" />
      </item>
      <item type="reference">
        <reference id_state="8410" xlink:type="simple" xlink:href="states#id(''8410'')" />
      </item>
      <item type="reference">
        <reference id_state="8411" xlink:type="simple" xlink:href="states#id(''8411'')" />
      </item>
      <item type="reference">
        <reference id_state="8412" xlink:type="simple" xlink:href="states#id(''8412'')" />
      </item>
      <item type="reference">
        <reference id_state="8413" xlink:type="simple" xlink:href="states#id(''8413'')" />
      </item>
      <item type="reference">
        <reference id_state="8414" xlink:type="simple" xlink:href="states#id(''8414'')" />
      </item>
      <item type="reference">
        <reference id_state="8415" xlink:type="simple" xlink:href="states#id(''8415'')" />
      </item>
      <item type="reference">
        <reference id_state="8416" xlink:type="simple" xlink:href="states#id(''8416'')" />
      </item>
      <item type="reference">
        <reference id_state="8417" xlink:type="simple" xlink:href="states#id(''8417'')" />
      </item>
      <item type="reference">
        <reference id_state="8418" xlink:type="simple" xlink:href="states#id(''8418'')" />
      </item>
      <item type="reference">
        <reference id_state="8419" xlink:type="simple" xlink:href="states#id(''8419'')" />
      </item>
      <item type="reference">
        <reference id_state="8420" xlink:type="simple" xlink:href="states#id(''8420'')" />
      </item>
      <item type="reference">
        <reference id_state="8421" xlink:type="simple" xlink:href="states#id(''8421'')" />
      </item>
      <item type="reference">
        <reference id_state="8422" xlink:type="simple" xlink:href="states#id(''8422'')" />
      </item>
      <item type="reference">
        <reference id_state="8423" xlink:type="simple" xlink:href="states#id(''8423'')" />
      </item>
      <item type="reference">
        <reference id_state="8424" xlink:type="simple" xlink:href="states#id(''8424'')" />
      </item>
      <item type="reference">
        <reference id_state="8425" xlink:type="simple" xlink:href="states#id(''8425'')" />
      </item>
      <item type="reference">
        <reference id_state="8426" xlink:type="simple" xlink:href="states#id(''8426'')" />
      </item>
      <item type="reference">
        <reference id_state="8427" xlink:type="simple" xlink:href="states#id(''8427'')" />
      </item>
      <item type="reference">
        <reference id_state="8428" xlink:type="simple" xlink:href="states#id(''8428'')" />
      </item>
      <item type="reference">
        <reference id_state="8429" xlink:type="simple" xlink:href="states#id(''8429'')" />
      </item>
      <item type="reference">
        <reference id_state="8430" xlink:type="simple" xlink:href="states#id(''8430'')" />
      </item>
      <item type="reference">
        <reference id_state="8431" xlink:type="simple" xlink:href="states#id(''8431'')" />
      </item>
      <item type="reference">
        <reference id_state="8432" xlink:type="simple" xlink:href="states#id(''8432'')" />
      </item>
      <item type="reference">
        <reference id_state="8433" xlink:type="simple" xlink:href="states#id(''8433'')" />
      </item>
      <item type="reference">
        <reference id_state="8434" xlink:type="simple" xlink:href="states#id(''8434'')" />
      </item>
      <item type="reference">
        <reference id_state="8435" xlink:type="simple" xlink:href="states#id(''8435'')" />
      </item>
      <item type="reference">
        <reference id_state="8436" xlink:type="simple" xlink:href="states#id(''8436'')" />
      </item>
      <item type="reference">
        <reference id_state="8437" xlink:type="simple" xlink:href="states#id(''8437'')" />
      </item>
      <item type="reference">
        <reference id_state="8438" xlink:type="simple" xlink:href="states#id(''8438'')" />
      </item>
      <item type="reference">
        <reference id_state="8439" xlink:type="simple" xlink:href="states#id(''8439'')" />
      </item>
      <item type="reference">
        <reference id_state="8440" xlink:type="simple" xlink:href="states#id(''8440'')" />
      </item>
      <item type="reference">
        <reference id_state="8441" xlink:type="simple" xlink:href="states#id(''8441'')" />
      </item>
      <item type="reference">
        <reference id_state="8442" xlink:type="simple" xlink:href="states#id(''8442'')" />
      </item>
      <item type="reference">
        <reference id_state="8443" xlink:type="simple" xlink:href="states#id(''8443'')" />
      </item>
      <item type="reference">
        <reference id_state="8444" xlink:type="simple" xlink:href="states#id(''8444'')" />
      </item>
      <item type="reference">
        <reference id_state="8445" xlink:type="simple" xlink:href="states#id(''8445'')" />
      </item>
      <item type="reference">
        <reference id_state="8446" xlink:type="simple" xlink:href="states#id(''8446'')" />
      </item>
      <item type="reference">
        <reference id_state="8447" xlink:type="simple" xlink:href="states#id(''8447'')" />
      </item>
      <item type="reference">
        <reference id_state="8448" xlink:type="simple" xlink:href="states#id(''8448'')" />
      </item>
      <item type="reference">
        <reference id_state="8449" xlink:type="simple" xlink:href="states#id(''8449'')" />
      </item>
      <item type="reference">
        <reference id_state="8450" xlink:type="simple" xlink:href="states#id(''8450'')" />
      </item>
      <item type="reference">
        <reference id_state="8451" xlink:type="simple" xlink:href="states#id(''8451'')" />
      </item>
      <item type="reference">
        <reference id_state="8452" xlink:type="simple" xlink:href="states#id(''8452'')" />
      </item>
      <item type="reference">
        <reference id_state="8453" xlink:type="simple" xlink:href="states#id(''8453'')" />
      </item>
      <item type="reference">
        <reference id_state="8454" xlink:type="simple" xlink:href="states#id(''8454'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">9</shapeType>
    <fieldTypes type="list">
      <item type="integer">4</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8350" xlink:type="simple" xlink:href="states#id(''8350'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleFillSymbol id="8350">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8351" xlink:type="simple" xlink:href="states#id(''8351'')" />
    </color>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8352" xlink:type="simple" xlink:href="states#id(''8352'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8351">
    <red type="integer">159</red>
    <blue type="integer">43</blue>
    <green type="integer">116</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8352">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8353" xlink:type="simple" xlink:href="states#id(''8353'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8354" xlink:type="simple" xlink:href="states#id(''8354'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8353">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8354">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__AwtColor id="8355">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8356">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8357">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8358">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8359">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8360">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8361">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8362">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8363">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8364">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8365">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8366">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8367">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8368">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8369">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8370">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8371">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8372">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8373">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8374">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8375">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8376">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8377">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8378">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8379">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8380">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8381">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8382">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8383">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8384">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8385">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8386">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8387">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8388">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8389">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8390">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8391">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8392">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8393">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8394">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8395">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8396">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8397">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8398">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8399">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8400">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8401">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8402">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8403">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8404">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8405">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8406">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8407">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8408">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8409">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8410">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8411">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8412">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8413">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8414">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8415">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8416">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8417">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8418">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8419">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8420">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8421">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8422">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8423">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8424">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8425">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8426">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8427">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8428">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8429">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8430">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8431">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8432">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8433">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8434">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8435">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8436">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8437">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8438">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8439">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8440">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8441">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8442">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8443">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8444">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8445">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8446">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8447">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8448">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8449">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8450">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8451">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8452">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8453">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8454">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleFillSymbol id="8455">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8456" xlink:type="simple" xlink:href="states#id(''8456'')" />
    </color>
    <description type="string">50</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8457" xlink:type="simple" xlink:href="states#id(''8457'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8456">
    <red type="integer">51</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">130</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8457">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8353" xlink:type="simple" xlink:href="states#id(''8353'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8458" xlink:type="simple" xlink:href="states#id(''8458'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8458">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8459">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8460" xlink:type="simple" xlink:href="states#id(''8460'')" />
    </color>
    <description type="string">100</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8461" xlink:type="simple" xlink:href="states#id(''8461'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8460">
    <red type="integer">153</red>
    <blue type="integer">0</blue>
    <green type="integer">51</green>
    <alpha type="integer">130</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8461">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8353" xlink:type="simple" xlink:href="states#id(''8353'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8462" xlink:type="simple" xlink:href="states#id(''8462'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8462">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8463">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8464" xlink:type="simple" xlink:href="states#id(''8464'')" />
    </color>
    <description type="string">150</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8465" xlink:type="simple" xlink:href="states#id(''8465'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8464">
    <red type="integer">153</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">130</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8465">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8353" xlink:type="simple" xlink:href="states#id(''8353'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8466" xlink:type="simple" xlink:href="states#id(''8466'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8466">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8467">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8468" xlink:type="simple" xlink:href="states#id(''8468'')" />
    </color>
    <description type="string">250</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8469" xlink:type="simple" xlink:href="states#id(''8469'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8468">
    <red type="integer">0</red>
    <blue type="integer">102</blue>
    <green type="integer">51</green>
    <alpha type="integer">105</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8469">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8353" xlink:type="simple" xlink:href="states#id(''8353'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8470" xlink:type="simple" xlink:href="states#id(''8470'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8470">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('zp_costa', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8471" xlink:type="simple" xlink:href="states#id(''8471'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8471">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8472" xlink:type="simple" xlink:href="states#id(''8472'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8472">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8473" xlink:type="simple" xlink:href="states#id(''8473'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8474" xlink:type="simple" xlink:href="states#id(''8474'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8473">
    <red type="integer">102</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">55</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8474">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8475" xlink:type="simple" xlink:href="states#id(''8475'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8476" xlink:type="simple" xlink:href="states#id(''8476'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8475">
    <red type="integer">128</red>
    <blue type="integer">128</blue>
    <green type="integer">128</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8476">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </tempDashArray>
    <dashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('provincia', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8483" xlink:type="simple" xlink:href="states#id(''8483'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8483">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8484" xlink:type="simple" xlink:href="states#id(''8484'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8484">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8485" xlink:type="simple" xlink:href="states#id(''8485'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8486" xlink:type="simple" xlink:href="states#id(''8486'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8485">
    <red type="integer">255</red>
    <blue type="integer">204</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8486">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8487" xlink:type="simple" xlink:href="states#id(''8487'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8488" xlink:type="simple" xlink:href="states#id(''8488'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8487">
    <red type="integer">204</red>
    <blue type="integer">251</blue>
    <green type="integer">170</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8488">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="list">
      <item type="float">5.0</item>
      <item type="float">5.0</item>
    </tempDashArray>
    <dashArray type="list">
      <item type="float">5.0</item>
      <item type="float">5.0</item>
    </dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8489" xlink:type="simple" xlink:href="states#id(''8489'')" />
<states>
  <Persistence__AttrInTableLabelingStrategy id="8489">
    <zoomConstraints type="null"></zoomConstraints>
    <HeightField type="null"></HeightField>
    <useFixedColor type="boolean">true</useFixedColor>
    <ColorField type="null"></ColorField>
    <fixedSize type="double">10.0</fixedSize>
    <RotationField type="null"></RotationField>
    <fixedColor type="reference">
        <reference id_state="8491" xlink:type="simple" xlink:href="states#id(''8491'')" />
    </fixedColor>
    <font type="reference">
        <reference id_state="8490" xlink:type="simple" xlink:href="states#id(''8490'')" />
    </font>
    <referenceSystem type="integer">0</referenceSystem>
    <useFixedSize type="boolean">true</useFixedSize>
    <colorFont type="null"></colorFont>
    <TextField type="string">provincia</TextField>
    <Unit type="integer">-1</Unit>
    <labelingMethod type="reference">
        <reference id_state="8492" xlink:type="simple" xlink:href="states#id(''8492'')" />
    </labelingMethod>
  </Persistence__AttrInTableLabelingStrategy>
  <Persistence__AwtFont id="8490">
    <style type="integer">0</style>
    <name type="string">Tahoma</name>
    <size type="integer">24</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="8491">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__DefaultLabelingMethod id="8492">
    <defaultLabel type="null"></defaultLabel>
  </Persistence__DefaultLabelingMethod>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('distritos', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8493" xlink:type="simple" xlink:href="states#id(''8493'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8493">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8494" xlink:type="simple" xlink:href="states#id(''8494'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8494">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8495" xlink:type="simple" xlink:href="states#id(''8495'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8496" xlink:type="simple" xlink:href="states#id(''8496'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8495">
    <red type="integer">255</red>
    <blue type="integer">204</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8496">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8497" xlink:type="simple" xlink:href="states#id(''8497'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8498" xlink:type="simple" xlink:href="states#id(''8498'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8497">
    <red type="integer">204</red>
    <blue type="integer">251</blue>
    <green type="integer">170</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8498">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="list">
      <item type="float">5.0</item>
      <item type="float">5.0</item>
    </tempDashArray>
    <dashArray type="list">
      <item type="float">5.0</item>
      <item type="float">5.0</item>
    </dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8499" xlink:type="simple" xlink:href="states#id(''8499'')" />
<states>
  <Persistence__AttrInTableLabelingStrategy id="8499">
    <zoomConstraints type="null"></zoomConstraints>
    <HeightField type="null"></HeightField>
    <useFixedColor type="boolean">true</useFixedColor>
    <ColorField type="null"></ColorField>
    <fixedSize type="double">8.0</fixedSize>
    <RotationField type="null"></RotationField>
    <fixedColor type="reference">
        <reference id_state="8501" xlink:type="simple" xlink:href="states#id(''8501'')" />
    </fixedColor>
    <font type="reference">
        <reference id_state="8500" xlink:type="simple" xlink:href="states#id(''8500'')" />
    </font>
    <referenceSystem type="integer">0</referenceSystem>
    <useFixedSize type="boolean">true</useFixedSize>
    <colorFont type="null"></colorFont>
    <TextField type="string">distrito</TextField>
    <Unit type="integer">-1</Unit>
    <labelingMethod type="reference">
        <reference id_state="8502" xlink:type="simple" xlink:href="states#id(''8502'')" />
    </labelingMethod>
  </Persistence__AttrInTableLabelingStrategy>
  <Persistence__AwtFont id="8500">
    <style type="integer">0</style>
    <name type="string">Tahoma</name>
    <size type="integer">14</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="8501">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__DefaultLabelingMethod id="8502">
    <defaultLabel type="null"></defaultLabel>
  </Persistence__DefaultLabelingMethod>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('postos_administrativos', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8503" xlink:type="simple" xlink:href="states#id(''8503'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8503">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8504" xlink:type="simple" xlink:href="states#id(''8504'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8504">
    <hasFill type="boolean">false</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8505" xlink:type="simple" xlink:href="states#id(''8505'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8506" xlink:type="simple" xlink:href="states#id(''8506'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8505">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8506">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8507" xlink:type="simple" xlink:href="states#id(''8507'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8508" xlink:type="simple" xlink:href="states#id(''8508'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8507">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8508">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </tempDashArray>
    <dashArray type="list">
      <item type="float">2.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">1.0</item>
      <item type="float">2.0</item>
      <item type="float">1.0</item>
    </dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8509" xlink:type="simple" xlink:href="states#id(''8509'')" />
<states>
  <Persistence__AttrInTableLabelingStrategy id="8509">
    <zoomConstraints type="null"></zoomConstraints>
    <HeightField type="null"></HeightField>
    <useFixedColor type="boolean">true</useFixedColor>
    <ColorField type="null"></ColorField>
    <fixedSize type="double">8.0</fixedSize>
    <RotationField type="null"></RotationField>
    <fixedColor type="reference">
        <reference id_state="8511" xlink:type="simple" xlink:href="states#id(''8511'')" />
    </fixedColor>
    <font type="reference">
        <reference id_state="8510" xlink:type="simple" xlink:href="states#id(''8510'')" />
    </font>
    <referenceSystem type="integer">0</referenceSystem>
    <useFixedSize type="boolean">true</useFixedSize>
    <colorFont type="null"></colorFont>
    <TextField type="string">posto</TextField>
    <Unit type="integer">-1</Unit>
    <labelingMethod type="reference">
        <reference id_state="8512" xlink:type="simple" xlink:href="states#id(''8512'')" />
    </labelingMethod>
  </Persistence__AttrInTableLabelingStrategy>
  <Persistence__AwtFont id="8510">
    <style type="integer">0</style>
    <name type="string">SansSerif</name>
    <size type="integer">14</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="8511">
    <red type="integer">70</red>
    <blue type="integer">70</blue>
    <green type="integer">70</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__DefaultLabelingMethod id="8512">
    <defaultLabel type="null"></defaultLabel>
  </Persistence__DefaultLabelingMethod>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('grandes_lagos', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8513" xlink:type="simple" xlink:href="states#id(''8513'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8513">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8514" xlink:type="simple" xlink:href="states#id(''8514'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8514">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8515" xlink:type="simple" xlink:href="states#id(''8515'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8516" xlink:type="simple" xlink:href="states#id(''8516'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8515">
    <red type="integer">190</red>
    <blue type="integer">255</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8516">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8519" xlink:type="simple" xlink:href="states#id(''8519'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8517" xlink:type="simple" xlink:href="states#id(''8517'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8518" xlink:type="simple" xlink:href="states#id(''8518'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8517">
    <red type="integer">204</red>
    <blue type="integer">251</blue>
    <green type="integer">170</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8518">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8519">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8520" xlink:type="simple" xlink:href="states#id(''8520'')" />
    </color>
    <description type="string">version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8521" xlink:type="simple" xlink:href="states#id(''8521'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8520">
    <red type="integer">255</red>
    <blue type="integer">0</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8521">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('paises_limitrofes', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8522" xlink:type="simple" xlink:href="states#id(''8522'')" />
<states>
  <Persistence__SimgleSymbolLegend id="8522">
    <shapeType type="integer">9</shapeType>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8523" xlink:type="simple" xlink:href="states#id(''8523'')" />
    </defaultSymbol>
  </Persistence__SimgleSymbolLegend>
  <Persistence__SimpleFillSymbol id="8523">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8531" xlink:type="simple" xlink:href="states#id(''8531'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8524" xlink:type="simple" xlink:href="states#id(''8524'')" />
    </color>
    <description type="string"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8525" xlink:type="simple" xlink:href="states#id(''8525'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8524">
    <red type="integer">204</red>
    <blue type="integer">255</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8525">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8528" xlink:type="simple" xlink:href="states#id(''8528'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8526" xlink:type="simple" xlink:href="states#id(''8526'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8527" xlink:type="simple" xlink:href="states#id(''8527'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8526">
    <red type="integer">204</red>
    <blue type="integer">251</blue>
    <green type="integer">170</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8527">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8528">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8529" xlink:type="simple" xlink:href="states#id(''8529'')" />
    </color>
    <description type="string">version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8530" xlink:type="simple" xlink:href="states#id(''8530'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8529">
    <red type="integer">255</red>
    <blue type="integer">0</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8530">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8531">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8529" xlink:type="simple" xlink:href="states#id(''8529'')" />
    </color>
    <description type="string"> version for selection</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8532" xlink:type="simple" xlink:href="states#id(''8532'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__SimpleLineSymbol id="8532">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8534" xlink:type="simple" xlink:href="states#id(''8534'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8526" xlink:type="simple" xlink:href="states#id(''8526'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8533" xlink:type="simple" xlink:href="states#id(''8533'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8533">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8534">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8529" xlink:type="simple" xlink:href="states#id(''8529'')" />
    </color>
    <description type="string">version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8535" xlink:type="simple" xlink:href="states#id(''8535'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8535">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8536" xlink:type="simple" xlink:href="states#id(''8536'')" />
<states>
  <Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME id="8536">
    <zoomConstraints type="reference">
        <reference id_state="8544" xlink:type="simple" xlink:href="states#id(''8544'')" />
    </zoomConstraints>
    <unit type="integer">-1</unit>
    <allowOverlapping type="boolean">false</allowOverlapping>
    <placementConstraints type="reference">
        <reference id_state="8543" xlink:type="simple" xlink:href="states#id(''8543'')" />
    </placementConstraints>
    <referenceSystem type="integer">0</referenceSystem>
    <labelingMethod type="reference">
        <reference id_state="8537" xlink:type="simple" xlink:href="states#id(''8537'')" />
    </labelingMethod>
  </Persistence__GENERAL_LABEL_STRATEGY_PERSISTENCE_NAME>
  <Persistence__DefaultLabelingMethod id="8537">
    <defaultLabel type="reference">
        <reference id_state="8538" xlink:type="simple" xlink:href="states#id(''8538'')" />
    </defaultLabel>
  </Persistence__DefaultLabelingMethod>
  <Persistence__LabelClass id="8538">
    <texts type="list">
      <item type="string">TANZANIA</item>
    </texts>
    <unit type="integer">-1</unit>
    <scale type="double">1.3333333333333333</scale>
    <sqlQuery type="string"></sqlQuery>
    <visible type="boolean">true</visible>
    <labelExpressions type="list">
      <item type="string">name_spani</item>
    </labelExpressions>
    <priority type="integer">0</priority>
    <referenceSystem type="integer">0</referenceSystem>
    <name type="string"></name>
    <textSymbol type="reference">
        <reference id_state="8539" xlink:type="simple" xlink:href="states#id(''8539'')" />
    </textSymbol>
    <useSQL type="boolean">false</useSQL>
  </Persistence__LabelClass>
  <Persistence__SimpleTextSymbol id="8539">
    <haloWidth type="float">3.0</haloWidth>
    <unit type="integer">-1</unit>
    <textColor type="reference">
        <reference id_state="8541" xlink:type="simple" xlink:href="states#id(''8541'')" />
    </textColor>
    <text type="string">TANZANIA</text>
    <hasHalo type="boolean">false</hasHalo>
    <rotation type="double">0.0</rotation>
    <font type="reference">
        <reference id_state="8540" xlink:type="simple" xlink:href="states#id(''8540'')" />
    </font>
    <description type="null"></description>
    <autoResize type="boolean">false</autoResize>
    <referenceSystem type="integer">0</referenceSystem>
    <haloColor type="reference">
        <reference id_state="8542" xlink:type="simple" xlink:href="states#id(''8542'')" />
    </haloColor>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleTextSymbol>
  <Persistence__AwtFont id="8540">
    <style type="integer">0</style>
    <name type="string">Tahoma</name>
    <size type="integer">14</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="8541">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8542">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__POLYGON_PLACE_CONSTRAINTS id="8543">
    <aboveTheLine type="boolean">false</aboveTheLine>
    <duplicateLabelsMode type="integer">2</duplicateLabelsMode>
    <belowTheLine type="boolean">false</belowTheLine>
    <fitInsidePolygon type="boolean">true</fitInsidePolygon>
    <onTheLine type="boolean">false</onTheLine>
    <locationAlongLine type="integer">0</locationAlongLine>
    <pageOriented type="boolean">false</pageOriented>
    <placementMode type="integer">10</placementMode>
  </Persistence__POLYGON_PLACE_CONSTRAINTS>
  <Persistence__ZoomConstraintsImpl id="8544">
    <minScale type="long">-1</minScale>
    <maxScale type="long">-1</maxScale>
    <mode type="integer">0</mode>
  </Persistence__ZoomConstraintsImpl>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('provinces', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8545" xlink:type="simple" xlink:href="states#id(''8545'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="8545">
    <nullValueSymbol type="reference">
        <reference id_state="8551" xlink:type="simple" xlink:href="states#id(''8551'')" />
    </nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="string">Lago Niassa</key>
        <value type="reference">
        <reference id_state="8656" xlink:type="simple" xlink:href="states#id(''8656'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">true</useDefaultSymbol>
    <keys type="list">
      <item type="string">Lago Niassa</item>
    </keys>
    <fieldNames type="list">
      <item type="string">provincia</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="8556" xlink:type="simple" xlink:href="states#id(''8556'')" />
      </item>
      <item type="reference">
        <reference id_state="8557" xlink:type="simple" xlink:href="states#id(''8557'')" />
      </item>
      <item type="reference">
        <reference id_state="8558" xlink:type="simple" xlink:href="states#id(''8558'')" />
      </item>
      <item type="reference">
        <reference id_state="8559" xlink:type="simple" xlink:href="states#id(''8559'')" />
      </item>
      <item type="reference">
        <reference id_state="8560" xlink:type="simple" xlink:href="states#id(''8560'')" />
      </item>
      <item type="reference">
        <reference id_state="8561" xlink:type="simple" xlink:href="states#id(''8561'')" />
      </item>
      <item type="reference">
        <reference id_state="8562" xlink:type="simple" xlink:href="states#id(''8562'')" />
      </item>
      <item type="reference">
        <reference id_state="8563" xlink:type="simple" xlink:href="states#id(''8563'')" />
      </item>
      <item type="reference">
        <reference id_state="8564" xlink:type="simple" xlink:href="states#id(''8564'')" />
      </item>
      <item type="reference">
        <reference id_state="8565" xlink:type="simple" xlink:href="states#id(''8565'')" />
      </item>
      <item type="reference">
        <reference id_state="8566" xlink:type="simple" xlink:href="states#id(''8566'')" />
      </item>
      <item type="reference">
        <reference id_state="8567" xlink:type="simple" xlink:href="states#id(''8567'')" />
      </item>
      <item type="reference">
        <reference id_state="8568" xlink:type="simple" xlink:href="states#id(''8568'')" />
      </item>
      <item type="reference">
        <reference id_state="8569" xlink:type="simple" xlink:href="states#id(''8569'')" />
      </item>
      <item type="reference">
        <reference id_state="8570" xlink:type="simple" xlink:href="states#id(''8570'')" />
      </item>
      <item type="reference">
        <reference id_state="8571" xlink:type="simple" xlink:href="states#id(''8571'')" />
      </item>
      <item type="reference">
        <reference id_state="8572" xlink:type="simple" xlink:href="states#id(''8572'')" />
      </item>
      <item type="reference">
        <reference id_state="8573" xlink:type="simple" xlink:href="states#id(''8573'')" />
      </item>
      <item type="reference">
        <reference id_state="8574" xlink:type="simple" xlink:href="states#id(''8574'')" />
      </item>
      <item type="reference">
        <reference id_state="8575" xlink:type="simple" xlink:href="states#id(''8575'')" />
      </item>
      <item type="reference">
        <reference id_state="8576" xlink:type="simple" xlink:href="states#id(''8576'')" />
      </item>
      <item type="reference">
        <reference id_state="8577" xlink:type="simple" xlink:href="states#id(''8577'')" />
      </item>
      <item type="reference">
        <reference id_state="8578" xlink:type="simple" xlink:href="states#id(''8578'')" />
      </item>
      <item type="reference">
        <reference id_state="8579" xlink:type="simple" xlink:href="states#id(''8579'')" />
      </item>
      <item type="reference">
        <reference id_state="8580" xlink:type="simple" xlink:href="states#id(''8580'')" />
      </item>
      <item type="reference">
        <reference id_state="8581" xlink:type="simple" xlink:href="states#id(''8581'')" />
      </item>
      <item type="reference">
        <reference id_state="8582" xlink:type="simple" xlink:href="states#id(''8582'')" />
      </item>
      <item type="reference">
        <reference id_state="8583" xlink:type="simple" xlink:href="states#id(''8583'')" />
      </item>
      <item type="reference">
        <reference id_state="8584" xlink:type="simple" xlink:href="states#id(''8584'')" />
      </item>
      <item type="reference">
        <reference id_state="8585" xlink:type="simple" xlink:href="states#id(''8585'')" />
      </item>
      <item type="reference">
        <reference id_state="8586" xlink:type="simple" xlink:href="states#id(''8586'')" />
      </item>
      <item type="reference">
        <reference id_state="8587" xlink:type="simple" xlink:href="states#id(''8587'')" />
      </item>
      <item type="reference">
        <reference id_state="8588" xlink:type="simple" xlink:href="states#id(''8588'')" />
      </item>
      <item type="reference">
        <reference id_state="8589" xlink:type="simple" xlink:href="states#id(''8589'')" />
      </item>
      <item type="reference">
        <reference id_state="8590" xlink:type="simple" xlink:href="states#id(''8590'')" />
      </item>
      <item type="reference">
        <reference id_state="8591" xlink:type="simple" xlink:href="states#id(''8591'')" />
      </item>
      <item type="reference">
        <reference id_state="8592" xlink:type="simple" xlink:href="states#id(''8592'')" />
      </item>
      <item type="reference">
        <reference id_state="8593" xlink:type="simple" xlink:href="states#id(''8593'')" />
      </item>
      <item type="reference">
        <reference id_state="8594" xlink:type="simple" xlink:href="states#id(''8594'')" />
      </item>
      <item type="reference">
        <reference id_state="8595" xlink:type="simple" xlink:href="states#id(''8595'')" />
      </item>
      <item type="reference">
        <reference id_state="8596" xlink:type="simple" xlink:href="states#id(''8596'')" />
      </item>
      <item type="reference">
        <reference id_state="8597" xlink:type="simple" xlink:href="states#id(''8597'')" />
      </item>
      <item type="reference">
        <reference id_state="8598" xlink:type="simple" xlink:href="states#id(''8598'')" />
      </item>
      <item type="reference">
        <reference id_state="8599" xlink:type="simple" xlink:href="states#id(''8599'')" />
      </item>
      <item type="reference">
        <reference id_state="8600" xlink:type="simple" xlink:href="states#id(''8600'')" />
      </item>
      <item type="reference">
        <reference id_state="8601" xlink:type="simple" xlink:href="states#id(''8601'')" />
      </item>
      <item type="reference">
        <reference id_state="8602" xlink:type="simple" xlink:href="states#id(''8602'')" />
      </item>
      <item type="reference">
        <reference id_state="8603" xlink:type="simple" xlink:href="states#id(''8603'')" />
      </item>
      <item type="reference">
        <reference id_state="8604" xlink:type="simple" xlink:href="states#id(''8604'')" />
      </item>
      <item type="reference">
        <reference id_state="8605" xlink:type="simple" xlink:href="states#id(''8605'')" />
      </item>
      <item type="reference">
        <reference id_state="8606" xlink:type="simple" xlink:href="states#id(''8606'')" />
      </item>
      <item type="reference">
        <reference id_state="8607" xlink:type="simple" xlink:href="states#id(''8607'')" />
      </item>
      <item type="reference">
        <reference id_state="8608" xlink:type="simple" xlink:href="states#id(''8608'')" />
      </item>
      <item type="reference">
        <reference id_state="8609" xlink:type="simple" xlink:href="states#id(''8609'')" />
      </item>
      <item type="reference">
        <reference id_state="8610" xlink:type="simple" xlink:href="states#id(''8610'')" />
      </item>
      <item type="reference">
        <reference id_state="8611" xlink:type="simple" xlink:href="states#id(''8611'')" />
      </item>
      <item type="reference">
        <reference id_state="8612" xlink:type="simple" xlink:href="states#id(''8612'')" />
      </item>
      <item type="reference">
        <reference id_state="8613" xlink:type="simple" xlink:href="states#id(''8613'')" />
      </item>
      <item type="reference">
        <reference id_state="8614" xlink:type="simple" xlink:href="states#id(''8614'')" />
      </item>
      <item type="reference">
        <reference id_state="8615" xlink:type="simple" xlink:href="states#id(''8615'')" />
      </item>
      <item type="reference">
        <reference id_state="8616" xlink:type="simple" xlink:href="states#id(''8616'')" />
      </item>
      <item type="reference">
        <reference id_state="8617" xlink:type="simple" xlink:href="states#id(''8617'')" />
      </item>
      <item type="reference">
        <reference id_state="8618" xlink:type="simple" xlink:href="states#id(''8618'')" />
      </item>
      <item type="reference">
        <reference id_state="8619" xlink:type="simple" xlink:href="states#id(''8619'')" />
      </item>
      <item type="reference">
        <reference id_state="8620" xlink:type="simple" xlink:href="states#id(''8620'')" />
      </item>
      <item type="reference">
        <reference id_state="8621" xlink:type="simple" xlink:href="states#id(''8621'')" />
      </item>
      <item type="reference">
        <reference id_state="8622" xlink:type="simple" xlink:href="states#id(''8622'')" />
      </item>
      <item type="reference">
        <reference id_state="8623" xlink:type="simple" xlink:href="states#id(''8623'')" />
      </item>
      <item type="reference">
        <reference id_state="8624" xlink:type="simple" xlink:href="states#id(''8624'')" />
      </item>
      <item type="reference">
        <reference id_state="8625" xlink:type="simple" xlink:href="states#id(''8625'')" />
      </item>
      <item type="reference">
        <reference id_state="8626" xlink:type="simple" xlink:href="states#id(''8626'')" />
      </item>
      <item type="reference">
        <reference id_state="8627" xlink:type="simple" xlink:href="states#id(''8627'')" />
      </item>
      <item type="reference">
        <reference id_state="8628" xlink:type="simple" xlink:href="states#id(''8628'')" />
      </item>
      <item type="reference">
        <reference id_state="8629" xlink:type="simple" xlink:href="states#id(''8629'')" />
      </item>
      <item type="reference">
        <reference id_state="8630" xlink:type="simple" xlink:href="states#id(''8630'')" />
      </item>
      <item type="reference">
        <reference id_state="8631" xlink:type="simple" xlink:href="states#id(''8631'')" />
      </item>
      <item type="reference">
        <reference id_state="8632" xlink:type="simple" xlink:href="states#id(''8632'')" />
      </item>
      <item type="reference">
        <reference id_state="8633" xlink:type="simple" xlink:href="states#id(''8633'')" />
      </item>
      <item type="reference">
        <reference id_state="8634" xlink:type="simple" xlink:href="states#id(''8634'')" />
      </item>
      <item type="reference">
        <reference id_state="8635" xlink:type="simple" xlink:href="states#id(''8635'')" />
      </item>
      <item type="reference">
        <reference id_state="8636" xlink:type="simple" xlink:href="states#id(''8636'')" />
      </item>
      <item type="reference">
        <reference id_state="8637" xlink:type="simple" xlink:href="states#id(''8637'')" />
      </item>
      <item type="reference">
        <reference id_state="8638" xlink:type="simple" xlink:href="states#id(''8638'')" />
      </item>
      <item type="reference">
        <reference id_state="8639" xlink:type="simple" xlink:href="states#id(''8639'')" />
      </item>
      <item type="reference">
        <reference id_state="8640" xlink:type="simple" xlink:href="states#id(''8640'')" />
      </item>
      <item type="reference">
        <reference id_state="8641" xlink:type="simple" xlink:href="states#id(''8641'')" />
      </item>
      <item type="reference">
        <reference id_state="8642" xlink:type="simple" xlink:href="states#id(''8642'')" />
      </item>
      <item type="reference">
        <reference id_state="8643" xlink:type="simple" xlink:href="states#id(''8643'')" />
      </item>
      <item type="reference">
        <reference id_state="8644" xlink:type="simple" xlink:href="states#id(''8644'')" />
      </item>
      <item type="reference">
        <reference id_state="8645" xlink:type="simple" xlink:href="states#id(''8645'')" />
      </item>
      <item type="reference">
        <reference id_state="8646" xlink:type="simple" xlink:href="states#id(''8646'')" />
      </item>
      <item type="reference">
        <reference id_state="8647" xlink:type="simple" xlink:href="states#id(''8647'')" />
      </item>
      <item type="reference">
        <reference id_state="8648" xlink:type="simple" xlink:href="states#id(''8648'')" />
      </item>
      <item type="reference">
        <reference id_state="8649" xlink:type="simple" xlink:href="states#id(''8649'')" />
      </item>
      <item type="reference">
        <reference id_state="8650" xlink:type="simple" xlink:href="states#id(''8650'')" />
      </item>
      <item type="reference">
        <reference id_state="8651" xlink:type="simple" xlink:href="states#id(''8651'')" />
      </item>
      <item type="reference">
        <reference id_state="8652" xlink:type="simple" xlink:href="states#id(''8652'')" />
      </item>
      <item type="reference">
        <reference id_state="8653" xlink:type="simple" xlink:href="states#id(''8653'')" />
      </item>
      <item type="reference">
        <reference id_state="8654" xlink:type="simple" xlink:href="states#id(''8654'')" />
      </item>
      <item type="reference">
        <reference id_state="8655" xlink:type="simple" xlink:href="states#id(''8655'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">9</shapeType>
    <fieldTypes type="list">
      <item type="integer">8</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8546" xlink:type="simple" xlink:href="states#id(''8546'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleFillSymbol id="8546">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8547" xlink:type="simple" xlink:href="states#id(''8547'')" />
    </color>
    <description type="string">Padr�o</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8548" xlink:type="simple" xlink:href="states#id(''8548'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8547">
    <red type="integer">255</red>
    <blue type="integer">204</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8548">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8549" xlink:type="simple" xlink:href="states#id(''8549'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8550" xlink:type="simple" xlink:href="states#id(''8550'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8549">
    <red type="integer">204</red>
    <blue type="integer">251</blue>
    <green type="integer">170</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8550">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="list">
      <item type="float">5.0</item>
      <item type="float">5.0</item>
    </tempDashArray>
    <dashArray type="list">
      <item type="float">5.0</item>
      <item type="float">5.0</item>
    </dashArray>
    <offset type="double">-0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8551">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8552" xlink:type="simple" xlink:href="states#id(''8552'')" />
    </color>
    <description type="string">Default</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8553" xlink:type="simple" xlink:href="states#id(''8553'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8552">
    <red type="integer">28</red>
    <blue type="integer">160</blue>
    <green type="integer">115</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8553">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8554" xlink:type="simple" xlink:href="states#id(''8554'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8555" xlink:type="simple" xlink:href="states#id(''8555'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8554">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8555">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__AwtColor id="8556">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8557">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8558">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8559">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8560">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8561">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8562">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8563">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8564">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8565">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8566">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8567">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8568">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8569">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8570">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8571">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8572">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8573">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8574">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8575">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8576">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8577">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8578">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8579">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8580">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8581">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8582">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8583">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8584">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8585">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8586">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8587">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8588">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8589">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8590">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8591">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8592">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8593">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8594">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8595">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8596">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8597">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8598">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8599">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8600">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8601">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8602">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8603">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8604">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8605">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8606">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8607">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8608">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8609">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8610">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8611">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8612">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8613">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8614">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8615">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8616">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8617">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8618">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8619">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8620">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8621">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8622">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8623">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8624">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8625">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8626">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8627">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8628">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8629">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8630">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8631">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8632">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8633">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8634">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8635">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8636">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8637">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8638">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8639">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8640">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8641">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8642">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8643">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8644">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8645">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8646">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8647">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8648">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8649">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8650">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8651">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8652">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8653">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8654">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8655">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleFillSymbol id="8656">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8657" xlink:type="simple" xlink:href="states#id(''8657'')" />
    </color>
    <description type="string">Lago Niassa</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8658" xlink:type="simple" xlink:href="states#id(''8658'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8657">
    <red type="integer">190</red>
    <blue type="integer">255</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8658">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8659" xlink:type="simple" xlink:href="states#id(''8659'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8660" xlink:type="simple" xlink:href="states#id(''8660'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8659">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">0</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8660">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8661" xlink:type="simple" xlink:href="states#id(''8661'')" />
<states>
  <Persistence__AttrInTableLabelingStrategy id="8661">
    <zoomConstraints type="null"></zoomConstraints>
    <HeightField type="null"></HeightField>
    <useFixedColor type="boolean">true</useFixedColor>
    <ColorField type="null"></ColorField>
    <fixedSize type="double">10.0</fixedSize>
    <RotationField type="null"></RotationField>
    <fixedColor type="reference">
        <reference id_state="8663" xlink:type="simple" xlink:href="states#id(''8663'')" />
    </fixedColor>
    <font type="reference">
        <reference id_state="8662" xlink:type="simple" xlink:href="states#id(''8662'')" />
    </font>
    <referenceSystem type="integer">0</referenceSystem>
    <useFixedSize type="boolean">true</useFixedSize>
    <colorFont type="null"></colorFont>
    <TextField type="string">provincia</TextField>
    <Unit type="integer">-1</Unit>
    <labelingMethod type="reference">
        <reference id_state="8664" xlink:type="simple" xlink:href="states#id(''8664'')" />
    </labelingMethod>
  </Persistence__AttrInTableLabelingStrategy>
  <Persistence__AwtFont id="8662">
    <style type="integer">0</style>
    <name type="string">SansSerif</name>
    <size type="integer">14</size>
  </Persistence__AwtFont>
  <Persistence__AwtColor id="8663">
    <red type="integer">102</red>
    <blue type="integer">102</blue>
    <green type="integer">102</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__DefaultLabelingMethod id="8664">
    <defaultLabel type="null"></defaultLabel>
  </Persistence__DefaultLabelingMethod>
</states>
</XMLPersitence>
');
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('batimetria', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8665" xlink:type="simple" xlink:href="states#id(''8665'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="8665">
    <nullValueSymbol type="null"></nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="integer">0</key>
        <value type="reference">
        <reference id_state="8771" xlink:type="simple" xlink:href="states#id(''8771'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">200</key>
        <value type="reference">
        <reference id_state="8775" xlink:type="simple" xlink:href="states#id(''8775'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">1000</key>
        <value type="reference">
        <reference id_state="8779" xlink:type="simple" xlink:href="states#id(''8779'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">2000</key>
        <value type="reference">
        <reference id_state="8783" xlink:type="simple" xlink:href="states#id(''8783'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">3000</key>
        <value type="reference">
        <reference id_state="8787" xlink:type="simple" xlink:href="states#id(''8787'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">4000</key>
        <value type="reference">
        <reference id_state="8791" xlink:type="simple" xlink:href="states#id(''8791'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">5000</key>
        <value type="reference">
        <reference id_state="8795" xlink:type="simple" xlink:href="states#id(''8795'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">false</useDefaultSymbol>
    <keys type="list">
      <item type="integer">0</item>
      <item type="integer">200</item>
      <item type="integer">1000</item>
      <item type="integer">2000</item>
      <item type="integer">3000</item>
      <item type="integer">4000</item>
      <item type="integer">5000</item>
    </keys>
    <fieldNames type="list">
      <item type="string">depth</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="8671" xlink:type="simple" xlink:href="states#id(''8671'')" />
      </item>
      <item type="reference">
        <reference id_state="8672" xlink:type="simple" xlink:href="states#id(''8672'')" />
      </item>
      <item type="reference">
        <reference id_state="8673" xlink:type="simple" xlink:href="states#id(''8673'')" />
      </item>
      <item type="reference">
        <reference id_state="8674" xlink:type="simple" xlink:href="states#id(''8674'')" />
      </item>
      <item type="reference">
        <reference id_state="8675" xlink:type="simple" xlink:href="states#id(''8675'')" />
      </item>
      <item type="reference">
        <reference id_state="8676" xlink:type="simple" xlink:href="states#id(''8676'')" />
      </item>
      <item type="reference">
        <reference id_state="8677" xlink:type="simple" xlink:href="states#id(''8677'')" />
      </item>
      <item type="reference">
        <reference id_state="8678" xlink:type="simple" xlink:href="states#id(''8678'')" />
      </item>
      <item type="reference">
        <reference id_state="8679" xlink:type="simple" xlink:href="states#id(''8679'')" />
      </item>
      <item type="reference">
        <reference id_state="8680" xlink:type="simple" xlink:href="states#id(''8680'')" />
      </item>
      <item type="reference">
        <reference id_state="8681" xlink:type="simple" xlink:href="states#id(''8681'')" />
      </item>
      <item type="reference">
        <reference id_state="8682" xlink:type="simple" xlink:href="states#id(''8682'')" />
      </item>
      <item type="reference">
        <reference id_state="8683" xlink:type="simple" xlink:href="states#id(''8683'')" />
      </item>
      <item type="reference">
        <reference id_state="8684" xlink:type="simple" xlink:href="states#id(''8684'')" />
      </item>
      <item type="reference">
        <reference id_state="8685" xlink:type="simple" xlink:href="states#id(''8685'')" />
      </item>
      <item type="reference">
        <reference id_state="8686" xlink:type="simple" xlink:href="states#id(''8686'')" />
      </item>
      <item type="reference">
        <reference id_state="8687" xlink:type="simple" xlink:href="states#id(''8687'')" />
      </item>
      <item type="reference">
        <reference id_state="8688" xlink:type="simple" xlink:href="states#id(''8688'')" />
      </item>
      <item type="reference">
        <reference id_state="8689" xlink:type="simple" xlink:href="states#id(''8689'')" />
      </item>
      <item type="reference">
        <reference id_state="8690" xlink:type="simple" xlink:href="states#id(''8690'')" />
      </item>
      <item type="reference">
        <reference id_state="8691" xlink:type="simple" xlink:href="states#id(''8691'')" />
      </item>
      <item type="reference">
        <reference id_state="8692" xlink:type="simple" xlink:href="states#id(''8692'')" />
      </item>
      <item type="reference">
        <reference id_state="8693" xlink:type="simple" xlink:href="states#id(''8693'')" />
      </item>
      <item type="reference">
        <reference id_state="8694" xlink:type="simple" xlink:href="states#id(''8694'')" />
      </item>
      <item type="reference">
        <reference id_state="8695" xlink:type="simple" xlink:href="states#id(''8695'')" />
      </item>
      <item type="reference">
        <reference id_state="8696" xlink:type="simple" xlink:href="states#id(''8696'')" />
      </item>
      <item type="reference">
        <reference id_state="8697" xlink:type="simple" xlink:href="states#id(''8697'')" />
      </item>
      <item type="reference">
        <reference id_state="8698" xlink:type="simple" xlink:href="states#id(''8698'')" />
      </item>
      <item type="reference">
        <reference id_state="8699" xlink:type="simple" xlink:href="states#id(''8699'')" />
      </item>
      <item type="reference">
        <reference id_state="8700" xlink:type="simple" xlink:href="states#id(''8700'')" />
      </item>
      <item type="reference">
        <reference id_state="8701" xlink:type="simple" xlink:href="states#id(''8701'')" />
      </item>
      <item type="reference">
        <reference id_state="8702" xlink:type="simple" xlink:href="states#id(''8702'')" />
      </item>
      <item type="reference">
        <reference id_state="8703" xlink:type="simple" xlink:href="states#id(''8703'')" />
      </item>
      <item type="reference">
        <reference id_state="8704" xlink:type="simple" xlink:href="states#id(''8704'')" />
      </item>
      <item type="reference">
        <reference id_state="8705" xlink:type="simple" xlink:href="states#id(''8705'')" />
      </item>
      <item type="reference">
        <reference id_state="8706" xlink:type="simple" xlink:href="states#id(''8706'')" />
      </item>
      <item type="reference">
        <reference id_state="8707" xlink:type="simple" xlink:href="states#id(''8707'')" />
      </item>
      <item type="reference">
        <reference id_state="8708" xlink:type="simple" xlink:href="states#id(''8708'')" />
      </item>
      <item type="reference">
        <reference id_state="8709" xlink:type="simple" xlink:href="states#id(''8709'')" />
      </item>
      <item type="reference">
        <reference id_state="8710" xlink:type="simple" xlink:href="states#id(''8710'')" />
      </item>
      <item type="reference">
        <reference id_state="8711" xlink:type="simple" xlink:href="states#id(''8711'')" />
      </item>
      <item type="reference">
        <reference id_state="8712" xlink:type="simple" xlink:href="states#id(''8712'')" />
      </item>
      <item type="reference">
        <reference id_state="8713" xlink:type="simple" xlink:href="states#id(''8713'')" />
      </item>
      <item type="reference">
        <reference id_state="8714" xlink:type="simple" xlink:href="states#id(''8714'')" />
      </item>
      <item type="reference">
        <reference id_state="8715" xlink:type="simple" xlink:href="states#id(''8715'')" />
      </item>
      <item type="reference">
        <reference id_state="8716" xlink:type="simple" xlink:href="states#id(''8716'')" />
      </item>
      <item type="reference">
        <reference id_state="8717" xlink:type="simple" xlink:href="states#id(''8717'')" />
      </item>
      <item type="reference">
        <reference id_state="8718" xlink:type="simple" xlink:href="states#id(''8718'')" />
      </item>
      <item type="reference">
        <reference id_state="8719" xlink:type="simple" xlink:href="states#id(''8719'')" />
      </item>
      <item type="reference">
        <reference id_state="8720" xlink:type="simple" xlink:href="states#id(''8720'')" />
      </item>
      <item type="reference">
        <reference id_state="8721" xlink:type="simple" xlink:href="states#id(''8721'')" />
      </item>
      <item type="reference">
        <reference id_state="8722" xlink:type="simple" xlink:href="states#id(''8722'')" />
      </item>
      <item type="reference">
        <reference id_state="8723" xlink:type="simple" xlink:href="states#id(''8723'')" />
      </item>
      <item type="reference">
        <reference id_state="8724" xlink:type="simple" xlink:href="states#id(''8724'')" />
      </item>
      <item type="reference">
        <reference id_state="8725" xlink:type="simple" xlink:href="states#id(''8725'')" />
      </item>
      <item type="reference">
        <reference id_state="8726" xlink:type="simple" xlink:href="states#id(''8726'')" />
      </item>
      <item type="reference">
        <reference id_state="8727" xlink:type="simple" xlink:href="states#id(''8727'')" />
      </item>
      <item type="reference">
        <reference id_state="8728" xlink:type="simple" xlink:href="states#id(''8728'')" />
      </item>
      <item type="reference">
        <reference id_state="8729" xlink:type="simple" xlink:href="states#id(''8729'')" />
      </item>
      <item type="reference">
        <reference id_state="8730" xlink:type="simple" xlink:href="states#id(''8730'')" />
      </item>
      <item type="reference">
        <reference id_state="8731" xlink:type="simple" xlink:href="states#id(''8731'')" />
      </item>
      <item type="reference">
        <reference id_state="8732" xlink:type="simple" xlink:href="states#id(''8732'')" />
      </item>
      <item type="reference">
        <reference id_state="8733" xlink:type="simple" xlink:href="states#id(''8733'')" />
      </item>
      <item type="reference">
        <reference id_state="8734" xlink:type="simple" xlink:href="states#id(''8734'')" />
      </item>
      <item type="reference">
        <reference id_state="8735" xlink:type="simple" xlink:href="states#id(''8735'')" />
      </item>
      <item type="reference">
        <reference id_state="8736" xlink:type="simple" xlink:href="states#id(''8736'')" />
      </item>
      <item type="reference">
        <reference id_state="8737" xlink:type="simple" xlink:href="states#id(''8737'')" />
      </item>
      <item type="reference">
        <reference id_state="8738" xlink:type="simple" xlink:href="states#id(''8738'')" />
      </item>
      <item type="reference">
        <reference id_state="8739" xlink:type="simple" xlink:href="states#id(''8739'')" />
      </item>
      <item type="reference">
        <reference id_state="8740" xlink:type="simple" xlink:href="states#id(''8740'')" />
      </item>
      <item type="reference">
        <reference id_state="8741" xlink:type="simple" xlink:href="states#id(''8741'')" />
      </item>
      <item type="reference">
        <reference id_state="8742" xlink:type="simple" xlink:href="states#id(''8742'')" />
      </item>
      <item type="reference">
        <reference id_state="8743" xlink:type="simple" xlink:href="states#id(''8743'')" />
      </item>
      <item type="reference">
        <reference id_state="8744" xlink:type="simple" xlink:href="states#id(''8744'')" />
      </item>
      <item type="reference">
        <reference id_state="8745" xlink:type="simple" xlink:href="states#id(''8745'')" />
      </item>
      <item type="reference">
        <reference id_state="8746" xlink:type="simple" xlink:href="states#id(''8746'')" />
      </item>
      <item type="reference">
        <reference id_state="8747" xlink:type="simple" xlink:href="states#id(''8747'')" />
      </item>
      <item type="reference">
        <reference id_state="8748" xlink:type="simple" xlink:href="states#id(''8748'')" />
      </item>
      <item type="reference">
        <reference id_state="8749" xlink:type="simple" xlink:href="states#id(''8749'')" />
      </item>
      <item type="reference">
        <reference id_state="8750" xlink:type="simple" xlink:href="states#id(''8750'')" />
      </item>
      <item type="reference">
        <reference id_state="8751" xlink:type="simple" xlink:href="states#id(''8751'')" />
      </item>
      <item type="reference">
        <reference id_state="8752" xlink:type="simple" xlink:href="states#id(''8752'')" />
      </item>
      <item type="reference">
        <reference id_state="8753" xlink:type="simple" xlink:href="states#id(''8753'')" />
      </item>
      <item type="reference">
        <reference id_state="8754" xlink:type="simple" xlink:href="states#id(''8754'')" />
      </item>
      <item type="reference">
        <reference id_state="8755" xlink:type="simple" xlink:href="states#id(''8755'')" />
      </item>
      <item type="reference">
        <reference id_state="8756" xlink:type="simple" xlink:href="states#id(''8756'')" />
      </item>
      <item type="reference">
        <reference id_state="8757" xlink:type="simple" xlink:href="states#id(''8757'')" />
      </item>
      <item type="reference">
        <reference id_state="8758" xlink:type="simple" xlink:href="states#id(''8758'')" />
      </item>
      <item type="reference">
        <reference id_state="8759" xlink:type="simple" xlink:href="states#id(''8759'')" />
      </item>
      <item type="reference">
        <reference id_state="8760" xlink:type="simple" xlink:href="states#id(''8760'')" />
      </item>
      <item type="reference">
        <reference id_state="8761" xlink:type="simple" xlink:href="states#id(''8761'')" />
      </item>
      <item type="reference">
        <reference id_state="8762" xlink:type="simple" xlink:href="states#id(''8762'')" />
      </item>
      <item type="reference">
        <reference id_state="8763" xlink:type="simple" xlink:href="states#id(''8763'')" />
      </item>
      <item type="reference">
        <reference id_state="8764" xlink:type="simple" xlink:href="states#id(''8764'')" />
      </item>
      <item type="reference">
        <reference id_state="8765" xlink:type="simple" xlink:href="states#id(''8765'')" />
      </item>
      <item type="reference">
        <reference id_state="8766" xlink:type="simple" xlink:href="states#id(''8766'')" />
      </item>
      <item type="reference">
        <reference id_state="8767" xlink:type="simple" xlink:href="states#id(''8767'')" />
      </item>
      <item type="reference">
        <reference id_state="8768" xlink:type="simple" xlink:href="states#id(''8768'')" />
      </item>
      <item type="reference">
        <reference id_state="8769" xlink:type="simple" xlink:href="states#id(''8769'')" />
      </item>
      <item type="reference">
        <reference id_state="8770" xlink:type="simple" xlink:href="states#id(''8770'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">9</shapeType>
    <fieldTypes type="list">
      <item type="integer">4</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8666" xlink:type="simple" xlink:href="states#id(''8666'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleFillSymbol id="8666">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8667" xlink:type="simple" xlink:href="states#id(''8667'')" />
    </color>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8668" xlink:type="simple" xlink:href="states#id(''8668'')" />
    </outline>
    <hasOutline type="boolean">true</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8667">
    <red type="integer">78</red>
    <blue type="integer">180</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8668">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8670" xlink:type="simple" xlink:href="states#id(''8670'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8669">
    <red type="integer">64</red>
    <blue type="integer">64</blue>
    <green type="integer">64</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8670">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__AwtColor id="8671">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8672">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8673">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8674">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8675">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8676">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8677">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8678">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8679">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8680">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8681">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8682">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8683">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8684">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8685">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8686">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8687">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8688">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8689">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8690">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8691">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8692">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8693">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8694">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8695">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8696">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8697">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8698">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8699">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8700">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8701">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8702">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8703">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8704">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8705">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8706">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8707">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8708">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8709">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8710">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8711">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8712">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8713">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8714">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8715">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8716">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8717">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8718">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8719">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8720">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8721">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8722">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8723">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8724">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8725">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8726">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8727">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8728">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8729">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8730">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8731">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8732">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8733">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8734">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8735">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8736">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8737">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8738">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8739">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8740">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8741">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8742">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8743">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8744">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8745">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8746">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8747">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8748">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8749">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8750">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8751">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8752">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8753">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8754">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8755">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8756">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8757">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8758">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8759">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8760">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8761">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8762">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8763">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8764">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8765">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8766">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8767">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8768">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8769">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8770">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleFillSymbol id="8771">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8772" xlink:type="simple" xlink:href="states#id(''8772'')" />
    </color>
    <description type="string">0</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8773" xlink:type="simple" xlink:href="states#id(''8773'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8772">
    <red type="integer">190</red>
    <blue type="integer">255</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8773">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8774" xlink:type="simple" xlink:href="states#id(''8774'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8774">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8775">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8776" xlink:type="simple" xlink:href="states#id(''8776'')" />
    </color>
    <description type="string">200</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8777" xlink:type="simple" xlink:href="states#id(''8777'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8776">
    <red type="integer">115</red>
    <blue type="integer">252</blue>
    <green type="integer">178</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8777">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8778" xlink:type="simple" xlink:href="states#id(''8778'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8778">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8779">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8780" xlink:type="simple" xlink:href="states#id(''8780'')" />
    </color>
    <description type="string">1000</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8781" xlink:type="simple" xlink:href="states#id(''8781'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8780">
    <red type="integer">77</red>
    <blue type="integer">255</blue>
    <green type="integer">138</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8781">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8782" xlink:type="simple" xlink:href="states#id(''8782'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8782">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8783">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8784" xlink:type="simple" xlink:href="states#id(''8784'')" />
    </color>
    <description type="string">2000</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8785" xlink:type="simple" xlink:href="states#id(''8785'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8784">
    <red type="integer">0</red>
    <blue type="integer">173</blue>
    <green type="integer">92</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8785">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8786" xlink:type="simple" xlink:href="states#id(''8786'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8786">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8787">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8788" xlink:type="simple" xlink:href="states#id(''8788'')" />
    </color>
    <description type="string">3000</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8789" xlink:type="simple" xlink:href="states#id(''8789'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8788">
    <red type="integer">0</red>
    <blue type="integer">143</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8789">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8790" xlink:type="simple" xlink:href="states#id(''8790'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8790">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8791">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8792" xlink:type="simple" xlink:href="states#id(''8792'')" />
    </color>
    <description type="string">4000</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8793" xlink:type="simple" xlink:href="states#id(''8793'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8792">
    <red type="integer">0</red>
    <blue type="integer">105</blue>
    <green type="integer">56</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8793">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8794" xlink:type="simple" xlink:href="states#id(''8794'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8794">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleFillSymbol id="8795">
    <hasFill type="boolean">true</hasFill>
    <unit type="integer">-1</unit>
    <symbolForSelection type="null"></symbolForSelection>
    <color type="reference">
        <reference id_state="8796" xlink:type="simple" xlink:href="states#id(''8796'')" />
    </color>
    <description type="string">5000</description>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <outline type="reference">
        <reference id_state="8797" xlink:type="simple" xlink:href="states#id(''8797'')" />
    </outline>
    <hasOutline type="boolean">false</hasOutline>
  </Persistence__SimpleFillSymbol>
  <Persistence__AwtColor id="8796">
    <red type="integer">0</red>
    <blue type="integer">115</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8797">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8669" xlink:type="simple" xlink:href="states#id(''8669'')" />
    </color>
    <description type="null"></description>
    <lineStyle type="reference">
        <reference id_state="8798" xlink:type="simple" xlink:href="states#id(''8798'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8798">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);
INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('curvas_nivel_10m', 'SIXHIARA', 'gvl', '<?xml version="1.0" encoding="windows-1252"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="8799" xlink:type="simple" xlink:href="states#id(''8799'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="8799">
    <nullValueSymbol type="reference">
        <reference id_state="8803" xlink:type="simple" xlink:href="states#id(''8803'')" />
    </nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="float">0.0</key>
        <value type="reference">
        <reference id_state="8906" xlink:type="simple" xlink:href="states#id(''8906'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="float">50.0</key>
        <value type="reference">
        <reference id_state="8912" xlink:type="simple" xlink:href="states#id(''8912'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">100</key>
        <value type="reference">
        <reference id_state="8917" xlink:type="simple" xlink:href="states#id(''8917'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">150</key>
        <value type="reference">
        <reference id_state="8921" xlink:type="simple" xlink:href="states#id(''8921'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">200</key>
        <value type="reference">
        <reference id_state="8925" xlink:type="simple" xlink:href="states#id(''8925'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">250</key>
        <value type="reference">
        <reference id_state="8929" xlink:type="simple" xlink:href="states#id(''8929'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">300</key>
        <value type="reference">
        <reference id_state="8933" xlink:type="simple" xlink:href="states#id(''8933'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">350</key>
        <value type="reference">
        <reference id_state="8937" xlink:type="simple" xlink:href="states#id(''8937'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">400</key>
        <value type="reference">
        <reference id_state="8941" xlink:type="simple" xlink:href="states#id(''8941'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">450</key>
        <value type="reference">
        <reference id_state="8945" xlink:type="simple" xlink:href="states#id(''8945'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">500</key>
        <value type="reference">
        <reference id_state="8949" xlink:type="simple" xlink:href="states#id(''8949'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">550</key>
        <value type="reference">
        <reference id_state="8953" xlink:type="simple" xlink:href="states#id(''8953'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">600</key>
        <value type="reference">
        <reference id_state="8957" xlink:type="simple" xlink:href="states#id(''8957'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">650</key>
        <value type="reference">
        <reference id_state="8961" xlink:type="simple" xlink:href="states#id(''8961'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">700</key>
        <value type="reference">
        <reference id_state="8965" xlink:type="simple" xlink:href="states#id(''8965'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">750</key>
        <value type="reference">
        <reference id_state="8969" xlink:type="simple" xlink:href="states#id(''8969'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">800</key>
        <value type="reference">
        <reference id_state="8973" xlink:type="simple" xlink:href="states#id(''8973'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">850</key>
        <value type="reference">
        <reference id_state="8977" xlink:type="simple" xlink:href="states#id(''8977'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">900</key>
        <value type="reference">
        <reference id_state="8981" xlink:type="simple" xlink:href="states#id(''8981'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">950</key>
        <value type="reference">
        <reference id_state="8985" xlink:type="simple" xlink:href="states#id(''8985'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">1000</key>
        <value type="reference">
        <reference id_state="8989" xlink:type="simple" xlink:href="states#id(''8989'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">1050</key>
        <value type="reference">
        <reference id_state="8993" xlink:type="simple" xlink:href="states#id(''8993'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">1100</key>
        <value type="reference">
        <reference id_state="8997" xlink:type="simple" xlink:href="states#id(''8997'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="integer">1150</key>
        <value type="reference">
        <reference id_state="9001" xlink:type="simple" xlink:href="states#id(''9001'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">true</useDefaultSymbol>
    <keys type="list">
      <item type="float">0.0</item>
      <item type="float">50.0</item>
      <item type="integer">100</item>
      <item type="integer">150</item>
      <item type="integer">200</item>
      <item type="integer">250</item>
      <item type="integer">300</item>
      <item type="integer">350</item>
      <item type="integer">400</item>
      <item type="integer">450</item>
      <item type="integer">500</item>
      <item type="integer">550</item>
      <item type="integer">600</item>
      <item type="integer">650</item>
      <item type="integer">700</item>
      <item type="integer">750</item>
      <item type="integer">800</item>
      <item type="integer">850</item>
      <item type="integer">900</item>
      <item type="integer">950</item>
      <item type="integer">1000</item>
      <item type="integer">1050</item>
      <item type="integer">1100</item>
      <item type="integer">1150</item>
    </keys>
    <fieldNames type="list">
      <item type="string">contour</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="8806" xlink:type="simple" xlink:href="states#id(''8806'')" />
      </item>
      <item type="reference">
        <reference id_state="8807" xlink:type="simple" xlink:href="states#id(''8807'')" />
      </item>
      <item type="reference">
        <reference id_state="8808" xlink:type="simple" xlink:href="states#id(''8808'')" />
      </item>
      <item type="reference">
        <reference id_state="8809" xlink:type="simple" xlink:href="states#id(''8809'')" />
      </item>
      <item type="reference">
        <reference id_state="8810" xlink:type="simple" xlink:href="states#id(''8810'')" />
      </item>
      <item type="reference">
        <reference id_state="8811" xlink:type="simple" xlink:href="states#id(''8811'')" />
      </item>
      <item type="reference">
        <reference id_state="8812" xlink:type="simple" xlink:href="states#id(''8812'')" />
      </item>
      <item type="reference">
        <reference id_state="8813" xlink:type="simple" xlink:href="states#id(''8813'')" />
      </item>
      <item type="reference">
        <reference id_state="8814" xlink:type="simple" xlink:href="states#id(''8814'')" />
      </item>
      <item type="reference">
        <reference id_state="8815" xlink:type="simple" xlink:href="states#id(''8815'')" />
      </item>
      <item type="reference">
        <reference id_state="8816" xlink:type="simple" xlink:href="states#id(''8816'')" />
      </item>
      <item type="reference">
        <reference id_state="8817" xlink:type="simple" xlink:href="states#id(''8817'')" />
      </item>
      <item type="reference">
        <reference id_state="8818" xlink:type="simple" xlink:href="states#id(''8818'')" />
      </item>
      <item type="reference">
        <reference id_state="8819" xlink:type="simple" xlink:href="states#id(''8819'')" />
      </item>
      <item type="reference">
        <reference id_state="8820" xlink:type="simple" xlink:href="states#id(''8820'')" />
      </item>
      <item type="reference">
        <reference id_state="8821" xlink:type="simple" xlink:href="states#id(''8821'')" />
      </item>
      <item type="reference">
        <reference id_state="8822" xlink:type="simple" xlink:href="states#id(''8822'')" />
      </item>
      <item type="reference">
        <reference id_state="8823" xlink:type="simple" xlink:href="states#id(''8823'')" />
      </item>
      <item type="reference">
        <reference id_state="8824" xlink:type="simple" xlink:href="states#id(''8824'')" />
      </item>
      <item type="reference">
        <reference id_state="8825" xlink:type="simple" xlink:href="states#id(''8825'')" />
      </item>
      <item type="reference">
        <reference id_state="8826" xlink:type="simple" xlink:href="states#id(''8826'')" />
      </item>
      <item type="reference">
        <reference id_state="8827" xlink:type="simple" xlink:href="states#id(''8827'')" />
      </item>
      <item type="reference">
        <reference id_state="8828" xlink:type="simple" xlink:href="states#id(''8828'')" />
      </item>
      <item type="reference">
        <reference id_state="8829" xlink:type="simple" xlink:href="states#id(''8829'')" />
      </item>
      <item type="reference">
        <reference id_state="8830" xlink:type="simple" xlink:href="states#id(''8830'')" />
      </item>
      <item type="reference">
        <reference id_state="8831" xlink:type="simple" xlink:href="states#id(''8831'')" />
      </item>
      <item type="reference">
        <reference id_state="8832" xlink:type="simple" xlink:href="states#id(''8832'')" />
      </item>
      <item type="reference">
        <reference id_state="8833" xlink:type="simple" xlink:href="states#id(''8833'')" />
      </item>
      <item type="reference">
        <reference id_state="8834" xlink:type="simple" xlink:href="states#id(''8834'')" />
      </item>
      <item type="reference">
        <reference id_state="8835" xlink:type="simple" xlink:href="states#id(''8835'')" />
      </item>
      <item type="reference">
        <reference id_state="8836" xlink:type="simple" xlink:href="states#id(''8836'')" />
      </item>
      <item type="reference">
        <reference id_state="8837" xlink:type="simple" xlink:href="states#id(''8837'')" />
      </item>
      <item type="reference">
        <reference id_state="8838" xlink:type="simple" xlink:href="states#id(''8838'')" />
      </item>
      <item type="reference">
        <reference id_state="8839" xlink:type="simple" xlink:href="states#id(''8839'')" />
      </item>
      <item type="reference">
        <reference id_state="8840" xlink:type="simple" xlink:href="states#id(''8840'')" />
      </item>
      <item type="reference">
        <reference id_state="8841" xlink:type="simple" xlink:href="states#id(''8841'')" />
      </item>
      <item type="reference">
        <reference id_state="8842" xlink:type="simple" xlink:href="states#id(''8842'')" />
      </item>
      <item type="reference">
        <reference id_state="8843" xlink:type="simple" xlink:href="states#id(''8843'')" />
      </item>
      <item type="reference">
        <reference id_state="8844" xlink:type="simple" xlink:href="states#id(''8844'')" />
      </item>
      <item type="reference">
        <reference id_state="8845" xlink:type="simple" xlink:href="states#id(''8845'')" />
      </item>
      <item type="reference">
        <reference id_state="8846" xlink:type="simple" xlink:href="states#id(''8846'')" />
      </item>
      <item type="reference">
        <reference id_state="8847" xlink:type="simple" xlink:href="states#id(''8847'')" />
      </item>
      <item type="reference">
        <reference id_state="8848" xlink:type="simple" xlink:href="states#id(''8848'')" />
      </item>
      <item type="reference">
        <reference id_state="8849" xlink:type="simple" xlink:href="states#id(''8849'')" />
      </item>
      <item type="reference">
        <reference id_state="8850" xlink:type="simple" xlink:href="states#id(''8850'')" />
      </item>
      <item type="reference">
        <reference id_state="8851" xlink:type="simple" xlink:href="states#id(''8851'')" />
      </item>
      <item type="reference">
        <reference id_state="8852" xlink:type="simple" xlink:href="states#id(''8852'')" />
      </item>
      <item type="reference">
        <reference id_state="8853" xlink:type="simple" xlink:href="states#id(''8853'')" />
      </item>
      <item type="reference">
        <reference id_state="8854" xlink:type="simple" xlink:href="states#id(''8854'')" />
      </item>
      <item type="reference">
        <reference id_state="8855" xlink:type="simple" xlink:href="states#id(''8855'')" />
      </item>
      <item type="reference">
        <reference id_state="8856" xlink:type="simple" xlink:href="states#id(''8856'')" />
      </item>
      <item type="reference">
        <reference id_state="8857" xlink:type="simple" xlink:href="states#id(''8857'')" />
      </item>
      <item type="reference">
        <reference id_state="8858" xlink:type="simple" xlink:href="states#id(''8858'')" />
      </item>
      <item type="reference">
        <reference id_state="8859" xlink:type="simple" xlink:href="states#id(''8859'')" />
      </item>
      <item type="reference">
        <reference id_state="8860" xlink:type="simple" xlink:href="states#id(''8860'')" />
      </item>
      <item type="reference">
        <reference id_state="8861" xlink:type="simple" xlink:href="states#id(''8861'')" />
      </item>
      <item type="reference">
        <reference id_state="8862" xlink:type="simple" xlink:href="states#id(''8862'')" />
      </item>
      <item type="reference">
        <reference id_state="8863" xlink:type="simple" xlink:href="states#id(''8863'')" />
      </item>
      <item type="reference">
        <reference id_state="8864" xlink:type="simple" xlink:href="states#id(''8864'')" />
      </item>
      <item type="reference">
        <reference id_state="8865" xlink:type="simple" xlink:href="states#id(''8865'')" />
      </item>
      <item type="reference">
        <reference id_state="8866" xlink:type="simple" xlink:href="states#id(''8866'')" />
      </item>
      <item type="reference">
        <reference id_state="8867" xlink:type="simple" xlink:href="states#id(''8867'')" />
      </item>
      <item type="reference">
        <reference id_state="8868" xlink:type="simple" xlink:href="states#id(''8868'')" />
      </item>
      <item type="reference">
        <reference id_state="8869" xlink:type="simple" xlink:href="states#id(''8869'')" />
      </item>
      <item type="reference">
        <reference id_state="8870" xlink:type="simple" xlink:href="states#id(''8870'')" />
      </item>
      <item type="reference">
        <reference id_state="8871" xlink:type="simple" xlink:href="states#id(''8871'')" />
      </item>
      <item type="reference">
        <reference id_state="8872" xlink:type="simple" xlink:href="states#id(''8872'')" />
      </item>
      <item type="reference">
        <reference id_state="8873" xlink:type="simple" xlink:href="states#id(''8873'')" />
      </item>
      <item type="reference">
        <reference id_state="8874" xlink:type="simple" xlink:href="states#id(''8874'')" />
      </item>
      <item type="reference">
        <reference id_state="8875" xlink:type="simple" xlink:href="states#id(''8875'')" />
      </item>
      <item type="reference">
        <reference id_state="8876" xlink:type="simple" xlink:href="states#id(''8876'')" />
      </item>
      <item type="reference">
        <reference id_state="8877" xlink:type="simple" xlink:href="states#id(''8877'')" />
      </item>
      <item type="reference">
        <reference id_state="8878" xlink:type="simple" xlink:href="states#id(''8878'')" />
      </item>
      <item type="reference">
        <reference id_state="8879" xlink:type="simple" xlink:href="states#id(''8879'')" />
      </item>
      <item type="reference">
        <reference id_state="8880" xlink:type="simple" xlink:href="states#id(''8880'')" />
      </item>
      <item type="reference">
        <reference id_state="8881" xlink:type="simple" xlink:href="states#id(''8881'')" />
      </item>
      <item type="reference">
        <reference id_state="8882" xlink:type="simple" xlink:href="states#id(''8882'')" />
      </item>
      <item type="reference">
        <reference id_state="8883" xlink:type="simple" xlink:href="states#id(''8883'')" />
      </item>
      <item type="reference">
        <reference id_state="8884" xlink:type="simple" xlink:href="states#id(''8884'')" />
      </item>
      <item type="reference">
        <reference id_state="8885" xlink:type="simple" xlink:href="states#id(''8885'')" />
      </item>
      <item type="reference">
        <reference id_state="8886" xlink:type="simple" xlink:href="states#id(''8886'')" />
      </item>
      <item type="reference">
        <reference id_state="8887" xlink:type="simple" xlink:href="states#id(''8887'')" />
      </item>
      <item type="reference">
        <reference id_state="8888" xlink:type="simple" xlink:href="states#id(''8888'')" />
      </item>
      <item type="reference">
        <reference id_state="8889" xlink:type="simple" xlink:href="states#id(''8889'')" />
      </item>
      <item type="reference">
        <reference id_state="8890" xlink:type="simple" xlink:href="states#id(''8890'')" />
      </item>
      <item type="reference">
        <reference id_state="8891" xlink:type="simple" xlink:href="states#id(''8891'')" />
      </item>
      <item type="reference">
        <reference id_state="8892" xlink:type="simple" xlink:href="states#id(''8892'')" />
      </item>
      <item type="reference">
        <reference id_state="8893" xlink:type="simple" xlink:href="states#id(''8893'')" />
      </item>
      <item type="reference">
        <reference id_state="8894" xlink:type="simple" xlink:href="states#id(''8894'')" />
      </item>
      <item type="reference">
        <reference id_state="8895" xlink:type="simple" xlink:href="states#id(''8895'')" />
      </item>
      <item type="reference">
        <reference id_state="8896" xlink:type="simple" xlink:href="states#id(''8896'')" />
      </item>
      <item type="reference">
        <reference id_state="8897" xlink:type="simple" xlink:href="states#id(''8897'')" />
      </item>
      <item type="reference">
        <reference id_state="8898" xlink:type="simple" xlink:href="states#id(''8898'')" />
      </item>
      <item type="reference">
        <reference id_state="8899" xlink:type="simple" xlink:href="states#id(''8899'')" />
      </item>
      <item type="reference">
        <reference id_state="8900" xlink:type="simple" xlink:href="states#id(''8900'')" />
      </item>
      <item type="reference">
        <reference id_state="8901" xlink:type="simple" xlink:href="states#id(''8901'')" />
      </item>
      <item type="reference">
        <reference id_state="8902" xlink:type="simple" xlink:href="states#id(''8902'')" />
      </item>
      <item type="reference">
        <reference id_state="8903" xlink:type="simple" xlink:href="states#id(''8903'')" />
      </item>
      <item type="reference">
        <reference id_state="8904" xlink:type="simple" xlink:href="states#id(''8904'')" />
      </item>
      <item type="reference">
        <reference id_state="8905" xlink:type="simple" xlink:href="states#id(''8905'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">8</shapeType>
    <fieldTypes type="list">
      <item type="integer">7</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="8800" xlink:type="simple" xlink:href="states#id(''8800'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__SimpleLineSymbol id="8800">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8801" xlink:type="simple" xlink:href="states#id(''8801'')" />
    </color>
    <description type="string">Padr�o</description>
    <lineStyle type="reference">
        <reference id_state="8802" xlink:type="simple" xlink:href="states#id(''8802'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8801">
    <red type="integer">51</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8802">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8803">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8804" xlink:type="simple" xlink:href="states#id(''8804'')" />
    </color>
    <description type="string">Default</description>
    <lineStyle type="reference">
        <reference id_state="8805" xlink:type="simple" xlink:href="states#id(''8805'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8804">
    <red type="integer">5</red>
    <blue type="integer">48</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8805">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">1.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__AwtColor id="8806">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8807">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8808">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8809">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8810">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8811">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8812">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8813">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8814">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8815">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8816">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8817">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8818">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8819">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8820">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8821">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8822">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8823">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8824">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8825">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8826">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8827">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8828">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8829">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8830">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8831">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8832">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8833">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8834">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8835">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8836">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8837">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8838">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8839">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8840">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8841">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8842">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8843">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8844">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8845">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8846">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8847">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8848">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8849">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8850">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8851">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8852">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8853">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8854">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8855">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8856">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8857">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8858">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8859">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8860">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8861">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8862">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8863">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8864">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8865">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8866">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8867">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8868">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8869">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8870">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8871">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8872">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8873">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8874">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8875">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8876">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8877">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8878">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8879">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8880">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8881">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8882">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8883">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8884">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8885">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8886">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8887">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8888">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8889">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8890">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8891">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8892">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8893">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8894">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8895">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8896">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8897">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8898">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8899">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8900">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8901">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8902">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8903">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8904">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="8905">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineSymbol id="8906">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8909" xlink:type="simple" xlink:href="states#id(''8909'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8907" xlink:type="simple" xlink:href="states#id(''8907'')" />
    </color>
    <description type="string">0</description>
    <lineStyle type="reference">
        <reference id_state="8908" xlink:type="simple" xlink:href="states#id(''8908'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8907">
    <red type="integer">255</red>
    <blue type="integer">255</blue>
    <green type="integer">255</green>
    <alpha type="integer">0</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8908">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8909">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">0 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8911" xlink:type="simple" xlink:href="states#id(''8911'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8910">
    <red type="integer">255</red>
    <blue type="integer">0</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8911">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">0.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8912">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8915" xlink:type="simple" xlink:href="states#id(''8915'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">50</description>
    <lineStyle type="reference">
        <reference id_state="8914" xlink:type="simple" xlink:href="states#id(''8914'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__AwtColor id="8913">
    <red type="integer">0</red>
    <blue type="integer">0</blue>
    <green type="integer">0</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__SimpleLineStyle id="8914">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8915">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">50 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8916" xlink:type="simple" xlink:href="states#id(''8916'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8916">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8917">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8919" xlink:type="simple" xlink:href="states#id(''8919'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">100</description>
    <lineStyle type="reference">
        <reference id_state="8918" xlink:type="simple" xlink:href="states#id(''8918'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8918">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8919">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">100 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8920" xlink:type="simple" xlink:href="states#id(''8920'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8920">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8921">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8923" xlink:type="simple" xlink:href="states#id(''8923'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">150</description>
    <lineStyle type="reference">
        <reference id_state="8922" xlink:type="simple" xlink:href="states#id(''8922'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8922">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8923">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">150 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8924" xlink:type="simple" xlink:href="states#id(''8924'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8924">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8925">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8927" xlink:type="simple" xlink:href="states#id(''8927'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">200</description>
    <lineStyle type="reference">
        <reference id_state="8926" xlink:type="simple" xlink:href="states#id(''8926'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8926">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8927">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">200 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8928" xlink:type="simple" xlink:href="states#id(''8928'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8928">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8929">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8931" xlink:type="simple" xlink:href="states#id(''8931'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">250</description>
    <lineStyle type="reference">
        <reference id_state="8930" xlink:type="simple" xlink:href="states#id(''8930'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8930">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8931">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">250 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8932" xlink:type="simple" xlink:href="states#id(''8932'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8932">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8933">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8935" xlink:type="simple" xlink:href="states#id(''8935'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">300</description>
    <lineStyle type="reference">
        <reference id_state="8934" xlink:type="simple" xlink:href="states#id(''8934'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8934">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8935">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">300 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8936" xlink:type="simple" xlink:href="states#id(''8936'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8936">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8937">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8939" xlink:type="simple" xlink:href="states#id(''8939'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">350</description>
    <lineStyle type="reference">
        <reference id_state="8938" xlink:type="simple" xlink:href="states#id(''8938'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8938">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8939">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">350 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8940" xlink:type="simple" xlink:href="states#id(''8940'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8940">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8941">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8943" xlink:type="simple" xlink:href="states#id(''8943'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">400</description>
    <lineStyle type="reference">
        <reference id_state="8942" xlink:type="simple" xlink:href="states#id(''8942'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8942">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8943">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">400 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8944" xlink:type="simple" xlink:href="states#id(''8944'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8944">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8945">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8947" xlink:type="simple" xlink:href="states#id(''8947'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">450</description>
    <lineStyle type="reference">
        <reference id_state="8946" xlink:type="simple" xlink:href="states#id(''8946'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8946">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8947">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">450 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8948" xlink:type="simple" xlink:href="states#id(''8948'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8948">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8949">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8951" xlink:type="simple" xlink:href="states#id(''8951'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">500</description>
    <lineStyle type="reference">
        <reference id_state="8950" xlink:type="simple" xlink:href="states#id(''8950'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8950">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8951">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">500 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8952" xlink:type="simple" xlink:href="states#id(''8952'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8952">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8953">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8955" xlink:type="simple" xlink:href="states#id(''8955'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">550</description>
    <lineStyle type="reference">
        <reference id_state="8954" xlink:type="simple" xlink:href="states#id(''8954'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8954">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8955">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">550 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8956" xlink:type="simple" xlink:href="states#id(''8956'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8956">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8957">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8959" xlink:type="simple" xlink:href="states#id(''8959'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">600</description>
    <lineStyle type="reference">
        <reference id_state="8958" xlink:type="simple" xlink:href="states#id(''8958'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8958">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8959">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">600 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8960" xlink:type="simple" xlink:href="states#id(''8960'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8960">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8961">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8963" xlink:type="simple" xlink:href="states#id(''8963'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">650</description>
    <lineStyle type="reference">
        <reference id_state="8962" xlink:type="simple" xlink:href="states#id(''8962'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8962">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8963">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">650 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8964" xlink:type="simple" xlink:href="states#id(''8964'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8964">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8965">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8967" xlink:type="simple" xlink:href="states#id(''8967'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">700</description>
    <lineStyle type="reference">
        <reference id_state="8966" xlink:type="simple" xlink:href="states#id(''8966'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8966">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8967">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">700 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8968" xlink:type="simple" xlink:href="states#id(''8968'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8968">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8969">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8971" xlink:type="simple" xlink:href="states#id(''8971'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">750</description>
    <lineStyle type="reference">
        <reference id_state="8970" xlink:type="simple" xlink:href="states#id(''8970'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8970">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8971">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">750 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8972" xlink:type="simple" xlink:href="states#id(''8972'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8972">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8973">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8975" xlink:type="simple" xlink:href="states#id(''8975'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">800</description>
    <lineStyle type="reference">
        <reference id_state="8974" xlink:type="simple" xlink:href="states#id(''8974'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8974">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8975">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">800 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8976" xlink:type="simple" xlink:href="states#id(''8976'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8976">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8977">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8979" xlink:type="simple" xlink:href="states#id(''8979'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">850</description>
    <lineStyle type="reference">
        <reference id_state="8978" xlink:type="simple" xlink:href="states#id(''8978'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8978">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8979">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">850 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8980" xlink:type="simple" xlink:href="states#id(''8980'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8980">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8981">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8983" xlink:type="simple" xlink:href="states#id(''8983'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">900</description>
    <lineStyle type="reference">
        <reference id_state="8982" xlink:type="simple" xlink:href="states#id(''8982'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8982">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8983">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">900 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8984" xlink:type="simple" xlink:href="states#id(''8984'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8984">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8985">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8987" xlink:type="simple" xlink:href="states#id(''8987'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">950</description>
    <lineStyle type="reference">
        <reference id_state="8986" xlink:type="simple" xlink:href="states#id(''8986'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8986">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8987">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">950 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8988" xlink:type="simple" xlink:href="states#id(''8988'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8988">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8989">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8991" xlink:type="simple" xlink:href="states#id(''8991'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">1000</description>
    <lineStyle type="reference">
        <reference id_state="8990" xlink:type="simple" xlink:href="states#id(''8990'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8990">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8991">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">1000 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8992" xlink:type="simple" xlink:href="states#id(''8992'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8992">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8993">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8995" xlink:type="simple" xlink:href="states#id(''8995'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">1050</description>
    <lineStyle type="reference">
        <reference id_state="8994" xlink:type="simple" xlink:href="states#id(''8994'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8994">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8995">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">1050 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="8996" xlink:type="simple" xlink:href="states#id(''8996'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8996">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8997">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="8999" xlink:type="simple" xlink:href="states#id(''8999'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">1100</description>
    <lineStyle type="reference">
        <reference id_state="8998" xlink:type="simple" xlink:href="states#id(''8998'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="8998">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="8999">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">1100 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="9000" xlink:type="simple" xlink:href="states#id(''9000'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="9000">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="9001">
    <unit type="integer">-1</unit>
    <symbolForSelection type="reference">
        <reference id_state="9003" xlink:type="simple" xlink:href="states#id(''9003'')" />
    </symbolForSelection>
    <color type="reference">
        <reference id_state="8913" xlink:type="simple" xlink:href="states#id(''8913'')" />
    </color>
    <description type="string">1150</description>
    <lineStyle type="reference">
        <reference id_state="9002" xlink:type="simple" xlink:href="states#id(''9002'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="9002">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
  <Persistence__SimpleLineSymbol id="9003">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="8910" xlink:type="simple" xlink:href="states#id(''8910'')" />
    </color>
    <description type="string">1150 version for selection</description>
    <lineStyle type="reference">
        <reference id_state="9004" xlink:type="simple" xlink:href="states#id(''9004'')" />
    </lineStyle>
    <referenceSystem type="integer">0</referenceSystem>
    <isShapeVisible type="boolean">true</isShapeVisible>
  </Persistence__SimpleLineSymbol>
  <Persistence__SimpleLineStyle id="9004">
    <lineJoin type="integer">2</lineJoin>
    <unit type="integer">0</unit>
    <arrowDecorator type="null"></arrowDecorator>
    <description type="null"></description>
    <miterLimit type="float">10.0</miterLimit>
    <endCap type="integer">0</endCap>
    <lineWidth type="float">2.0</lineWidth>
    <dashPhase type="float">0.0</dashPhase>
    <tempDashArray type="null"></tempDashArray>
    <dashArray type="null"></dashArray>
    <offset type="double">0.0</offset>
  </Persistence__SimpleLineStyle>
</states>
</XMLPersitence>
', NULL);


COMMIT;
