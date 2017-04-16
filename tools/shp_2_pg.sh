#!/bin/bash

# Norte $1 = PATH_TO/160414_SIG_SIXHIARA/

# Sul. $1 = 1701_BDD_ARA_Sul

ORG_FOLDER=/mnt/Proyectos/2016_Proyectos/1605_SIXHIARA_IV/05_PROCESO/05_01_SHP_RASTER/02_BDD_ARA_Sul/1701_BDD_ARA_Sul/
DEST_FOLDER=${1}
SHAPE_FOLDER="${1}/03_Capas/"
DBF_FOLDER="${1}/02_Tablas_embebida/"

rsync -azvP --delete --exclude="00_Proceso" fpuga@gallactica:${ORG_FOLDER} ${DEST_FOLDER}

if [ ! -d $SHAPE_FOLDER ] ; then
    echo "El directorio $SHAPE_FOLDER debe existir"
    exit
fi

if [ ! -d $DBF_FOLDER ] ; then
    echo "El directorio $DBF_FOLDER debe existir"
    exit
fi

ARA=$2
if [ -z "$ARA" ]; then
    echo "Indique a que ARA pertenecen los datos Sul/Norte"
    exit
fi


TODAY=`date +%Y%m%d`
CBASE=./cbase.sql.$TODAY.${ARA}
ACUIFEROS=./acuiferos.sql.$TODAY.${ARA}
FONTES=./fontes.sql.$TODAY.${ARA}
BARRAGENS=./barragens.sql.$TODAY.${ARA}
ESTACOES=./estacoes.sql.$TODAY.${ARA}

echo 'BEGIN;' > $CBASE
echo 'BEGIN;' > $ACUIFEROS
echo 'BEGIN;' > $FONTES
echo 'BEGIN;' > $BARRAGENS
echo 'BEGIN;' > $ESTACOES

ALL_TABLES=()

for shp in `find $SHAPE_FOLDER -iname '*.shp'` ; do

    TABLE=`basename ${shp%.shp} | tr '[:upper:]' '[:lower:]'`
    SCHEMA_BASE=cbase
    OUTPUT=$CBASE


    if [[ ${TABLE} == 'acuiferos' ]] ; then
	SCHEMA_BASE=inventario
	OUTPUT=$ACUIFEROS
    fi

    if [[ ${TABLE} == 'fontes' ]] ; then
	SCHEMA_BASE=inventario
	OUTPUT=$FONTES
	echo "ALTER TABLE inventario.fontes add column aaa text;" >> $OUTPUT
    fi

    if [[ ${TABLE} == 'barragem' ]] ; then
	TABLE=barragens
	SCHEMA_BASE=inventario
	OUTPUT=$BARRAGENS
    fi

    if [[ ${TABLE} == 'estacoes' ]] ; then
	SCHEMA_BASE=inventario
	OUTPUT=$ESTACOES
    fi

    if [[ ${TABLE} == 'zimbabwe' ]] || [[ ${TABLE} == 'zambia' ]] || [[ ${TABLE} == 'swaziland' ]] || [[ ${TABLE} == 'south_africa' ]] || [[ ${TABLE} == 'rdcongo' ]] || [[ ${TABLE} == 'namibia' ]] || [[ ${TABLE} == 'madagascar' ]] || [[ ${TABLE} == 'lesotho' ]] || [[ ${TABLE} == 'congo' ]] || [[ ${TABLE} == 'botswana' ]] || [[ ${TABLE} == 'angola' ]] || [[ ${TABLE} == 'reserva_do_niassa' ]] || [[ ${TABLE} == 'biodiversidad_region' ]] || [[ ${TABLE} == 'piezo_v0' ]] || [[ ${TABLE} == 'estacoes_hidrometricas' ]] || [[ ${TABLE} == 'estaçoes_hidrometricas' ]] || [[ ${TABLE} == 'estacoes_pluviometricas' ]] || [[ ${TABLE} == 'estaçoes_pluviometricas' ]] || [[ ${TABLE} == 'cotas' ]] || [[ ${TABLE} == 'direcao_fluxo' ]] || [[ ${TABLE} == 'dir_fluxo' ]] ; then
	continue
    fi
    if [[ ${TABLE} == 'reserva_zona_tampão' ]]; then
	TABLE='reserva_zona_tampao'
    fi

    if [[ ${TABLE} == 'estaçoes_evaporacion' ]]; then
	TABLE='estacoes_evaporacion'
    fi

    if [[ ${TABLE} == 'areas_exploraçao_mineira' ]]; then
	TABLE='areas_exploracao_mineira'
    fi

    if [[ ${TABLE} == 'areas_exploraçao_petroleo_gas' ]]; then
	TABLE='areas_exploracao_petroleo_gas'
    fi

    ALL_TABLES+=(${TABLE})

    # debug
    # if [[ $OUTPUT == $CBASE ]] ; then
    # 	continue
    # fi

    shp2pgsql -s 32737 -g geom -a -W ISO8859-1 $shp ${SCHEMA_BASE}.${TABLE} \
    | sed 's/BEGIN;//' \
    | sed 's/COMMIT;//' \
    | sed 's/^SET.*//' >> $OUTPUT

    if [[ ${TABLE} == 'fontes' ]] ; then
	echo "ALTER TABLE inventario.fontes drop column aaa;" >> $OUTPUT
    fi

