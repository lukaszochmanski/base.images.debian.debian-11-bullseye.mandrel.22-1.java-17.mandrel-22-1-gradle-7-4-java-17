#!/usr/bin/env sh

set +x
set -e
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $HOST
