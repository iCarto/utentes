#!/bin/bash

set -e

TODAY=`date +%y%m%d`

pg_dump -h localhost -U postgres -Fc -Z 9 -E UTF-8 -f arasul.${TODAY}.backup  -O -x arasul
pg_dump -h localhost -U postgres -Fc -Z 9 -E UTF-8 -f sixhiara.${TODAY}.backup -O -x aranorte
