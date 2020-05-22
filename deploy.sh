#!/bin/bash
set -euo pipefail

kapp deploy -a concourse --diff-changes \
  -f <(ytt --ignore-unknown-comments \
    -f config \
    -f overlays/concourse-web-external-url.yml \
    -f overlays/concourse-web-lb.yml \
    -f overlays/concourse-web-tls.yml \
    -f overlays/concourse-web-tls-secret.yml \
    -f overlays/concourse-web-tls-service.yml \
    -f overlays/concourse-local-user.yml \
    -f overlays/concourse-external-vault-approle.yml \
    -f values.yml \
    $@)