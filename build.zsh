#!/usr/bin/env zsh

#login
cd $AWS/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4
HOST=964010022385.dkr.ecr.eu-central-1.amazonaws.com
GROUP_ID=base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17
ARTIFACT_ID=graalvm-17-gradle-7-4
IMAGE_TAG=1.0.0
cat README.md.tpl | sed s,"###CI_COMMIT_TAG###","$IMAGE_TAG", > README.md.tpl2
TODAY=`date`
cat README.md.tpl2 | sed s,"###TIMESTAMP###","$TODAY", > README.md
rm README.md.tpl2

if [[ "$IMAGE_TAG" == *-SNAPSHOT ]]
then
  echo "no tag"
else
  git add . && git commit -m 'WEB-2646: Create a CodeBuild pipeline for GraalVM base image'
  git tag -a $IMAGE_TAG -m 'WEB-2646: Create a CodeBuild pipeline for GraalVM base image'
  git push --follow-tags
fi

docker build -t "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG .
docker run --rm -ti --privileged --entrypoint /bin/bash "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG
docker image rm "$HOST"/"$GROUP_ID"/"$ARTIFACT_ID":$IMAGE_TAG
echo "https://eu-central-1.console.aws.amazon.com/codesuite/codebuild/964010022385/projects/base-images-debian-debian-11-bullseye-gradle-gradle-7-4-graalvm-ce-17-graalvm-17-gradle-7-4/details?region=eu-central-1"
echo
echo "docker pull $HOST/$GROUP_ID/$ARTIFACT_ID:$IMAGE_TAG"
