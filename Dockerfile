# Base image Stage 1
FROM 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/graalvm/graal-22-1-jdk-17:1.1.0 as stage1

ARG AWS_DEFAULT_REGION="eu-central-1"
ARG AWS_ACCOUNT_ID=964010022385
ARG HOST="964010022385.dkr.ecr.eu-central-1.amazonaws.com"
ARG DOCKER_REPOSITORY="releases"
ARG ECR_URL="https://eu-central-1.console.aws.amazon.com/ecr/repositories"
ARG IMAGE_SOURCE="https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4"
ARG JAVA_VERSION="17.0.3+7"
ARG JAVA_HOME="/opt/graalvm"
ARG GRAALVM_HOME="/opt/graalvm"
ARG GRADLE_HOME="/opt/gradle"
ARG GRADLE_VERSION="7.4"
ARG CI_COMMIT_BRANCH
ARG CI_COMMIT_SHA
ARG CI_COMMIT_TAG
ARG DEBIAN_FRONTEND=noninteractive

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
    DEBIAN_FRONTEND=${DEBIAN_FRONTEND}

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}

RUN /scripts/05-install-aws-cli.sh

RUN /scripts/06-install-docker-cli.sh
VOLUME /var/lib/docker
COPY scripts/home/docker/dockerd-entrypoint.sh /usr/local/bin/
COPY scripts/home/ /home/
ENV PATH="${JAVA_HOME}/bin:${PATH}"

#RUN /scripts/07-test-quarkus.sh
RUN /scripts/08-install-gradle.sh
RUN /scripts/09-clean-apt-cache.sh
RUN /scripts/10-import-rds-certificates.sh
RUN /scripts/11-config-git.sh
RUN rm -f /home/gradle/xx*

# Stage 2
FROM public.ecr.aws/docker/library/debian:stable-20220711-slim

ARG AWS_DEFAULT_REGION="eu-central-1"
ARG AWS_ACCOUNT_ID=964010022385
ARG HOST="964010022385.dkr.ecr.eu-central-1.amazonaws.com"
ARG DOCKER_REPOSITORY="releases"
ARG ECR_URL="https://eu-central-1.console.aws.amazon.com/ecr/repositories"
ARG IMAGE_SOURCE="https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4"
ARG JAVA_VERSION="17.0.3+7"
ARG JAVA_HOME="/opt/graalvm"
ARG GRAALVM_HOME="/opt/graalvm"
ARG GRADLE_HOME="/opt/gradle"
ARG GRADLE_VERSION="7.4"
ARG CI_COMMIT_BRANCH
ARG CI_COMMIT_SHA
ARG CI_COMMIT_TAG
ARG DEBIAN_FRONTEND=noninteractive

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
    JAVA_VERSION=${JAVA_VERSION} \
    DEBIAN_FRONTEND=${DEBIAN_FRONTEND} \
    PATH="${JAVA_HOME}/bin:${PATH}"

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}

COPY --from=stage1 /scripts/ /scripts/

# 220K
COPY scripts/ /scripts/
COPY --from=stage1 /home/ /home/

# 172K
COPY scripts/home/ /home/
COPY scripts/home/docker/dockerd-entrypoint.sh /usr/local/bin/

# 369M
COPY --from=stage1 /opt/graalvm/ /opt/graalvm/

# 124M
COPY --from=stage1 /opt/gradle/ /opt/gradle/

# 173M
COPY --from=stage1 /usr/local/aws-cli /usr/local/aws-cli

# 51M
COPY --from=stage1 /usr/local/bin/docker /usr/local/bin/docker

# 62M
COPY --from=stage1 /usr/local/bin/dockerd /usr/local/bin/dockerd

# 34.0K
COPY --from=stage1 /usr/local/bin/dind /usr/local/bin/dind

# 33M
COPY --from=stage1 /usr/local/bin/containerd /usr/local/bin/containerd

SHELL ["/bin/bash", "-c"]

# Git - 70MB
# zlib1g-dev - 196MB
RUN ln -s /opt/gradle/bin/gradle /usr/bin/gradle \
    && ln -s /home/gradle/.gradle /root/.gradle \
    && ln -s /usr/local/aws-cli/v2/current/bin/aws /usr/bin/aws \
    && apt-get clean \
    && apt-get update -y \
    && apt-get install --no-install-recommends -y g++ zlib1g-dev libfreetype6-dev git \
    && /scripts/11-config-git.sh \
    && apt-get autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get clean

WORKDIR /home/gradle
ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
