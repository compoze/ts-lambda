#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

APP_NAME=$1
ENV=$2

if [[ -z "${ENV}" ]]; then
    echo "no environment provided"
    exit 1
else
    echo "initializing app $APP_NAME $ENV"
    npm run deploy $APP_NAME $ENV
fi

