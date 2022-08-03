# Debian-based Mandrel image for Quarkus projects

last updated: Wed Aug  3 15:06:44 CEST 2022
&nbsp;

&nbsp;

Main branch:  
![](https://codebuild.eu-central-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiRVhoVDhzdnBrNzdQWVBrU0t6L01rU1hjSmYybm90NjVRNGFVK3c0dTNNYis5UnVuSTlHVEZ5M0dPSktoK1JaVXhOdWJkc1paYjdVM1lXOW1iTG94SHFZPSIsIml2UGFyYW1ldGVyU3BlYyI6IjFZV2pOditTMzBlMFVnU1AiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

Latest tag: 1.0.0  
![](https://codebuild.eu-central-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiRVhoVDhzdnBrNzdQWVBrU0t6L01rU1hjSmYybm90NjVRNGFVK3c0dTNNYis5UnVuSTlHVEZ5M0dPSktoK1JaVXhOdWJkc1paYjdVM1lXOW1iTG94SHFZPSIsIml2UGFyYW1ldGVyU3BlYyI6IjFZV2pOditTMzBlMFVnU1AiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&tag=1.0.0)  
&nbsp;

&nbsp;

## Before you start

### Gradle configuration

Before you start it is assumed that you read and completed the
[Developer Guide](https://eu-central-1.console.aws.amazon.com/codesuite/codecommit/repositories/documentation.developer-documentation/browse?region=eu-central-1)

The document contains instruction how to configure access to our binary repository (CodeArtifact).  
Without access to CodeArtifact, you will be unable to compile any java project. Most java projects use libraries,  
which are stored in there. If you don't set up the Multi-Factor authentication, the credentials, and the right repository URL  
in your operating system, you may see compilation errors or other type of errors during build process.
&nbsp;

&nbsp;
&nbsp;

&nbsp;

## 1. How to clone:
```bash
git clone codecommit::eu-central-1://Blueid-id-developer@base.images.debian.debian-11-bullseye.mandrel.22-1.java-17.mandrel-22-1-gradle-7-4-java-17 $AWS/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17
```

## 2. CodeCommit
https://eu-central-1.console.aws.amazon.com/codesuite/codecommit/repositories/base.images.debian.debian-11-bullseye.mandrel.22-1.java-17.mandrel-22-1-gradle-7-4-java-17/browse?region=eu-central-1
&nbsp;

&nbsp;

## 3. CodeBuild
https://eu-central-1.console.aws.amazon.com/codesuite/codebuild/964010022385/projects/base-images-debian-11-bullseye-mandrel-22-1-gradle-7-4-java-17-build-project/details?region=eu-central-1
&nbsp;

&nbsp;

## 4. Amazon Elastic Container Registry page:
https://eu-central-1.console.aws.amazon.com/ecr/repositories/private/964010022385/releases/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17
&nbsp;

&nbsp;

## 5. Image coordinates:
```  
docker pull 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17:1.0.0
```

## 6. Docker images:
```
REPOSITORY                                                                                                                                   TAG                    IMAGE ID       CREATED              SIZE
964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17   1.0.0                  1.18GB
964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17   latest                 1.18GB
public.ecr.aws/docker/library/debian                                                                                                         stable-20220711-slim   80.4MB
```

```
### Mandrel Image
### Debian Slim
### Debian based Mandrel Official Image
### base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17

debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   00-slim            80MB   (80MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   01-clean           80MB   (0MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   02-graalvm         465MB  (385MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   03-gradle          594MB  (129MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   04-aws-cli         753MB  (159MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   05-docker-cli      805MB  (52MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   06-dockerd         870MB  (65MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   07-containerd      904MB  (34MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   08-build-essential
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   09-libz-dev
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   10-zlib1g-dev      1.11GB (196MB)
debian-11-bullseye/mandrel-22-1-gradle-7-4-java-17   11-git             1.18GB (70MB)
```

## 7. image based on source:
https://eu-central-1.console.aws.amazon.com/codesuite/codecommit/repositories/base.images.debian.debian-11-bullseye.mandrel.22-1.java-17.mandrel-22-1-gradle-7-4-java-17/browse?region=eu-central-1

https://eu-central-1.console.aws.amazon.com/codesuite/codecommit/repositories/base.images.debian.debian-11-bullseye.graalvm.graal-22-1-jdk-17/browse?region=eu-central-1

```  
FROM public.ecr.aws/docker/library/debian:stable-20220711-slim
```

## 8. image details:
```bash
$ docker run -it --entrypoint /bin/bash 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17:1.0.0

# echo $0
/bin/bash

# pwd
/home/gradle

# whoami
root

# cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
NAME="Debian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

# printenv
GRAALVM_HOME=/opt/graalvm
ECR_URL=https://eu-central-1.console.aws.amazon.com/ecr/repositories
HOSTNAME=40d34d5c68df
LANGUAGE=en_US:en
JAVA_HOME=/opt/graalvm
GRADLE_HOME=/opt/gradle
AWS_DEFAULT_REGION=eu-central-1
DOCKER_REPOSITORY=releases
PWD=/home/gradle
IMAGE_SOURCE=https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.mandrel.22-1.java-17.mandrel-22-1-gradle-7-4-java-17
CI_COMMIT_TAG=
HOME=/root
CI_COMMIT_SHA=
LANG=en_US.UTF-8
GRADLE_VERSION=7.4
TERM=xterm
HOST=964010022385.dkr.ecr.eu-central-1.amazonaws.com
AWS_ACCOUNT_ID=964010022385
SHLVL=1
CI_COMMIT_BRANCH=
LC_ALL=en_US.UTF-8
PATH=/opt/graalvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DOWNLOADS=/downloads
DEBIAN_FRONTEND=noninteractive
JAVA_VERSION=17.0.3+7
_=/usr/bin/printenv

# curl --version
bash: curl: command not found

# java -version
openjdk version "17.0.3" 2022-04-19
OpenJDK Runtime Environment Temurin-17.0.3+7 (build 17.0.3+7)
OpenJDK 64-Bit Server VM Temurin-17.0.3+7 (build 17.0.3+7, mixed mode, sharing)
root@40d34d5c68df:/home/gradle#

# git version
git version 2.30.2

# docker --version
Docker version 20.10.11, build dea9396

# gradle -version

Welcome to Gradle 7.4!

Here are the highlights of this release:
 - Aggregated test and JaCoCo reports
 - Marking additional test source directories as tests in IntelliJ
 - Support for Adoptium JDKs in Java toolchains

For more details see https://docs.gradle.org/7.4/release-notes.html


------------------------------------------------------------
Gradle 7.4
------------------------------------------------------------

Build time:   2022-02-08 09:58:38 UTC
Revision:     f0d9291c04b90b59445041eaa75b2ee744162586

Kotlin:       1.5.31
Groovy:       3.0.9
Ant:          Apache Ant(TM) version 1.10.11 compiled on July 10 2021
JVM:          17.0.3 (Eclipse Adoptium 17.0.3+7)
OS:           Linux 5.10.104-linuxkit amd64


# aws --version
aws-cli/2.7.18 Python/3.9.11 Linux/5.10.104-linuxkit exe/x86_64.debian.11 prompt/off

# cat /home/gradle/.gradle/gradle.properties
org.gradle.daemon=true
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.console=plain
buildInfo.build.number=CodeBuild
systemProp.org.gradle.internal.launcher.welcomeMessageEnabled=false
systemProp.AWS_DEFAULT_REGION=eu-central-1
systemProp.AWS_CODEARTIFACT_DOMAIN=blueid
systemProp.AWS_CODEARTIFACT_DOMAIN_OWNER=964010022385
systemProp.AWS_ECR_DOMAIN_OWNER=964010022385
systemProp.AWS_CODEARTIFACT_PROFILE=id-tool-devop
systemProp.AWS_CODEARTIFACT_USER=aws

# ls -la /home/gradle
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .
drwxr-xr-x 1 root root 4096 Apr 13 14:57 ..
-rwxr-xr-x 1 root root  220 Apr 14 08:44 .bash_logout
-rwxr-xr-x 1 root root 3771 Apr 14 08:44 .bashrc
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .gradle
-rwxr-xr-x 1 root root  807 Apr 14 08:44 .profile
```

## 9. Sample diagnostics
```bash
java -version && echo
gradle -version && echo
docker --version && echo
aws --version && echo
alias la='ls -la' && echo
la /usr/local/bin/containerd && echo
/usr/local/bin/dockerd-entrypoint.sh 2> /dev/null && echo
/home/aws/ecr/login.sh && echo
docker images && echo
rm -f /home/gradle/code-with-quarkus/code-with-quarkus.zip
apt-get update -y
apt-get install curl zip -y
curl -O -J https://code.quarkus.io/d?e=io.quarkus:quarkus-resteasy -o /home/gradle/code-with-quarkus/
unzip /home/gradle/code-with-quarkus/code-with-quarkus.zip
/home/gradle/code-with-quarkus/mvnw package -Pnative -f /home/gradle/code-with-quarkus/pom.xml
/home/gradle/code-with-quarkus/target/code-with-quarkus-1.0.0-SNAPSHOT-runner
/scripts/07-test-quarkus.sh && echo
```
