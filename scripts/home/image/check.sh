#!/usr/bin/env bash

set +x
set -e
echo Verifying build image compatibility...

if [ -n "$CODEBUILD_BUILD_IMAGE" ]
then
  echo "CODEBUILD_BUILD_IMAGE (The CodeBuild build image identifier):"
  echo "$CODEBUILD_BUILD_IMAGE"
fi

if [[ "$buildImage" == "$CODEBUILD_BUILD_IMAGE" ]]
then
  echo "$buildImage"
  echo
  echo "INFO: Success. CodeBuild build image is compatible."
else
  echo 'ERROR: Verification failed.'
  echo 'ERROR: CODEBUILD_BUILD_IMAGE is not compatible with buildspec.yml specification.'
  echo 'please update CODEBUILD_BUILD_IMAGE in the CodeBuild project to match the version declared in buildspec.yml'
  exit 1
fi
