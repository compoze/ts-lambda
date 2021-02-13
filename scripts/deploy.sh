#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

APP_NAME=$1

sam deploy --stack-name ${APP_NAME} \
    --template "${PROJECT_DIR}/template.yaml" \
    --s3-bucket compozeproduct1-compname-deploymentbucket \
    --capabilities CAPABILITY_IAM \
    --no-fail-on-empty-changeset \
    --region us-east-1
