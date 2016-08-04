# usage subir_datos.sql PATH_AL_SHP
DATABASE=sixhiara

shp2pgsql -d -s 32737 -W "cp1250" $1 public.entrada  | psql -h localhost -U postgres -d $DATABASE
psql -h localhost -U postgres -d $DATABASE -f subir_datos.sql
psql -h localhost -U postgres -d $DATABASE -c "DROP TABLE public.entrada;"
