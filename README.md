# Debian-based Mandrel image for Quarkus projects

last updated: Wed Aug  3 16:07:25 CEST 2022
&nbsp;

&nbsp;

Main branch:  
![](https://codebuild.eu-central-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiRVhoVDhzdnBrNzdQWVBrU0t6L01rU1hjSmYybm90NjVRNGFVK3c0dTNNYis5UnVuSTlHVEZ5M0dPSktoK1JaVXhOdWJkc1paYjdVM1lXOW1iTG94SHFZPSIsIml2UGFyYW1ldGVyU3BlYyI6IjFZV2pOditTMzBlMFVnU1AiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

Latest tag: 1.0.1  
![](https://codebuild.eu-central-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiRVhoVDhzdnBrNzdQWVBrU0t6L01rU1hjSmYybm90NjVRNGFVK3c0dTNNYis5UnVuSTlHVEZ5M0dPSktoK1JaVXhOdWJkc1paYjdVM1lXOW1iTG94SHFZPSIsIml2UGFyYW1ldGVyU3BlYyI6IjFZV2pOditTMzBlMFVnU1AiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&tag=1.0.1)  
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
https://eu-central-1.console.aws.amazon.com/ecr/repositories/private/964010022385/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17
&nbsp;

&nbsp;

## 5. Image coordinates:
```  
docker pull 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17:1.0.1
```

## 6. Docker images:
```
REPOSITORY                                                                                                                                   TAG                    SIZE
964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17   1.0.1                  1.18GB
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

### 7.1. References
https://github.com/vegardit/docker-graalvm-maven  

https://hub.docker.com/r/vegardit/graalvm-maven  

https://hub.docker.com/r/vegardit/graalvm-maven/tags  

https://github.com/graalvm/mandrel/releases/tag/mandrel-22.2.0.0-Final  

### 7.2. Prerequisites

Mandrel's native-image depends on the following packages:  

```
freetype-devel
gcc
glibc-devel
libstdc++-static
zlib-devel
```
On Fedora/CentOS/RHEL they can be installed with:  

`dnf install glibc-devel zlib-devel gcc freetype-devel libstdc++-static`  
Note: The package might be called `glibc-static` or `libstdc++-devel` instead of `libstdc++-static` depending on your system.  
If the system is missing `stdc++`, `gcc-c++` package is needed too.

On Ubuntu-like systems with:  
```bash
apt install g++ zlib1g-dev libfreetype6-dev
```

## 8. image details:
```bash
$ docker run -it --entrypoint /bin/bash 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/mandrel/22-1/java-17/mandrel-22-1-gradle-7-4-java-17:1.0.1

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
HOSTNAME=39d8e4156349
JAVA_HOME=/opt/graalvm
GRADLE_HOME=/opt/gradle
AWS_DEFAULT_REGION=eu-central-1
DOCKER_REPOSITORY=releases
PWD=/home/gradle
IMAGE_SOURCE=https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4
CI_COMMIT_TAG=
HOME=/root
CI_COMMIT_SHA=
GRADLE_VERSION=7.4
GRADLE_USER_HOME=/home/root/.gradle
TERM=xterm
HOST=964010022385.dkr.ecr.eu-central-1.amazonaws.com
AWS_ACCOUNT_ID=964010022385
SHLVL=1
CI_COMMIT_BRANCH=
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
```

### 9.1. run quarkus with maven
a sample script is available at the url:
```bash
cat /scripts/07-test-quarkus.sh
```

the content
```bash
alias la='ls -la'
apt-get update -y
apt-get install curl unzip -y
mkdir /home/quarkus
cd /home/quarkus
rm -f /home/quarkus/code-with-quarkus.zip
rm -rf /home/quarkus/code-with-quarkus
curl -O -J https://code.quarkus.io/d?e=io.quarkus:quarkus-resteasy -o /home/quarkus/code-with-quarkus.zip
unzip /home/quarkus/code-with-quarkus.zip -d /home/quarkus/
rm -f /home/quarkus/code-with-quarkus.zip
cd /home/quarkus/code-with-quarkus/
/home/quarkus/code-with-quarkus/mvnw package -Pnative -f /home/quarkus/code-with-quarkus/pom.xml
/home/quarkus/code-with-quarkus/target/code-with-quarkus-1.0.0-SNAPSHOT-runner
```

### 9.2. run quarkus with gradle
You may convert the existing project into gradle using `gradle init` command as described later in this section.  
However, before you start you will need 3 files, in order to make it work:
* build.gradle
* gradle.properties
* settings.gradle

The reson behind it is, that the gradle converter works with simple projects.  
Unfortunately, Quarkus projects are not standard and they don't cooperate well.  
I solved this problem, and I gave you the example that works. You may copy the files from the given git reposiotry.  
Sample files are available at the url:  
https://eu-central-1.console.aws.amazon.com/codesuite/codecommit/repositories/base.images.red-hat.red-hat-8-5.quay-io.ubi-quarkus-mandrel.22-1.java-17.mandrel-gradle-7-4-java-17/browse/refs/tags/1.1.7/--/scripts/install/getting-started?region=eu-central-1  

```bash
alias la='ls -la'
apt-get update -y
apt-get install curl unzip -y
mkdir /home/quarkus
cd /home/quarkus
rm -f /home/quarkus/code-with-quarkus.zip
rm -rf /home/quarkus/code-with-quarkus
curl -O -J https://code.quarkus.io/d?e=io.quarkus:quarkus-resteasy -o /home/quarkus/code-with-quarkus.zip
unzip /home/quarkus/code-with-quarkus.zip -d /home/quarkus/
rm -f /home/quarkus/code-with-quarkus.zip
PROJECT_DIR=/home/quarkus/code-with-quarkus
cd $PROJECT_DIR
gradle init -p $PROJECT_DIR
```
now copy the files, as described previously, and start the build.
```bash
gradle build -x test -Dquarkus.package.type=native
```
when the build completes, you may run the image, which is located somewhere in /build/libs/ directory.
```bash
/home/quarkus/code-with-quarkus/build/libs/code-with-quarkus-1.0.0-SNAPSHOT-runner
```

## 10. Frequently Asked Questions (FAQ)
