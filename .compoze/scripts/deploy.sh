#!/usr/bin/env bash

set -eo pipefail

## declare functions
. .compoze/scripts/get_environment_vars.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/../.."

APP_NAME=$1
ENV=$2

npm ci
npm run build

echo "setting appropriate read permissions" # https://acloud.guru/forums/aws-lambda/discussion/-KSVv58PhKhA1c6a6EZ-/errormessage-eacces-permission-denied-open-vartaskcsvreadjs
chmod -R 744 deploy

get_environment_vars $ENV

echo $environments 
sam deploy --stack-name ${APP_NAME}-${ENV} \
    --template "${PROJECT_DIR}/template.yaml" \
    --s3-bucket <compoze-deploy-bucket> \
    --capabilities CAPABILITY_IAM \
    --no-fail-on-empty-changeset \
    --region us-east-1 \
    --parameter-overrides "$environments"
