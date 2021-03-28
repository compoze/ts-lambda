#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

ENV=$1

echo "installing dependencies"
npm ci 
echo "building app"
npm run build 
echo "deploying $ENV"
npm run deploy $ENV