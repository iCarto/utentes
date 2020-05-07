#!/bin/bash

VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
source /usr/local/bin/virtualenvwrapper.sh

workon utentes
pip install mod_wsgi
