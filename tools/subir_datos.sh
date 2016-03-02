-- usage subir_datos.sql PATH_AL_SHP

shp2pgsql -d -s 32737 -W "cp1250" $1 public.entrada  | psql -h localhost -U postgres -d sixhiara
psql -h localhost -U postgres -d sixhiara -f subir_datos.sql
psql -h localhost -U postgres -d sixhiara -c "DROP TABLE public.entrada;"
