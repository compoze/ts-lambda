#!/usr/bin/env bash

set -eo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."
ENVIRONMENTS_DIR="${PROJECT_DIR}/environments"

createEnvironmentFile() {
    set -eo pipefail

    ENV=$1
    ENVIRONMENT_FILE="${ENVIRONMENTS_DIR}/$ENV.env"

    mkdir -p "${ENVIRONMENTS_DIR}" # create environments dir if it doesn't exists

    if test -f "$ENVIRONMENT_FILE"; then
        echo "$ENVIRONMENT_FILE exists."
    else 
        echo "creating $ENVIRONMENT_FILE"
        touch "${ENVIRONMENTS_DIR}/$ENV.env"
        echo "Environment=$ENV" >> "${ENVIRONMENTS_DIR}/$ENV.env"
    fi
    
}
