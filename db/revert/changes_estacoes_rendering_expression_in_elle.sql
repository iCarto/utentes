BEGIN;

DELETE FROM elle._map_style WHERE nombre_capa = 'estacoes' and nombre_estilo = 'BDD_Inventario';
DELETE FROM elle._map_style WHERE nombre_capa = 'estacoes' and nombre_estilo = 'SIXHIARA';

INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) VALUES ('estacoes', 'BDD_Inventario', 'gvl', '<?xml version="1.0" encoding="UTF-8"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="760" xlink:type="simple" xlink:href="states#id(''760'')" />
<states>
  <Persistence__FILTER_EXPRESSION_LEGEND_PERSISTENCE_DEFINITION_NAME id="760">
    <itemSymbolArray type="list">
      <item type="reference">
        <reference id_state="764" xlink:type="simple" xlink:href="states#id(''764'')" />
      </item>
      <item type="reference">
        <reference id_state="772" xlink:type="simple" xlink:href="states#id(''772'')" />
      </item>
      <item type="reference">
        <reference id_state="778" xlink:type="simple" xlink:href="states#id(''778'')" />
      </item>
      <item type="reference">
        <reference id_state="784" xlink:type="simple" xlink:href="states#id(''784'')" />
      </item>
    </itemSymbolArray>
    <shapeType type="integer">1</shapeType>
    <hasZSort type="boolean">false</hasZSort>
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
      <item type="integer">4</item>
      <item type="integer">8</item>
      <item type="integer">4</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">4</item>
      <item type="integer">4</item>
      <item type="integer">4</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">1</item>
      <item type="integer">8</item>
      <item type="integer">1</item>
      <item type="integer">4</item>
      <item type="integer">1</item>
      <item type="integer">8</item>
      <item type="integer">1</item>
      <item type="integer">8</item>
      <item type="integer">1</item>
      <item type="integer">4</item>
      <item type="integer">1</item>
      <item type="integer">8</item>
      <item type="integer">1</item>
      <item type="integer">1</item>
      <item type="integer">8</item>
      <item type="integer">4</item>
      <item type="integer">8</item>
      <item type="integer">8</item>
      <item type="integer">66</item>
    </fieldTypes>
    <defaultSymbol type="reference">
        <reference id_state="761" xlink:type="simple" xlink:href="states#id(''761'')" />
    </defaultSymbol>
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
      <item type="string">nivel</item>
      <item type="string">n_precis</item>
      <item type="string">lin_em</item>
      <item type="string">n_lin_em</item>
      <item type="string">n_outros</item>
      <item type="string">n_t_outro</item>
      <item type="string">velocidad</item>
      <item type="string">v_precis</item>
      <item type="string">molinetes</item>
      <item type="string">n_molinet</item>
      <item type="string">v_outros</item>
      <item type="string">v_t_outro</item>
      <item type="string">caudal</item>
      <item type="string">pluviomet</item>
      <item type="string">tip_pluvi</item>
      <item type="string">n_pluviom</item>
      <item type="string">coment</item>
      <item type="string">sac</item>
      <item type="string">geom</item>
    </fieldNames>
    <itemStringArray type="list">
      <item type="string">tip_estac = ''Hidrométrica'' and estado = ''Operacional''</item>
      <item type="string">tip_estac = ''Hidrométrica'' and (estado != ''Operacional'' or estado is null)</item>
      <item type="string">tip_estac = ''Pluviométrica'' and estado = ''Operacional''</item>
      <item type="string">tip_estac = ''Pluviométrica'' and (estado != ''Operacional'' or estado is null)</item>
    </itemStringArray>
    <useDefaultSymbol type="boolean">false</useDefaultSymbol>
  </Persistence__FILTER_EXPRESSION_LEGEND_PERSISTENCE_DEFINITION_NAME>
  <Persistence__SimpleMarkerSymbol id="761">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <unit type="integer">-1</unit>
    <outlined type="boolean">false</outlined>
    <color type="reference">
        <reference id_state="762" xlink:type="simple" xlink:href="states#id(''762'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <size type="double">4.0</size>
    <markerStyle type="integer">0</markerStyle>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="762">
    <red type="integer">242</red>
    <green type="integer">176</green>
    <blue type="integer">131</blue>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="763">
    <x type="double">0.0</x>
    <y type="double">0.0</y>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="764">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="765" xlink:type="simple" xlink:href="states#id(''765'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="771" xlink:type="simple" xlink:href="states#id(''771'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">Hidrométrica - Operacional</description>
    <bgImage type="reference">
        <reference id_state="770" xlink:type="simple" xlink:href="states#id(''770'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">20.0</size>
    <selectionSym type="reference">
        <reference id_state="766" xlink:type="simple" xlink:href="states#id(''766'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">false</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="765">
    <red type="integer">60</red>
    <green type="integer">235</green>
    <blue type="integer">235</blue>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__PictureMarkerSymbol id="766">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="767" xlink:type="simple" xlink:href="states#id(''767'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="769" xlink:type="simple" xlink:href="states#id(''769'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">poi_tower_water</description>
    <bgImage type="reference">
        <reference id_state="768" xlink:type="simple" xlink:href="states#id(''768'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">20.0</size>
    <selectionSym type="reference">
        <reference id_state="766" xlink:type="simple" xlink:href="states#id(''766'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">true</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="767">
    <red type="integer">255</red>
    <green type="integer">255</green>
    <blue type="integer">0</blue>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__ImageStyle id="768">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="769">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="770">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="771">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="772">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="765" xlink:type="simple" xlink:href="states#id(''765'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="777" xlink:type="simple" xlink:href="states#id(''777'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">Hidrométrica - Não Operacional</description>
    <bgImage type="reference">
        <reference id_state="776" xlink:type="simple" xlink:href="states#id(''776'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">15.0</size>
    <selectionSym type="reference">
        <reference id_state="773" xlink:type="simple" xlink:href="states#id(''773'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">false</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="773">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="767" xlink:type="simple" xlink:href="states#id(''767'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="775" xlink:type="simple" xlink:href="states#id(''775'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">poi_tower_water</description>
    <bgImage type="reference">
        <reference id_state="774" xlink:type="simple" xlink:href="states#id(''774'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">15.0</size>
    <selectionSym type="reference">
        <reference id_state="773" xlink:type="simple" xlink:href="states#id(''773'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">true</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="774">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="775">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="776">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="777">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="778">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="765" xlink:type="simple" xlink:href="states#id(''765'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="783" xlink:type="simple" xlink:href="states#id(''783'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">Pluviométrica - Operacional</description>
    <bgImage type="reference">
        <reference id_state="782" xlink:type="simple" xlink:href="states#id(''782'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">20.0</size>
    <selectionSym type="reference">
        <reference id_state="779" xlink:type="simple" xlink:href="states#id(''779'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">false</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="779">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="767" xlink:type="simple" xlink:href="states#id(''767'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="781" xlink:type="simple" xlink:href="states#id(''781'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">water_tower</description>
    <bgImage type="reference">
        <reference id_state="780" xlink:type="simple" xlink:href="states#id(''780'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">20.0</size>
    <selectionSym type="reference">
        <reference id_state="779" xlink:type="simple" xlink:href="states#id(''779'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">true</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="780">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="781">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="782">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="783">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="784">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="765" xlink:type="simple" xlink:href="states#id(''765'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="789" xlink:type="simple" xlink:href="states#id(''789'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">Pluviométrica - Não Operacional</description>
    <bgImage type="reference">
        <reference id_state="788" xlink:type="simple" xlink:href="states#id(''788'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">15.0</size>
    <selectionSym type="reference">
        <reference id_state="785" xlink:type="simple" xlink:href="states#id(''785'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">false</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="785">
    <isShapeVisible type="boolean">true</isShapeVisible>
    <color type="reference">
        <reference id_state="767" xlink:type="simple" xlink:href="states#id(''767'')" />
    </color>
    <offset type="reference">
        <reference id_state="763" xlink:type="simple" xlink:href="states#id(''763'')" />
    </offset>
    <bgSelImage type="reference">
        <reference id_state="787" xlink:type="simple" xlink:href="states#id(''787'')" />
    </bgSelImage>
    <rotation type="double">0.0</rotation>
    <description type="string">water_tower</description>
    <bgImage type="reference">
        <reference id_state="786" xlink:type="simple" xlink:href="states#id(''786'')" />
    </bgImage>
    <unit type="integer">-1</unit>
    <size type="double">15.0</size>
    <selectionSym type="reference">
        <reference id_state="785" xlink:type="simple" xlink:href="states#id(''785'')" />
    </selectionSym>
    <referenceSystem type="integer">0</referenceSystem>
    <selected type="boolean">true</selected>
    <mask type="null"></mask>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="786">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="787">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="788">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="789">
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
    <source type="url">file:/E:/190527/190527_SIRHAS_Inventario/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
', NULL);


INSERT INTO elle._map_style
    (nombre_capa, nombre_estilo, type, definicion, label)
SELECT
     nombre_capa, 'SIXHIARA', type, definicion, label
FROM elle._map_style
WHERE
    nombre_capa = 'estacoes'
    and nombre_estilo = 'BDD_Inventario';

COMMIT;
