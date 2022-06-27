#!/usr/bin/env bash

PROJECT_VERSION=$(gradle -q printVersion)
if [[ "$PROJECT_VERSION" == *-SNAPSHOT ]]
then
  gradle dockerPush
  /home/gradle/summary.sh
else
  echo "INFO: No git tag found for this commit."
  echo "INFO: You see this message because no snapshot repository was set up for this project."
  echo "INFO: Therefore, pushing snapshots is not possible at this moment."
  echo "INFO: This build will be stopped here."
  echo "INFO: to avoid this message, execute: ./bump.zsh locally."
fi