done

echo 'COMMIT;' >> $CBASE
echo 'COMMIT;' >> $ACUIFEROS
echo 'COMMIT;' >> $FONTES
echo 'COMMIT;' >> $BARRAGENS
echo 'COMMIT;' >> $ESTACOES

# bug #1180
echo 'UPDATE inventario.fontes SET estado_fon = estado;' >> $FONTES
echo 'UPDATE inventario.fontes SET estado = NULL;' >> $FONTES

ALL_TABLES+=("exploracaos")
IFS=$'\n' ALL_TABLES=($(sort -r <<<"${ALL_TABLES[*]}"))
unset IFS

# TODO. Preservar nombres originales como nombre de capa. Espacios, mayúsculas, ...

MAP="./_map.sql.${TODAY}"
echo "BEGIN;" > $MAP
total=${#ALL_TABLES[*]}
#
for (( i=0; i<=$(( $total -1 )); i++ ))
do
    LAYERNAME=${ALL_TABLES[$i]}
    TABLENAME=${ALL_TABLES[$i]}
    SCHEMA='cbase'
    if [[ ${LAYERNAME} == 'acuiferos' ]] || [[ ${LAYERNAME} == 'fontes' ]] || [[ ${LAYERNAME} == 'barragens' ]] ||[[ ${LAYERNAME} == 'estacoes' ]] ||[[ ${LAYERNAME} == 'exploracaos' ]]; then
	SCHEMA='inventario'
    fi
    echo "INSERT INTO elle._map (mapa, nombre_capa, nombre_tabla, posicion, visible, max_escala, min_escala, grupo, schema, localizador) VALUES ('TODAS', '${LAYERNAME}', '${TABLENAME}', $i, true, NULL, NULL, NULL, '$SCHEMA', NULL);" >> $MAP
done

echo "INSERT INTO elle._map_style (nombre_capa, nombre_estilo, type, definicion, label) SELECT nombre_capa, 'TODAS', type, definicion, label FROM elle._map_style WHERE nombre_estilo='SIXHIARA';" >> $MAP
echo "COMMIT;" >> $MAP

OUTPUT=./inventario_alfanumerico.sql.$TODAY.${ARA}

echo 'BEGIN;' > $OUTPUT
for shp in `find $DBF_FOLDER -iname '*.dbf'` ; do
    TABLE=`basename ${shp%.dbf}`
    SCHEMA=inventario
    APPEND=" -a "
    if [[ ${TABLE} == 'quantidade_agua' ]] ; then
	TABLE=quantidade_agua2
	SCHEMA=public
	APPEND=" -c "
    fi
    if [[ ${TABLE} == 'analise' ]] ; then
	TABLE=analise2
	SCHEMA=public
	APPEND=" -c "
    fi

    shp2pgsql $APPEND -n -W ISO8859-1 $shp ${SCHEMA}.${TABLE} \
    | sed 's/BEGIN;//' \
    | sed 's/COMMIT;//' \
    | sed 's/^SET.*//' >> $OUTPUT
done

echo "INSERT INTO inventario.quantidade_agua (cod_fonte, data, hora, quan_agua, q_extraer) SELECT cod_fonte, to_date(data, 'DD/MM/YYYY'), hora, replace(quan_agua, ',', '.')::numeric, NULL FROM public.quantidade_agua2;" >>  $OUTPUT
echo "UPDATE inventario.quantidade_agua SET data=data + interval '2000 year' where data < date '2000-01-01';" >> $OUTPUT
echo "DROP TABLE public.quantidade_agua2;" >> $OUTPUT


echo "INSERT INTO inventario.analise (cod_fonte, fonte, data_most, hora_most, c_tempera, c_conduct, c_cor, c_cheiro, c_ph, c_nitrat, c_nitrit, par_rango, cond_most, com_most, laborator, data_anal, temperat, cor, turbidez, conductiv, ph, alcalin_f, alcalinid, carbonato, bicarbona, hidroxido, dureza, oxigeno_d, dbo, dqo, mo, sol_suspe, sol_disol, sol_total, nitratos, nitritos, coli_feca, coli_tot, e_coli,
bac_het_t, cl_resid, cloruros, fosfatos, ca, mg, amonio, arsenico, k, na, si, fe, mn, al, b, cd, co, cr3, cr6, cu, hg, ni, pb, zn, comen_lab)
SELECT cod_fonte, fonte,
to_date(data_most, 'DD/MM/YYYY'),
hora_most,
replace(c_tempera, ',','.')::numeric,
replace(c_conduct, ',','.')::numeric,
NULL,
c_cheiro,
replace(c_ph, ',','.')::numeric,
c_nitrat,
c_nitrit,
par_rango::boolean,
cond_most,
com_most,
laborator,
to_date(data_anal, 'DD/MM/YYYY'),
replace(temperat, ',','.')::numeric,
cor,
replace(turbidez, ',','.')::numeric,
replace(conductiv, ',','.')::numeric,
replace(ph, ',','.')::numeric,
replace(alcalin_f, ',','.')::numeric,
replace(alcalinid, ',','.')::numeric,
replace(carbonato, ',','.')::numeric,
replace(bicarbona, ',','.')::numeric,
replace(hidroxido, ',','.')::numeric,
replace(dureza, ',','.')::numeric,
replace(oxigeno_d, ',','.')::numeric,
replace(dbo, ',','.')::numeric,
replace(dqo, ',','.')::numeric,
replace(mo, ',','.')::numeric,
replace(sol_suspe, ',','.')::numeric,
replace(sol_disol, ',','.')::numeric,
replace(sol_total, ',','.')::numeric,
replace(nitratos, ',','.')::numeric,
replace(nitritos, ',','.')::numeric,
replace(coli_feca, ',','.')::numeric,
replace(coli_tot, ',','.')::numeric,
replace(e_coli, ',','.')::numeric,
replace(bac_het_t, ',','.')::numeric,
replace(cl_resid, ',','.')::numeric,
replace(cloruros, ',','.')::numeric,
replace(fosfatos, ',','.')::numeric,
replace(ca, ',','.')::numeric,
replace(mg, ',','.')::numeric,
replace(amonio, ',','.')::numeric,
replace(arsenico, ',','.')::numeric,
replace(k, ',','.')::numeric,
replace(na, ',','.')::numeric,
replace(si, ',','.')::numeric,
replace(fe, ',','.')::numeric,
replace(mn, ',','.')::numeric,
replace(al, ',','.')::numeric,
replace(b, ',','.')::numeric,
replace(cd, ',','.')::numeric,
replace(co, ',','.')::numeric,
replace(cr3, ',','.')::numeric,
replace(cr6, ',','.')::numeric,
replace(cu, ',','.')::numeric,
replace(hg, ',','.')::numeric,
replace(ni, ',','.')::numeric,
replace(pb, ',','.')::numeric,
replace(zn, ',','.')::numeric,
comen_lab FROM public.analise2;" >>  $OUTPUT

echo "UPDATE inventario.analise SET data_most=data_most + interval '2000 year' where data_most < date '2000-01-01';" >> $OUTPUT
echo "UPDATE inventario.analise SET data_anal=data_anal + interval '2000 year' where data_anal < date '2000-01-01';" >> $OUTPUT

echo "DROP TABLE public.analise2;" >> $OUTPUT

echo 'COMMIT;' >> $OUTPUT

# bug #1184
mv $OUTPUT $OUTPUT.BORRAR
grep -v 'MU-31' $OUTPUT.BORRAR > $OUTPUT
