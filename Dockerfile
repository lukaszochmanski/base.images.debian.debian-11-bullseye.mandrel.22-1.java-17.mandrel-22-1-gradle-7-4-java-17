# Base image Stage 1
FROM public.ecr.aws/docker/library/debian:stable-20220711-slim as stage1

ARG DOCKER_HUB_URL=https://hub.docker.com/repository/docker/
ARG DOCKER_HUB_HOST=ochmanskide
ARG IMAGE_SOURCE="https://github.com/lukaszochmanski/base.images.debian.debian-11-bullseye.mandrel.22-1.java-17.mandrel-22-1-gradle-7-4-java-17"
ARG JAVA_VERSION="17.0.3+7"
ARG JAVA_HOME="/opt/graalvm"
ARG GRAALVM_HOME="/opt/graalvm"
ARG GRADLE_HOME="/opt/gradle"
ARG GRADLE_VERSION="7.5"
ARG CI_COMMIT_BRANCH
ARG CI_COMMIT_SHA
ARG CI_COMMIT_TAG
ARG DEBIAN_FRONTEND=noninteractive
ARG LC_ALL=C
ARG BASE_LAYER_CACHE_KEY

ENV DOWNLOADS=/downloads \
    DOCKER_HUB_HOST=${DOCKER_HUB_HOST} \
    DOCKER_HUB_URL=${DOCKER_HUB_URL} \
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
    DEBIAN_FRONTEND=${DEBIAN_FRONTEND} \
    PATH="${JAVA_HOME}/bin:${PATH}"

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}

USER root
SHELL ["/bin/bash", "-c"]
COPY scripts/install/ /scripts/
COPY scripts/home/ /home/
COPY scripts/home/docker/dockerd-entrypoint.sh /usr/local/bin/
RUN /scripts/01-install-tools.sh
RUN /scripts/02-install-packages.sh
RUN . /scripts/03-download-mandrel.sh
RUN . /scripts/04-install-native-image-tool.sh
RUN /scripts/05-install-aws-cli.sh
RUN /scripts/06-download-docker-cli.sh
RUN /scripts/06-install-docker-cli.sh
VOLUME /var/lib/docker
#RUN /scripts/07-test-quarkus.sh
RUN /scripts/08-install-gradle.sh
RUN /scripts/09-clean-apt-cache.sh
RUN /scripts/10-import-rds-certificates.sh
RUN /scripts/11-config-git.sh
RUN rm -f /home/gradle/xx*

# Stage 2
FROM public.ecr.aws/docker/library/debian:stable-20220711-slim

ARG DOCKER_HUB_URL=https://hub.docker.com/repository/docker/
ARG DOCKER_HUB_HOST=ochmanskide
ARG IMAGE_SOURCE="https://github.com/lukaszochmanski/base.images.debian.debian-11-bullseye.mandrel.22-1.java-17.mandrel-22-1-gradle-7-4-java-17"
ARG JAVA_VERSION="17.0.3+7"
ARG JAVA_HOME="/opt/graalvm"
ARG GRAALVM_HOME="/opt/graalvm"
ARG GRADLE_HOME="/opt/gradle"
ARG GRADLE_VERSION="7.5"
ARG CI_COMMIT_BRANCH
ARG CI_COMMIT_SHA
ARG CI_COMMIT_TAG
ARG DEBIAN_FRONTEND=noninteractive

ENV DOWNLOADS=/downloads \
    DOCKER_HUB_HOST=${DOCKER_HUB_HOST} \
    DOCKER_HUB_URL=${DOCKER_HUB_URL} \
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
    DEBIAN_FRONTEND=${DEBIAN_FRONTEND} \
    PATH="${JAVA_HOME}/bin:${PATH}"

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}

COPY scripts/install/ /scripts/
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

# 8404K
COPY --from=stage1 /usr/local/bin/docker-init /usr/local/bin/docker-init

SHELL ["/bin/bash", "-c"]

# build-essential (10MB)
# libz-dev (0M)
# zlib1g-dev - 196MB
# iptables (0M)
# runc 8404K
# llvm (150MB)
# Git - 70MB
# Total: 426 MB
RUN ln -s /opt/gradle/bin/gradle /usr/bin/gradle \
    && ln -s /home/gradle/.gradle /root/.gradle \
    && ln -s /usr/local/aws-cli/v2/current/bin/aws /usr/bin/aws \
    && apt-get clean \
    && apt-get update -y \
    && apt-get install --no-install-recommends -y bc ca-certificates build-essential libz-dev zlib1g-dev iptables runc git \
    && /scripts/06-install-docker-cli.sh \
    && /scripts/11-config-git.sh \
    && apt-get autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get clean

WORKDIR /home/gradle
VOLUME /var/lib/docker
SHELL ["/bin/bash", "-c", "source /home/gradle/.bash_aliases"]
ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
