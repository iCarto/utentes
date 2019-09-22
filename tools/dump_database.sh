#!/bin/bash

set -e

TODAY=$(date '+%y%m%d')

pg_dump -h localhost -U postgres -Fc -Z 9 -E UTF-8 -f arasul.${TODAY}.dump arasul
pg_dump -h localhost -U postgres -Fc -Z 9 -E UTF-8 -f sixhiara.${TODAY}.dump aranorte
