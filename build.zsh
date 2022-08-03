#!/usr/bin/env zsh

#login
cd $AWS/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17 || exit
HOST=964010022385.dkr.ecr.eu-central-1.amazonaws.com
GROUP_ID=$(gradle rootProjectGroupRaw -q | tr '.' '/')
ARTIFACT_ID=$(gradle rootProjectNameRaw -q)
IMAGE_TAG=$(gradle rootProjectVersionRaw -q)

docker build -t "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-slim . --squash
docker run --rm -ti --privileged --entrypoint /bin/bash "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-slim
docker image rm "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-slim
echo

if [[ "$IMAGE_TAG" == *-SNAPSHOT ]]
then
  export DOCKER_REPOSITORY='snapshots/'
else
  export DOCKER_REPOSITORY=''
fi

echo "docker build -t $HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG ."
echo "docker push $HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG"
