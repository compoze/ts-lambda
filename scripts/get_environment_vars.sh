#!/usr/bin/env bash

set -eo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."
ENVIRONMENTS_DIR="${PROJECT_DIR}/environments"

get_environment_vars() {
    ENV=$1
    echo "getting environments for $ENV"
    environments=""
    while read p; do
        environments+="$p "
    done <"${ENVIRONMENTS_DIR}/${ENV}.env"

}
