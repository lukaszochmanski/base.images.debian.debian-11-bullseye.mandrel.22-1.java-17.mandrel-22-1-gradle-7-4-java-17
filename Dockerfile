FROM 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/vegardit/graalvm-17-gradle:1.0.0

ARG AWS_DEFAULT_REGION="eu-central-1"
ARG AWS_ACCOUNT_ID=964010022385
ARG HOST="964010022385.dkr.ecr.eu-central-1.amazonaws.com"
ARG DOCKER_REPOSITORY="releases"
ARG ECR_URL="https://eu-central-1.console.aws.amazon.com/ecr/repositories"
ARG IMAGE_SOURCE="https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4"
ARG JAVA_VERSION="17.0.1+9-jvmci-22.0-b05"
ARG JAVA_HOME="/opt/graalvm"
ARG GRAALVM_HOME="/opt/graalvm"
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
    JAVA_VERSION=${JAVA_VERSION}

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}


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
    JAVA_VERSION=${JAVA_VERSION} \
    JAVA_HOME=${JAVA_HOME} \
    GRAALVM_HOME=${GRAALVM_HOME} \
    GRADLE_HOME=${GRADLE_HOME} \
    GRADLE_VERSION=${GRADLE_VERSION} \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

LABEL git.branch=${CI_COMMIT_BRANCH} \
      git.commit=${CI_COMMIT_SHA} \
      git.tag=${CI_COMMIT_TAG} \
      git.source=${IMAGE_SOURCE}

# Install AWS CLI v2
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip \
    && unzip -q /tmp/awscliv2.zip -d /opt \
    && /opt/aws/install --update -i /usr/local/aws-cli -b /usr/local/bin \
    && rm /tmp/awscliv2.zip \
    && rm -rf /opt/aws \
    && aws --version

#****************        DOCKER    *********************************************
ARG DOCKER_BUCKET="download.docker.com"
ARG DOCKER_CHANNEL="stable"
ARG DIND_COMMIT="3b5fac462d21ca164b3778647420016315289034"
ARG DOCKER_COMPOSE_VERSION="1.27.4"
ARG SRC_DIR="/usr/src"

ARG DOCKER_SHA256="dd6ff72df1edfd61ae55feaa4aadb88634161f0aa06dbaaf291d1be594099ff3"
ARG DOCKER_VERSION="20.10.11"

# Install Docker
RUN apt-get update \
    && apt-get install -y -qq --no-install-recommends iptables llvm \
    && curl -fSL "https://${DOCKER_BUCKET}/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
    && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
    && tar --extract --file docker.tgz --strip-components 1  --directory /usr/local/bin/ \
    && rm docker.tgz \
    && docker -v \
    # set up subuid/subgid so that "--userns-remap=default" works out-of-the-box
    && addgroup dockremap \
    && useradd -g dockremap dockremap \
    && echo 'dockremap:165536:65536' >> /etc/subuid \
    && echo 'dockremap:165536:65536' >> /etc/subgid \
    && curl -fSL "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind" -o /usr/local/bin/dind \
    && chmod +x /usr/local/bin/dind

VOLUME /var/lib/docker
#*********************** END  DOCKER  ****************************

RUN $GRAALVM_HOME/bin/gu install native-image

RUN apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get clean

COPY scripts/home/docker/dockerd-entrypoint.sh /usr/local/bin/
COPY scripts/home/ /home/
RUN /home/aws/import-rds-certs.sh && \
    rm /home/aws/import-rds-certs.sh

WORKDIR /home/gradle
ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
