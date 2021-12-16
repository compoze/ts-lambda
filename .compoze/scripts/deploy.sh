#!/usr/bin/env bash

set -eo pipefail

## declare functions
. .compoze/scripts/get_environment_vars.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/../.."

APP_NAME=$1
REGION=$2
DEPLOYMENT_BUCKET=$3
ENV=$4

npm ci
npm run build

echo "setting appropriate read permissions" # https://acloud.guru/forums/aws-lambda/discussion/-KSVv58PhKhA1c6a6EZ-/errormessage-eacces-permission-denied-open-vartaskcsvreadjs
chmod -R 744 deploy

get_environment_vars $ENV

echo $environments
sam deploy --stack-name ${APP_NAME}-${ENV} \
--template "${PROJECT_DIR}/template.yaml" \
--s3-bucket "${DEPLOYMENT_BUCKET}" \
--capabilities CAPABILITY_IAM \
--no-fail-on-empty-changeset \
--region ${REGION} \
--parameter-overrides "$environments"
