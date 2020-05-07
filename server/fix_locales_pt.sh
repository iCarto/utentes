#!/bin/bash

# Instala los paquetes de idioma en portugués

if locale -a | grep pt_PT > /dev/null; then
    exit 0
fi

apt-get install -y language-pack-pt language-pack-pt-base
apt-get remove -y --purge firefox-locale-pt
