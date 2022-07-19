#!/usr/bin/env zsh

#login
cd $AWS/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4 || exit
HOST=964010022385.dkr.ecr.eu-central-1.amazonaws.com
GROUP_ID=$(gradle rootProjectGroupRaw -q | tr '.' '/')
ARTIFACT_ID=$(gradle rootProjectNameRaw -q)
IMAGE_TAG=$(gradle rootProjectVersionRaw -q)

docker build -t "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-test .
docker run --rm -ti --privileged --entrypoint /bin/bash "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-test
docker image rm "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-test
echo

if [[ "$IMAGE_TAG" == *-SNAPSHOT ]]
then
  export DOCKER_REPOSITORY='snapshots/'
else
  export DOCKER_REPOSITORY=''
fi

echo "docker build -t $HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG ."
echo "docker push $HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG"
