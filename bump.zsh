#!/usr/bin/env zsh

#login
cd $AWS/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4 || exit
tagMessage='graalvm-11-gradle-7-4:1.1.15'
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

