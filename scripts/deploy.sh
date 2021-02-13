#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

APP_NAME=$1
ENV=$2

sam deploy --stack-name ${APP_NAME}-${ENV} \
    --template "${PROJECT_DIR}/template.yaml" \
    --s3-bucket <compoze-deploy-bucket> \
    --capabilities CAPABILITY_IAM \
    --no-fail-on-empty-changeset \
    --region us-east-1
