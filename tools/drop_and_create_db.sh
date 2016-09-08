#!/bin/bash

dropdb -h localhost -U postgres sixhiara
dropdb -h localhost -U postgres arasul
dropuser -h localhost -U postgres utentes
dropuser -h localhost -U postgres sixhiara_owner
dropuser -h localhost -U postgres elle_read
dropuser -h localhost -U postgres elle_write
dropuser -h localhost -U postgres cbase_read
dropuser -h localhost -U postgres cbase_write
dropuser -h localhost -U postgres inventario_read
dropuser -h localhost -U postgres inventario_write
dropuser -h localhost -U postgres inventario
createdb -h localhost -U postgres -T template1 sixhiara
createdb -h localhost -U postgres -T template1 arasul
