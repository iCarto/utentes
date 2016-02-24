shp2pgsql -d -s 32737 -W "cp1250" 160224_UtentesPRUEBA.shp public.entrada  | psql -h localhost -U postgres -d sixhiara
psql -h localhost -U postgres -d sixhiara -f subir_datos.sql
