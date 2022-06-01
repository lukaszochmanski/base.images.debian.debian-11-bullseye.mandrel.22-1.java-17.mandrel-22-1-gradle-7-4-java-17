#!/usr/bin/env zsh

#login
cd $AWS/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4 || exit
HOST=964010022385.dkr.ecr.eu-central-1.amazonaws.com
GROUP_ID=$(gradle -q printGroup)
ARTIFACT_ID=$(gradle -q printRootProjectNameRaw)
IMAGE_TAG=$(gradle -q printVersion)

docker build -t "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-test .
docker run --rm -ti --privileged --entrypoint /bin/bash "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-test
docker image rm "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG-test
echo "https://eu-central-1.console.aws.amazon.com/codesuite/codebuild/964010022385/projects/base-images-debian-debian-11-bullseye-gradle-gradle-7-4-graalvm-ce-17-graalvm-17-gradle-7-4/details?region=eu-central-1"
echo

if [[ "$IMAGE_TAG" == "$LATEST_TAG" ]];
then
  export DOCKER_REPOSITORY=''
else
  export DOCKER_REPOSITORY='snapshots/'
fi

echo "docker build -t $HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG ."
echo "docker push $HOST/$DOCKER_REPOSITORY$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG"
