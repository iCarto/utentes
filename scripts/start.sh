#!/bin/bash
set -e

(
    cd back
    pserve development.ini --reload
)
