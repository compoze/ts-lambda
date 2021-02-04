#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."
ROOT_DIR="$PROJECT_DIR/.."

APP_NAME=$1

sam deploy --stack-name ${APP_NAME} \
    --template "${ROOT_DIR}/template.yaml" \
    --s3-bucket <compoze-deploy-bucket> \
    --capabilities CAPABILITY_IAM \
    --no-fail-on-empty-changeset \
    --region us-east-1
