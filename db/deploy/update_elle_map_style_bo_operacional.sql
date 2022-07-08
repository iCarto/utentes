-- Deploy utentes:update_elle_map_style_bo_operacional to pg

BEGIN;

UPDATE elle._map_style
SET definicion = '<?xml version="1.0" encoding="UTF-8"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="3" xlink:type="simple" xlink:href="states#id(''3'')" />
<states>
  <Persistence__FILTER_EXPRESSION_LEGEND_PERSISTENCE_DEFINITION_NAME id="3">
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
    <hasZSort type="boolean">false</hasZSort>
    <itemStringArray type="list">
      <item type="string">tip_estac = ''Hidrométrica'' and estado = ''Operacional''</item>
      <item type="string">tip_estac = ''Hidrométrica'' and estado != ''Operacional''</item>
      <item type="string">tip_estac = ''Pluviométrica'' and estado = ''Operacional''</item>
      <item type="string">tip_estac = ''Pluviométrica'' and estado != ''Operacional''</item>
    </itemStringArray>
    <itemSymbolArray type="list">
      <item type="reference">
        <reference id_state="7" xlink:type="simple" xlink:href="states#id(''7'')" />
      </item>
      <item type="reference">
        <reference id_state="14" xlink:type="simple" xlink:href="states#id(''14'')" />
      </item>
      <item type="reference">
        <reference id_state="20" xlink:type="simple" xlink:href="states#id(''20'')" />
      </item>
      <item type="reference">
        <reference id_state="26" xlink:type="simple" xlink:href="states#id(''26'')" />
      </item>
    </itemSymbolArray>
    <defaultSymbol type="reference">
        <reference id_state="4" xlink:type="simple" xlink:href="states#id(''4'')" />
    </defaultSymbol>
  </Persistence__FILTER_EXPRESSION_LEGEND_PERSISTENCE_DEFINITION_NAME>
  <Persistence__SimpleMarkerSymbol id="4">
    <unit type="integer">-1</unit>
    <color type="reference">
        <reference id_state="5" xlink:type="simple" xlink:href="states#id(''5'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="null"></description>
    <outlined type="boolean">false</outlined>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <markerStyle type="integer">0</markerStyle>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">4.0</size>
  </Persistence__SimpleMarkerSymbol>
  <Persistence__AwtColor id="5">
    <red type="integer">242</red>
    <blue type="integer">131</blue>
    <green type="integer">176</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="6">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="7">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="13" xlink:type="simple" xlink:href="states#id(''13'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="9" xlink:type="simple" xlink:href="states#id(''9'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Hidrométrica - Operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="12" xlink:type="simple" xlink:href="states#id(''12'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="8">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__PictureMarkerSymbol id="9">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="11" xlink:type="simple" xlink:href="states#id(''11'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="9" xlink:type="simple" xlink:href="states#id(''9'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">poi_tower_water</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="10" xlink:type="simple" xlink:href="states#id(''10'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="10">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="11">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="12">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="13">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="14">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="19" xlink:type="simple" xlink:href="states#id(''19'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="15" xlink:type="simple" xlink:href="states#id(''15'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Hidrométrica - Não Operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="18" xlink:type="simple" xlink:href="states#id(''18'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="15">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="17" xlink:type="simple" xlink:href="states#id(''17'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="15" xlink:type="simple" xlink:href="states#id(''15'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">poi_tower_water</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="16" xlink:type="simple" xlink:href="states#id(''16'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="16">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="17">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="18">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="19">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/poi_tower_water_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/poi_tower_water_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="20">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="21" xlink:type="simple" xlink:href="states#id(''21'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Pluviométrica - Operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="21">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="23" xlink:type="simple" xlink:href="states#id(''23'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="21" xlink:type="simple" xlink:href="states#id(''21'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">water_tower</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="22" xlink:type="simple" xlink:href="states#id(''22'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">20.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="22">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="23">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="24">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="25">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="26">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="31" xlink:type="simple" xlink:href="states#id(''31'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="27" xlink:type="simple" xlink:href="states#id(''27'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Pluviométrica - Não Operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="30" xlink:type="simple" xlink:href="states#id(''30'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="27">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="29" xlink:type="simple" xlink:href="states#id(''29'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="27" xlink:type="simple" xlink:href="states#id(''27'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="8" xlink:type="simple" xlink:href="states#id(''8'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">water_tower</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="28" xlink:type="simple" xlink:href="states#id(''28'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="6" xlink:type="simple" xlink:href="states#id(''6'')" />
    </offset>
    <size type="double">15.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="28">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="29">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="30">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="31">
    <source type="url">file:/E:/gvSIG_SIXHIARA_20160916/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/water_tower_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/water_tower_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>'
