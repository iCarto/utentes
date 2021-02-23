#!/bin/bash -i
# We use -i to read .bashrc and have commands like rmvirtualenv available

set -e

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
source "${this_dir}"/../server/variables.ini
cd "${this_dir}"/..

(cd back && python setup.py install && python setup.py develop && pip install -r requirements-dev.txt)
