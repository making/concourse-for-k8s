#!/usr/bin/env bash
set -eu

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo "Generating concourse resource definitions..."

helm template concourse --namespace=concourse "${SCRIPT_DIR}/concourse" \
        --values="${SCRIPT_DIR}/default-values.yml" |
  ytt --ignore-unknown-comments -f - |
  kbld -f - \
  > "${SCRIPT_DIR}/../../config/_ytt_lib/concourse/rendered.yml"
#  > "${SCRIPT_DIR}/../../demo.yml"
