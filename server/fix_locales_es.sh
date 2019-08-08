#!/bin/bash

# Instala los paquetes de idioma en castellano

if locale -a | grep es_ES > /dev/null; then
    exit 0
fi

apt-get install -y language-pack-es language-pack-es-base
apt-get remove -y --purge firefox-locale-es
