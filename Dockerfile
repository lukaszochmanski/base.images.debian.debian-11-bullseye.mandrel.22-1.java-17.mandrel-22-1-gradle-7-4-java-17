FROM 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-11/graalvm-11-gradle-7-4:1.0.1

ARG AWS_ACCOUNT_ID=964010022385
ARG HOST="964010022385.dkr.ecr.eu-central-1.amazonaws.com"
ARG DOCKER_REPOSITORY="releases"
ARG ECR_URL="https://eu-central-1.console.aws.amazon.com/ecr/repositories"
ARG IMAGE_SOURCE="https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4"
ARG JAVA_VERSION="17.0.14+9-jvmci-22.0-b05"
ARG JAVA_HOME="/opt/graalvm"
ARG GRAALVM_HOME="/opt/graalvm"
ARG GRADLE_HOME="/opt/gradle"
ARG GRADLE_VERSION="7.4"
ARG CI_COMMIT_BRANCH
ARG CI_COMMIT_SHA
ARG CI_COMMIT_TAG

ENV DOWNLOADS=/downloads \
    AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID} \
    HOST=${HOST} \
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
    JAVA_VERSION=${AWS_ACCOUNT_ID}

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}

RUN apt update \
    && apt -y install python3 python3-pip \
    && python3 -m pip install --upgrade pip \
    && python3 -m pip install --no-cache-dir awscli \
    && rm -rf /var/cache/apt/*

WORKDIR /home/gradle
