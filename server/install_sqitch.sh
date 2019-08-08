#!/bin/bash

apt-get install -y cpanminus libdbd-pg-perl
cpanm --quiet --notest App::Sqitch

# La primera vez que se lanza parece fallar, y al repetir hacerlo bien
cpanm --quiet --notest App::Sqitch

# No necesario en producción. Se usa para hacer templates más sencillos
# https://justatheory.com/2013/09/sqitch-templating/#upgraded-templates
cpanm Template
