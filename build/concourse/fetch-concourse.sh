#!/bin/bash
set -ex
rm -rf concourse
helm fetch \
    --repo https://concourse-charts.storage.googleapis.com \
    --untar concourse \
    --version 10.2.0
rm -rf concourse-*.tgz