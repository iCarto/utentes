#!/bin/bash

# Al hacerlo con docker hay que montar el directorio donde se quieran dejar los informes.

if [[ -z "${1}" ]]; then
    echo "Introduzca el directorio para el reporte"
    exit 1
fi

REPORT_FOLDER="${1}/cloc"
mkdir -p "${REPORT_FOLDER}"

current_tag=$(git tag --sort=-committerdate | head -1)
last_tag=$(git tag --sort=-committerdate | head -2 | tail -1)

# --by-file: show results per file, without the default summary
# --by-file-by-lang: show results per file, with the default summary
# --report-file=<file>
# --csv
# --json
# --md
# --diff: shows the difference between to sets
# --count-and-diff: shows the difference between two sets, and also per set info
docker run --rm -v "${PWD}":/tmp aldanial/cloc:1.94 --quiet --hide-rate --exclude-dir=vendor --git --by-file-by-lang "${current_tag}" > "${REPORT_FOLDER}/cloc_by_file.txt"

docker run --rm -v "${PWD}":/tmp aldanial/cloc:1.94 --quiet --hide-rate --exclude-dir=vendor --git --diff "${last_tag}" "${current_tag}" > "${REPORT_FOLDER}/cloc_diff.txt"

docker run --rm -v "${PWD}":/tmp aldanial/cloc:1.94 --quiet --hide-rate --exclude-dir=vendor --git --by-file --diff "${last_tag}" "${current_tag}" >> "${REPORT_FOLDER}/cloc_diff.txt"

# Creates a database with results
# docker run --rm -v $PWD:/tmp aldanial/cloc --quiet --hide-rate --exclude-dir=vendor --git --sql 1 "${current_tag}" | sqlite3 /tmp/counts.db
# echo "select * from t" | sqlite3 -header counts.db

# Get 3 bigger files per language. Probably they should be refactorized
# Get the three files per language with more changes between two commits. Probably the file is doing to much
# The results can be obtained with the sql feature, sorting and grepping in the command line, or with jq. Running different analysis only over specific extensiones and son on.
# https://boyter.org/posts/why-count-lines-of-code/
# https://boyter.org/posts/sloc-cloc-code/
# https://boyter.org/posts/an-informal-survey-of-10-million-github-bitbucket-gitlab-projects/
