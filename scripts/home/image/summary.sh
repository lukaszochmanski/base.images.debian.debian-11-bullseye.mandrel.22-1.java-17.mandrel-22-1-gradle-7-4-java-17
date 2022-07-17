#!/usr/bin/env bash

set +x
set -e

echo "CODEBUILD_BUILD_NUMBER: $CODEBUILD_BUILD_NUMBER"

IMAGE_TAG=$(git describe --tags)
LATEST_TAG=$(git describe --abbrev=0 --tags)

if [[ "$IMAGE_TAG" == "$LATEST_TAG" ]];
then
  export DOCKER_REPOSITORY='releases'
else
  export DOCKER_REPOSITORY='snapshots'
fi

prefix="refs/tags/"
string_with_prefix=$(git describe --tags)
latest_tag=${string_with_prefix#"$prefix"}
groupId=$(gradle printGroup -q | tr '.' '/')
artifactId=$(gradle printRootProjectNameRaw -q)

echo "docker image was published into ${HOST}/${DOCKER_REPOSITORY}/${groupId}/${artifactId}:${latest_tag}"
