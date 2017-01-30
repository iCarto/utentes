#!/bin/bash

psql -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname IN ('aranorte', 'arasul');"
dropdb -h localhost -U postgres arasul
dropdb -h localhost -U postgres aranorte
dropuser -h localhost -U postgres utentes
dropuser -h localhost -U postgres sixhiara_owner
dropuser -h localhost -U postgres elle_read
dropuser -h localhost -U postgres elle_write
dropuser -h localhost -U postgres cbase_read
dropuser -h localhost -U postgres cbase_write
dropuser -h localhost -U postgres inventario_read
dropuser -h localhost -U postgres inventario_write
dropuser -h localhost -U postgres inventario
createdb -h localhost -U postgres -T template0 -E UTF8 aranorte
cd ..
sqitch deploy
cd scripts
createdb -h localhost -U postgres -T aranorte arasul
