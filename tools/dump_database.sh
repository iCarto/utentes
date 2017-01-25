#!/bin/sh
TODAY=`date +%Y%m%d`

pg_dump -h localhost -U postgres -C -E UTF-8 -f arasul.${TODAY}.backup -Fc -O -x -Z 9 arasul
pg_dump -h localhost -U postgres -C -E UTF-8 -f sixhiara.${TODAY}.backup -Fc -O -x -Z 9 aranorte
