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
  echo "INFO: Build Image status OK."
else
  echo 'ERROR: Verification failed. User requested strict checking.'
  echo 'ERORR: There seems to be a mismatch between versions of build images. You may override this behavior be editing buildspec.yml file.'
  echo 'ERROR: CODEBUILD_BUILD_IMAGE is not compatible with buildspec.yml specification.'
  echo "actual: $CODEBUILD_BUILD_IMAGE"
  echo "expected: $buildImage"
  echo 'Please update CODEBUILD_BUILD_IMAGE in the CodeBuild project to match the version declared in buildspec.yml'
  exit 1
fi