WHERE nombre_capa = 'estacoes';

UPDATE elle._map_style
SET definicion = '<?xml version="1.0" encoding="UTF-8"?>
<XMLPersitence xmlns:xlink="http://www.w3.org/1999/xlink" >
<persistence_xml_version>2.0.0</persistence_xml_version>
  <rootState id_state="22" xlink:type="simple" xlink:href="states#id(''22'')" />
<states>
  <Persistence__VectorialUniqueValueLegend id="22">
    <nullValueSymbol type="null"></nullValueSymbol>
    <symbols type="map">
      <mapitem>
        <key type="string">Bo</key>
        <value type="reference">
        <reference id_state="131" xlink:type="simple" xlink:href="states#id(''131'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Em carteira</key>
        <value type="reference">
        <reference id_state="137" xlink:type="simple" xlink:href="states#id(''137'')" />
    </value>
      </mapitem>

      <mapitem>
        <key type="string">Não operacional</key>
        <value type="reference">
        <reference id_state="143" xlink:type="simple" xlink:href="states#id(''143'')" />
    </value>
      </mapitem>
</symbols>
    <useDefaultSymbol type="boolean">true</useDefaultSymbol>
    <keys type="list">
      <item type="string">Operacional</item>
      <item type="string">Em carteira</item>
      <item type="string">Não operacional</item>
    </keys>
    <fieldNames type="list">
      <item type="string">estado</item>
    </fieldNames>
    <selectedColors type="list">
      <item type="reference">
        <reference id_state="31" xlink:type="simple" xlink:href="states#id(''31'')" />
      </item>
      <item type="reference">
        <reference id_state="32" xlink:type="simple" xlink:href="states#id(''32'')" />
      </item>
      <item type="reference">
        <reference id_state="33" xlink:type="simple" xlink:href="states#id(''33'')" />
      </item>
      <item type="reference">
        <reference id_state="34" xlink:type="simple" xlink:href="states#id(''34'')" />
      </item>
      <item type="reference">
        <reference id_state="35" xlink:type="simple" xlink:href="states#id(''35'')" />
      </item>
      <item type="reference">
        <reference id_state="36" xlink:type="simple" xlink:href="states#id(''36'')" />
      </item>
      <item type="reference">
        <reference id_state="37" xlink:type="simple" xlink:href="states#id(''37'')" />
      </item>
      <item type="reference">
        <reference id_state="38" xlink:type="simple" xlink:href="states#id(''38'')" />
      </item>
      <item type="reference">
        <reference id_state="39" xlink:type="simple" xlink:href="states#id(''39'')" />
      </item>
      <item type="reference">
        <reference id_state="40" xlink:type="simple" xlink:href="states#id(''40'')" />
      </item>
      <item type="reference">
        <reference id_state="41" xlink:type="simple" xlink:href="states#id(''41'')" />
      </item>
      <item type="reference">
        <reference id_state="42" xlink:type="simple" xlink:href="states#id(''42'')" />
      </item>
      <item type="reference">
        <reference id_state="43" xlink:type="simple" xlink:href="states#id(''43'')" />
      </item>
      <item type="reference">
        <reference id_state="44" xlink:type="simple" xlink:href="states#id(''44'')" />
      </item>
      <item type="reference">
        <reference id_state="45" xlink:type="simple" xlink:href="states#id(''45'')" />
      </item>
      <item type="reference">
        <reference id_state="46" xlink:type="simple" xlink:href="states#id(''46'')" />
      </item>
      <item type="reference">
        <reference id_state="47" xlink:type="simple" xlink:href="states#id(''47'')" />
      </item>
      <item type="reference">
        <reference id_state="48" xlink:type="simple" xlink:href="states#id(''48'')" />
      </item>
      <item type="reference">
        <reference id_state="49" xlink:type="simple" xlink:href="states#id(''49'')" />
      </item>
      <item type="reference">
        <reference id_state="50" xlink:type="simple" xlink:href="states#id(''50'')" />
      </item>
      <item type="reference">
        <reference id_state="51" xlink:type="simple" xlink:href="states#id(''51'')" />
      </item>
      <item type="reference">
        <reference id_state="52" xlink:type="simple" xlink:href="states#id(''52'')" />
      </item>
      <item type="reference">
        <reference id_state="53" xlink:type="simple" xlink:href="states#id(''53'')" />
      </item>
      <item type="reference">
        <reference id_state="54" xlink:type="simple" xlink:href="states#id(''54'')" />
      </item>
      <item type="reference">
        <reference id_state="55" xlink:type="simple" xlink:href="states#id(''55'')" />
      </item>
      <item type="reference">
        <reference id_state="56" xlink:type="simple" xlink:href="states#id(''56'')" />
      </item>
      <item type="reference">
        <reference id_state="57" xlink:type="simple" xlink:href="states#id(''57'')" />
      </item>
      <item type="reference">
        <reference id_state="58" xlink:type="simple" xlink:href="states#id(''58'')" />
      </item>
      <item type="reference">
        <reference id_state="59" xlink:type="simple" xlink:href="states#id(''59'')" />
      </item>
      <item type="reference">
        <reference id_state="60" xlink:type="simple" xlink:href="states#id(''60'')" />
      </item>
      <item type="reference">
        <reference id_state="61" xlink:type="simple" xlink:href="states#id(''61'')" />
      </item>
      <item type="reference">
        <reference id_state="62" xlink:type="simple" xlink:href="states#id(''62'')" />
      </item>
      <item type="reference">
        <reference id_state="63" xlink:type="simple" xlink:href="states#id(''63'')" />
      </item>
      <item type="reference">
        <reference id_state="64" xlink:type="simple" xlink:href="states#id(''64'')" />
      </item>
      <item type="reference">
        <reference id_state="65" xlink:type="simple" xlink:href="states#id(''65'')" />
      </item>
      <item type="reference">
        <reference id_state="66" xlink:type="simple" xlink:href="states#id(''66'')" />
      </item>
      <item type="reference">
        <reference id_state="67" xlink:type="simple" xlink:href="states#id(''67'')" />
      </item>
      <item type="reference">
        <reference id_state="68" xlink:type="simple" xlink:href="states#id(''68'')" />
      </item>
      <item type="reference">
        <reference id_state="69" xlink:type="simple" xlink:href="states#id(''69'')" />
      </item>
      <item type="reference">
        <reference id_state="70" xlink:type="simple" xlink:href="states#id(''70'')" />
      </item>
      <item type="reference">
        <reference id_state="71" xlink:type="simple" xlink:href="states#id(''71'')" />
      </item>
      <item type="reference">
        <reference id_state="72" xlink:type="simple" xlink:href="states#id(''72'')" />
      </item>
      <item type="reference">
        <reference id_state="73" xlink:type="simple" xlink:href="states#id(''73'')" />
      </item>
      <item type="reference">
        <reference id_state="74" xlink:type="simple" xlink:href="states#id(''74'')" />
      </item>
      <item type="reference">
        <reference id_state="75" xlink:type="simple" xlink:href="states#id(''75'')" />
      </item>
      <item type="reference">
        <reference id_state="76" xlink:type="simple" xlink:href="states#id(''76'')" />
      </item>
      <item type="reference">
        <reference id_state="77" xlink:type="simple" xlink:href="states#id(''77'')" />
      </item>
      <item type="reference">
        <reference id_state="78" xlink:type="simple" xlink:href="states#id(''78'')" />
      </item>
      <item type="reference">
        <reference id_state="79" xlink:type="simple" xlink:href="states#id(''79'')" />
      </item>
      <item type="reference">
        <reference id_state="80" xlink:type="simple" xlink:href="states#id(''80'')" />
      </item>
      <item type="reference">
        <reference id_state="81" xlink:type="simple" xlink:href="states#id(''81'')" />
      </item>
      <item type="reference">
        <reference id_state="82" xlink:type="simple" xlink:href="states#id(''82'')" />
      </item>
      <item type="reference">
        <reference id_state="83" xlink:type="simple" xlink:href="states#id(''83'')" />
      </item>
      <item type="reference">
        <reference id_state="84" xlink:type="simple" xlink:href="states#id(''84'')" />
      </item>
      <item type="reference">
        <reference id_state="85" xlink:type="simple" xlink:href="states#id(''85'')" />
      </item>
      <item type="reference">
        <reference id_state="86" xlink:type="simple" xlink:href="states#id(''86'')" />
      </item>
      <item type="reference">
        <reference id_state="87" xlink:type="simple" xlink:href="states#id(''87'')" />
      </item>
      <item type="reference">
        <reference id_state="88" xlink:type="simple" xlink:href="states#id(''88'')" />
      </item>
      <item type="reference">
        <reference id_state="89" xlink:type="simple" xlink:href="states#id(''89'')" />
      </item>
      <item type="reference">
        <reference id_state="90" xlink:type="simple" xlink:href="states#id(''90'')" />
      </item>
      <item type="reference">
        <reference id_state="91" xlink:type="simple" xlink:href="states#id(''91'')" />
      </item>
      <item type="reference">
        <reference id_state="92" xlink:type="simple" xlink:href="states#id(''92'')" />
      </item>
      <item type="reference">
        <reference id_state="93" xlink:type="simple" xlink:href="states#id(''93'')" />
      </item>
      <item type="reference">
        <reference id_state="94" xlink:type="simple" xlink:href="states#id(''94'')" />
      </item>
      <item type="reference">
        <reference id_state="95" xlink:type="simple" xlink:href="states#id(''95'')" />
      </item>
      <item type="reference">
        <reference id_state="96" xlink:type="simple" xlink:href="states#id(''96'')" />
      </item>
      <item type="reference">
        <reference id_state="97" xlink:type="simple" xlink:href="states#id(''97'')" />
      </item>
      <item type="reference">
        <reference id_state="98" xlink:type="simple" xlink:href="states#id(''98'')" />
      </item>
      <item type="reference">
        <reference id_state="99" xlink:type="simple" xlink:href="states#id(''99'')" />
      </item>
      <item type="reference">
        <reference id_state="100" xlink:type="simple" xlink:href="states#id(''100'')" />
      </item>
      <item type="reference">
        <reference id_state="101" xlink:type="simple" xlink:href="states#id(''101'')" />
      </item>
      <item type="reference">
        <reference id_state="102" xlink:type="simple" xlink:href="states#id(''102'')" />
      </item>
      <item type="reference">
        <reference id_state="103" xlink:type="simple" xlink:href="states#id(''103'')" />
      </item>
      <item type="reference">
        <reference id_state="104" xlink:type="simple" xlink:href="states#id(''104'')" />
      </item>
      <item type="reference">
        <reference id_state="105" xlink:type="simple" xlink:href="states#id(''105'')" />
      </item>
      <item type="reference">
        <reference id_state="106" xlink:type="simple" xlink:href="states#id(''106'')" />
      </item>
      <item type="reference">
        <reference id_state="107" xlink:type="simple" xlink:href="states#id(''107'')" />
      </item>
      <item type="reference">
        <reference id_state="108" xlink:type="simple" xlink:href="states#id(''108'')" />
      </item>
      <item type="reference">
        <reference id_state="109" xlink:type="simple" xlink:href="states#id(''109'')" />
      </item>
      <item type="reference">
        <reference id_state="110" xlink:type="simple" xlink:href="states#id(''110'')" />
      </item>
      <item type="reference">
        <reference id_state="111" xlink:type="simple" xlink:href="states#id(''111'')" />
      </item>
      <item type="reference">
        <reference id_state="112" xlink:type="simple" xlink:href="states#id(''112'')" />
      </item>
      <item type="reference">
        <reference id_state="113" xlink:type="simple" xlink:href="states#id(''113'')" />
      </item>
      <item type="reference">
        <reference id_state="114" xlink:type="simple" xlink:href="states#id(''114'')" />
      </item>
      <item type="reference">
        <reference id_state="115" xlink:type="simple" xlink:href="states#id(''115'')" />
      </item>
      <item type="reference">
        <reference id_state="116" xlink:type="simple" xlink:href="states#id(''116'')" />
      </item>
      <item type="reference">
        <reference id_state="117" xlink:type="simple" xlink:href="states#id(''117'')" />
      </item>
      <item type="reference">
        <reference id_state="118" xlink:type="simple" xlink:href="states#id(''118'')" />
      </item>
      <item type="reference">
        <reference id_state="119" xlink:type="simple" xlink:href="states#id(''119'')" />
      </item>
      <item type="reference">
        <reference id_state="120" xlink:type="simple" xlink:href="states#id(''120'')" />
      </item>
      <item type="reference">
        <reference id_state="121" xlink:type="simple" xlink:href="states#id(''121'')" />
      </item>
      <item type="reference">
        <reference id_state="122" xlink:type="simple" xlink:href="states#id(''122'')" />
      </item>
      <item type="reference">
        <reference id_state="123" xlink:type="simple" xlink:href="states#id(''123'')" />
      </item>
      <item type="reference">
        <reference id_state="124" xlink:type="simple" xlink:href="states#id(''124'')" />
      </item>
      <item type="reference">
        <reference id_state="125" xlink:type="simple" xlink:href="states#id(''125'')" />
      </item>
      <item type="reference">
        <reference id_state="126" xlink:type="simple" xlink:href="states#id(''126'')" />
      </item>
      <item type="reference">
        <reference id_state="127" xlink:type="simple" xlink:href="states#id(''127'')" />
      </item>
      <item type="reference">
        <reference id_state="128" xlink:type="simple" xlink:href="states#id(''128'')" />
      </item>
      <item type="reference">
        <reference id_state="129" xlink:type="simple" xlink:href="states#id(''129'')" />
      </item>
      <item type="reference">
        <reference id_state="130" xlink:type="simple" xlink:href="states#id(''130'')" />
      </item>
    </selectedColors>
    <shapeType type="integer">1</shapeType>
    <fieldTypes type="list">
      <item type="integer">8</item>
    </fieldTypes>
    <hasZSort type="boolean">false</hasZSort>
    <defaultSymbol type="reference">
        <reference id_state="23" xlink:type="simple" xlink:href="states#id(''23'')" />
    </defaultSymbol>
  </Persistence__VectorialUniqueValueLegend>
  <Persistence__PictureMarkerSymbol id="23">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="30" xlink:type="simple" xlink:href="states#id(''30'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="26" xlink:type="simple" xlink:href="states#id(''26'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Padrão</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="29" xlink:type="simple" xlink:href="states#id(''29'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__AwtColor id="24">
    <red type="integer">60</red>
    <blue type="integer">235</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtPoint2D id="25">
    <y type="double">0.0</y>
    <x type="double">0.0</x>
  </Persistence__AwtPoint2D>
  <Persistence__PictureMarkerSymbol id="26">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="28" xlink:type="simple" xlink:href="states#id(''28'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="26" xlink:type="simple" xlink:href="states#id(''26'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">barragem_default</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="27" xlink:type="simple" xlink:href="states#id(''27'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="27">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_default.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_default.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="28">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_default_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_default_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="29">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_default.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_default.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="30">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_default_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_default_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__AwtColor id="31">
    <red type="integer">12</red>
    <blue type="integer">12</blue>
    <green type="integer">122</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="32">
    <red type="integer">14</red>
    <blue type="integer">12</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="33">
    <red type="integer">17</red>
    <blue type="integer">13</blue>
    <green type="integer">126</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="34">
    <red type="integer">19</red>
    <blue type="integer">14</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="35">
    <red type="integer">22</red>
    <blue type="integer">14</blue>
    <green type="integer">131</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="36">
    <red type="integer">25</red>
    <blue type="integer">15</blue>
    <green type="integer">133</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="37">
    <red type="integer">28</red>
    <blue type="integer">16</blue>
    <green type="integer">135</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="38">
    <red type="integer">31</red>
    <blue type="integer">17</blue>
    <green type="integer">137</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="39">
    <red type="integer">34</red>
    <blue type="integer">17</blue>
    <green type="integer">140</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="40">
    <red type="integer">37</red>
    <blue type="integer">18</blue>
    <green type="integer">142</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="41">
    <red type="integer">40</red>
    <blue type="integer">19</blue>
    <green type="integer">144</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="42">
    <red type="integer">43</red>
    <blue type="integer">20</blue>
    <green type="integer">146</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="43">
    <red type="integer">46</red>
    <blue type="integer">20</blue>
    <green type="integer">148</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="44">
    <red type="integer">49</red>
    <blue type="integer">21</blue>
    <green type="integer">151</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="45">
    <red type="integer">53</red>
    <blue type="integer">22</blue>
    <green type="integer">153</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="46">
    <red type="integer">56</red>
    <blue type="integer">23</blue>
    <green type="integer">155</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="47">
    <red type="integer">59</red>
    <blue type="integer">24</blue>
    <green type="integer">157</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="48">
    <red type="integer">63</red>
    <blue type="integer">25</blue>
    <green type="integer">159</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="49">
    <red type="integer">66</red>
    <blue type="integer">25</blue>
    <green type="integer">162</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="50">
    <red type="integer">70</red>
    <blue type="integer">26</blue>
    <green type="integer">164</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="51">
    <red type="integer">74</red>
    <blue type="integer">27</blue>
    <green type="integer">166</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="52">
    <red type="integer">77</red>
    <blue type="integer">28</blue>
    <green type="integer">168</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="53">
    <red type="integer">81</red>
    <blue type="integer">29</blue>
    <green type="integer">171</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="54">
    <red type="integer">85</red>
    <blue type="integer">30</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="55">
    <red type="integer">89</red>
    <blue type="integer">31</blue>
    <green type="integer">175</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="56">
    <red type="integer">93</red>
    <blue type="integer">32</blue>
    <green type="integer">177</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="57">
    <red type="integer">96</red>
    <blue type="integer">33</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="58">
    <red type="integer">100</red>
    <blue type="integer">34</blue>
    <green type="integer">182</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="59">
    <red type="integer">104</red>
    <blue type="integer">35</blue>
    <green type="integer">184</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="60">
    <red type="integer">109</red>
    <blue type="integer">36</blue>
    <green type="integer">186</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="61">
    <red type="integer">113</red>
    <blue type="integer">37</blue>
    <green type="integer">188</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="62">
    <red type="integer">117</red>
    <blue type="integer">38</blue>
    <green type="integer">190</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="63">
    <red type="integer">121</red>
    <blue type="integer">39</blue>
    <green type="integer">193</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="64">
    <red type="integer">125</red>
    <blue type="integer">41</blue>
    <green type="integer">195</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="65">
    <red type="integer">130</red>
    <blue type="integer">42</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="66">
    <red type="integer">134</red>
    <blue type="integer">43</blue>
    <green type="integer">199</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="67">
    <red type="integer">138</red>
    <blue type="integer">44</blue>
    <green type="integer">201</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="68">
    <red type="integer">143</red>
    <blue type="integer">45</blue>
    <green type="integer">204</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="69">
    <red type="integer">147</red>
    <blue type="integer">46</blue>
    <green type="integer">206</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="70">
    <red type="integer">152</red>
    <blue type="integer">47</blue>
    <green type="integer">208</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="71">
    <red type="integer">156</red>
    <blue type="integer">49</blue>
    <green type="integer">210</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="72">
    <red type="integer">161</red>
    <blue type="integer">50</blue>
    <green type="integer">213</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="73">
    <red type="integer">166</red>
    <blue type="integer">51</blue>
    <green type="integer">215</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="74">
    <red type="integer">170</red>
    <blue type="integer">52</blue>
    <green type="integer">217</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="75">
    <red type="integer">175</red>
    <blue type="integer">54</blue>
    <green type="integer">219</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="76">
    <red type="integer">180</red>
    <blue type="integer">55</blue>
    <green type="integer">221</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="77">
    <red type="integer">185</red>
    <blue type="integer">56</blue>
    <green type="integer">224</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="78">
    <red type="integer">189</red>
    <blue type="integer">58</blue>
    <green type="integer">226</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="79">
    <red type="integer">194</red>
    <blue type="integer">59</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="80">
    <red type="integer">199</red>
    <blue type="integer">60</blue>
    <green type="integer">230</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="81">
    <red type="integer">204</red>
    <blue type="integer">62</blue>
    <green type="integer">232</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="82">
    <red type="integer">209</red>
    <blue type="integer">63</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="83">
    <red type="integer">214</red>
    <blue type="integer">64</blue>
    <green type="integer">237</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="84">
    <red type="integer">219</red>
    <blue type="integer">66</blue>
    <green type="integer">239</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="85">
    <red type="integer">224</red>
    <blue type="integer">67</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="86">
    <red type="integer">229</red>
    <blue type="integer">69</blue>
    <green type="integer">243</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="87">
    <red type="integer">234</red>
    <blue type="integer">70</blue>
    <green type="integer">246</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="88">
    <red type="integer">239</red>
    <blue type="integer">72</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="89">
    <red type="integer">244</red>
    <blue type="integer">73</blue>
    <green type="integer">250</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="90">
    <red type="integer">249</red>
    <blue type="integer">74</blue>
    <green type="integer">252</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="91">
    <red type="integer">255</red>
    <blue type="integer">76</blue>
    <green type="integer">255</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="92">
    <red type="integer">251</red>
    <blue type="integer">74</blue>
    <green type="integer">248</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="93">
    <red type="integer">247</red>
    <blue type="integer">72</blue>
    <green type="integer">241</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="94">
    <red type="integer">243</red>
    <blue type="integer">70</blue>
    <green type="integer">235</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="95">
    <red type="integer">240</red>
    <blue type="integer">68</blue>
    <green type="integer">228</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="96">
    <red type="integer">236</red>
    <blue type="integer">66</blue>
    <green type="integer">222</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="97">
    <red type="integer">232</red>
    <blue type="integer">64</blue>
    <green type="integer">216</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="98">
    <red type="integer">229</red>
    <blue type="integer">63</blue>
    <green type="integer">209</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="99">
    <red type="integer">225</red>
    <blue type="integer">61</blue>
    <green type="integer">203</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="100">
    <red type="integer">221</red>
    <blue type="integer">59</blue>
    <green type="integer">197</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="101">
    <red type="integer">218</red>
    <blue type="integer">57</blue>
    <green type="integer">191</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="102">
    <red type="integer">214</red>
    <blue type="integer">56</blue>
    <green type="integer">185</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="103">
    <red type="integer">210</red>
    <blue type="integer">54</blue>
    <green type="integer">179</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="104">
    <red type="integer">206</red>
    <blue type="integer">52</blue>
    <green type="integer">173</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="105">
    <red type="integer">203</red>
    <blue type="integer">51</blue>
    <green type="integer">167</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="106">
    <red type="integer">199</red>
    <blue type="integer">49</blue>
    <green type="integer">161</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="107">
    <red type="integer">195</red>
    <blue type="integer">47</blue>
    <green type="integer">156</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="108">
    <red type="integer">192</red>
    <blue type="integer">46</blue>
    <green type="integer">150</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="109">
    <red type="integer">188</red>
    <blue type="integer">44</blue>
    <green type="integer">145</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="110">
    <red type="integer">184</red>
    <blue type="integer">43</blue>
    <green type="integer">139</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="111">
    <red type="integer">181</red>
    <blue type="integer">41</blue>
    <green type="integer">134</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="112">
    <red type="integer">177</red>
    <blue type="integer">40</blue>
    <green type="integer">129</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="113">
    <red type="integer">173</red>
    <blue type="integer">38</blue>
    <green type="integer">124</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="114">
    <red type="integer">169</red>
    <blue type="integer">37</blue>
    <green type="integer">119</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="115">
    <red type="integer">166</red>
    <blue type="integer">35</blue>
    <green type="integer">114</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="116">
    <red type="integer">162</red>
    <blue type="integer">34</blue>
    <green type="integer">109</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="117">
    <red type="integer">158</red>
    <blue type="integer">33</blue>
    <green type="integer">104</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="118">
    <red type="integer">155</red>
    <blue type="integer">31</blue>
    <green type="integer">99</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="119">
    <red type="integer">151</red>
    <blue type="integer">30</blue>
    <green type="integer">95</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="120">
    <red type="integer">147</red>
    <blue type="integer">29</blue>
    <green type="integer">90</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="121">
    <red type="integer">144</red>
    <blue type="integer">28</blue>
    <green type="integer">86</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="122">
    <red type="integer">140</red>
    <blue type="integer">26</blue>
    <green type="integer">81</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="123">
    <red type="integer">136</red>
    <blue type="integer">25</blue>
    <green type="integer">77</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="124">
    <red type="integer">132</red>
    <blue type="integer">24</blue>
    <green type="integer">73</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="125">
    <red type="integer">129</red>
    <blue type="integer">23</blue>
    <green type="integer">69</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="126">
    <red type="integer">125</red>
    <blue type="integer">22</blue>
    <green type="integer">65</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="127">
    <red type="integer">121</red>
    <blue type="integer">21</blue>
    <green type="integer">61</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="128">
    <red type="integer">118</red>
    <blue type="integer">20</blue>
    <green type="integer">57</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="129">
    <red type="integer">114</red>
    <blue type="integer">19</blue>
    <green type="integer">54</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__AwtColor id="130">
    <red type="integer">110</red>
    <blue type="integer">18</blue>
    <green type="integer">50</green>
    <alpha type="integer">255</alpha>
  </Persistence__AwtColor>
  <Persistence__PictureMarkerSymbol id="131">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="136" xlink:type="simple" xlink:href="states#id(''136'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="132" xlink:type="simple" xlink:href="states#id(''132'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="135" xlink:type="simple" xlink:href="states#id(''135'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="132">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="134" xlink:type="simple" xlink:href="states#id(''134'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="132" xlink:type="simple" xlink:href="states#id(''132'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Dam</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="133" xlink:type="simple" xlink:href="states#id(''133'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="133">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="134">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="135">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="136">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="137">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="142" xlink:type="simple" xlink:href="states#id(''142'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="138" xlink:type="simple" xlink:href="states#id(''138'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Em carteira</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="141" xlink:type="simple" xlink:href="states#id(''141'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="138">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="140" xlink:type="simple" xlink:href="states#id(''140'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="138" xlink:type="simple" xlink:href="states#id(''138'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Em carteira</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="139" xlink:type="simple" xlink:href="states#id(''139'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="139">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Barragem_icono3.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Barragem_icono3.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="140">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="141">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Barragem_icono3.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Barragem_icono3.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="142">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__PictureMarkerSymbol id="143">
    <unit type="integer">-1</unit>
    <selected type="boolean">false</selected>
    <bgSelImage type="reference">
        <reference id_state="148" xlink:type="simple" xlink:href="states#id(''148'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="144" xlink:type="simple" xlink:href="states#id(''144'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Não operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="147" xlink:type="simple" xlink:href="states#id(''147'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__PictureMarkerSymbol id="144">
    <unit type="integer">-1</unit>
    <selected type="boolean">true</selected>
    <bgSelImage type="reference">
        <reference id_state="146" xlink:type="simple" xlink:href="states#id(''146'')" />
    </bgSelImage>
    <selectionSym type="reference">
        <reference id_state="144" xlink:type="simple" xlink:href="states#id(''144'')" />
    </selectionSym>
    <color type="reference">
        <reference id_state="24" xlink:type="simple" xlink:href="states#id(''24'')" />
    </color>
    <rotation type="double">0.0</rotation>
    <description type="string">Não operacional</description>
    <referenceSystem type="integer">0</referenceSystem>
    <mask type="null"></mask>
    <isShapeVisible type="boolean">true</isShapeVisible>
    <bgImage type="reference">
        <reference id_state="145" xlink:type="simple" xlink:href="states#id(''145'')" />
    </bgImage>
    <offset type="reference">
        <reference id_state="25" xlink:type="simple" xlink:href="states#id(''25'')" />
    </offset>
    <size type="double">18.0</size>
  </Persistence__PictureMarkerSymbol>
  <Persistence__ImageStyle id="145">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_icono2.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_icono2.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="146">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="147">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/barragem_icono2.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/barragem_icono2.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
  <Persistence__ImageStyle id="148">
    <source type="url">file:/home/fpuga/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Simbologia_SIXHIARA/Dam_sel.png</source>
    <sourceSymbolInLibrary type="string">Simbologia_SIXHIARA/Dam_sel.png</sourceSymbolInLibrary>
  </Persistence__ImageStyle>
</states>
</XMLPersitence>
'
WHERE nombre_capa = 'barragens';

COMMIT;
