#!/usr/bin/env zsh

# Mon Jun 27 11:20:32 CEST 2022
# This script has to be executed before each new release/tag bump, for two reasons:
# 1. Updating README.md is not possible in CodeBuild pipeline, at the moment.
#    The point of README.md file is to include the docker image coordinates with the latest version of the image.
#    Therefore, the README.md with the new git tag must be committed and pushed into the git repository.
#    Currently our CI pipeline doesn't push anything into the git repository, because it would trigger another
#    build, recursively. It would become an infinite loop of CI pipelines, and create a series of problems.
#    This can be done in the future, but it requires a lot of effort.
#    Therefore, it is not done, and you need to invoke this script manually, on your local machine, in order to
#    push the latest tag into the git repository with your personal credentials (name, email, date).
# 2. reason number two is, that the python semver tool is not installed in the base image, which runs this build
#    and this script would not work. It only works locally on your machine. Again, it can be done in the future,
#    but it requires some effort.

#login
cd $AWS/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4 || exit
tagMessage='./gradle/docker-push.sh'
export tagMessage

git add . && git commit -m $tagMessage


PROJECT_VERSION=$(gradle -q printVersion)
if [[ "$PROJECT_VERSION" == *-SNAPSHOT ]]
then
  IMAGE_TAG=${PROJECT_VERSION:0:-9}
else
  IMAGE_TAG=$PROJECT_VERSION
fi

cat README.md.tpl | sed s,"###CI_COMMIT_TAG###","$IMAGE_TAG", > README.md.tpl2
TODAY=`date`
cat README.md.tpl2 | sed s,"###TIMESTAMP###","$TODAY", > README.md
rm README.md.tpl2
git add . && git commit -m "Update README.md to version: $IMAGE_TAG"

nextPatch=$(git semver --next-patch)
git tag -a "$nextPatch" -m "$tagMessage"
git push --follow-tags
git tags
gradle printVersion
