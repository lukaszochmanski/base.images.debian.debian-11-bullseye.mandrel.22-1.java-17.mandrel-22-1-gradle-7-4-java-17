#!/usr/bin/env bash

set +x
set -e
echo Buiding image...

PROJECT_VERSION=$(gradle rootProjectVersionRaw -q)
if [[ "$PROJECT_VERSION" == *-SNAPSHOT ]]
then
    echo "INFO: No git tag found for this commit."
    echo "INFO: You see this message because no snapshot repository was set up for this project."
    echo "INFO: Therefore, pushing snapshots is not possible at this moment."
    echo "INFO: This build will be stopped here."
    echo "INFO: to avoid this message, execute: git bump locally."
else
  gradle dockerPush
  echo
  docker push 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4:latest
  echo
  /home/gradle/summary.sh
  echo
  docker images
fi
