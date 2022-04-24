FROM 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-11/graalvm-11-gradle-7-4:1.0.4

ARG AWS_DEFAULT_REGION="eu-central-1"
ARG AWS_ACCOUNT_ID=964010022385
ARG HOST="964010022385.dkr.ecr.eu-central-1.amazonaws.com"
ARG DOCKER_REPOSITORY="releases"
ARG ECR_URL="https://eu-central-1.console.aws.amazon.com/ecr/repositories"
ARG IMAGE_SOURCE="https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4"
ARG JAVA_VERSION="22.0.0.2.r17-grl"
ARG JAVA_HOME="/root/.sdkman/candidates/java/current"
ARG GRAALVM_HOME="/root/.sdkman/candidates/java/current"
ARG GRADLE_HOME="/opt/gradle"
ARG GRADLE_VERSION="7.4"
ARG CI_COMMIT_BRANCH
ARG CI_COMMIT_SHA
ARG CI_COMMIT_TAG

ENV DOWNLOADS=/downloads \
    AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
    AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID} \
    HOST=${HOST} \
    DOCKER_REPOSITORY=${DOCKER_REPOSITORY} \
    ECR_URL=${ECR_URL} \
    IMAGE_SOURCE=${IMAGE_SOURCE} \
    CI_COMMIT_BRANCH=${CI_COMMIT_BRANCH} \
    CI_COMMIT_SHA=${CI_COMMIT_SHA} \
    CI_COMMIT_TAG=${CI_COMMIT_TAG} \
    JAVA_HOME=${JAVA_HOME} \
    GRAALVM_HOME=${GRAALVM_HOME} \
    GRADLE_HOME=${GRADLE_HOME} \
    GRADLE_VERSION=${GRADLE_VERSION} \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JAVA_VERSION=${JAVA_VERSION} \
    SDKMAN_DIR=/root/.sdkman

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}

RUN apt update \
    && apt install -y --no-install-recommends tzdata curl zip unzip build-essential libz-dev zlib1g-dev ca-certificates fontconfig locales \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && curl 'https://get.sdkman.io' | bash \
    && rm -rf /var/lib/apt/lists/* \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=true" >> $SDKMAN_DIR/etc/config \
    && chmod +x $SDKMAN_DIR/bin/sdkman-init.sh \
    && rm -rf /opt/graalvm

RUN bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh \
    && sdk version \
    && sdk install java $JAVA_VERSION \
    && gu install native-image \
    && rm -rf $SDKMAN_DIR/archives/* \
    && rm -rf $SDKMAN_DIR/tmp/*"

WORKDIR /home/gradle
