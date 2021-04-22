#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

ENV=$1

if [[ -z "${ENV}" ]]; then
    echo "no environment provided"
    exit 1
else
    echo "installing dependencies"
    npm ci 
    echo "building app"
    npm run build 
    echo "setting appropriate read permissions" # https://acloud.guru/forums/aws-lambda/discussion/-KSVv58PhKhA1c6a6EZ-/errormessage-eacces-permission-denied-open-vartaskcsvreadjs
    chmod -R 644
    echo "deploying $ENV"
    npm run deploy $ENV
fi

