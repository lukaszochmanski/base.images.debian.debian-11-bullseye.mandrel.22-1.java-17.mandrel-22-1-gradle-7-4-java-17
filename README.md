# base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4
last updated: Wed Apr 20 18:08:48 CEST 2022  
  
### CodeCommit
https://eu-central-1.console.aws.amazon.com/codesuite/codecommit/repositories/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4/browse?region=eu-central-1  
  
### Code Build
https://eu-central-1.console.aws.amazon.com/codesuite/codebuild/964010022385/projects/base-images-debian-debian-11-bullseye-gradle-gradle-7-4-graalvm-ce-17-graalvm-17-gradle-7-4/details?region=eu-central-1  
  
```bash
git clone codecommit::eu-central-1://Blueid-id-developer@base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4 base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4
```
  
### image coordinates:
https://eu-central-1.console.aws.amazon.com/ecr/repositories/private/964010022385/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4

```  
docker pull 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4:1.0.1
```
### docker images:
```
REPOSITORY																																		TAG				IMAGE ID	    SIZE
964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4		1.0.1			77001b2973d2	1.52GB
964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-11/graalvm-11-gradle-7-4		1.0.6			77001b2973d2	1.52GB
964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/vegardit/graalvm-11-gradle								1.0.4			89b0555d5692	1.32GB
```

### image based on source:
https://eu-central-1.console.aws.amazon.com/codesuite/codecommit/repositories/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-11.graalvm-11-gradle-7-4/browse?region=eu-central-1
  
https://eu-central-1.console.aws.amazon.com/ecr/repositories/private/964010022385/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-11/graalvm-11-gradle-7-4?region=eu-central-1  
```  
FROM 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-11/graalvm-11-gradle-7-4:1.0.4
```

### image details:
```bash
$ docker run -it --entrypoint /bin/bash 964010022385.dkr.ecr.eu-central-1.amazonaws.com/base/images/debian/debian-11-bullseye/gradle/gradle-7-4/graalvm-ce-17/graalvm-17-gradle-7-4:1.0.1

# echo $0
/bin/sh

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
GRAALVM_HOME=/root/.sdkman/candidates/java/current
ECR_URL=https://eu-central-1.console.aws.amazon.com/ecr/repositories
HISTCONTROL=ignorespace:ignoredups
JAVA_MAJOR_VERSION=11
MAVEN_CONFIG=/root/.m2
HISTSIZE=10000
HOSTNAME=892cfc4032ad
LANGUAGE=en_US:en
JAVA_HOME=/root/.sdkman/candidates/java/current
GRADLE_HOME=/opt/gradle
HISTTIMEFORMAT=%F %T
SDKMAN_CANDIDATES_DIR=/root/.sdkman/candidates
PWD=/home/gradle
IMAGE_SOURCE=https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/base.images.debian.debian-11-bullseye.gradle.gradle-7-4.graalvm-ce-17.graalvm-17-gradle-7-4
BASH_FUNK_PREFIX=-
CI_COMMIT_TAG=
HOME=/root
CI_COMMIT_SHA=
LANG=en_US.UTF-8
HISTFILE=/root/.bash_funk_history
LS_COLORS=rs=0:di=0;94:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
GRADLE_VERSION=7.4
SDKMAN_VERSION=5.15.0
M2_HOME=/opt/maven
TERM=xterm
HOST=964010022385.dkr.ecr.eu-central-1.amazonaws.com
MAVEN_HOME=/opt/maven
SDKMAN_DIR=/root/.sdkman
AWS_ACCOUNT_ID=964010022385
SHLVL=0
SDKMAN_CANDIDATES_API=https://api.sdkman.io/2
CI_COMMIT_BRANCH=
BASH_FUNK_ROOT=/opt/bash-funk
LC_ALL=en_US.UTF-8
MAVEN_OPTS=-Xmx1024m -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8
PATH=/root/.sdkman/candidates/java/current/bin:/opt/graalvm/bin:/opt/maven/bin:/opt/upx:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HISTIGNORE=&:?:??:clear:exit:pwd
HISTFILESIZE=10000
SDKMAN_PLATFORM=linuxx64
DOWNLOADS=/downloads
JAVA_VERSION=22.0.0.2.r17-grl

# curl --version
curl 7.74.0 (x86_64-pc-linux-gnu) libcurl/7.74.0 OpenSSL/1.1.1n zlib/1.2.11 brotli/1.0.9 libidn2/2.3.0 libpsl/0.21.0 (+libidn2/2.3.0) libssh2/1.9.0 nghttp2/1.43.0 librtmp/2.3
Release-Date: 2020-12-09
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli GSS-API HTTP2 HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM NTLM_WB PSL SPNEGO SSL TLS-SRP UnixSockets

# java -version
openjdk version "17.0.2" 2022-01-18
OpenJDK Runtime Environment GraalVM CE 22.0.0.2 (build 17.0.2+8-jvmci-22.0-b05)
OpenJDK 64-Bit Server VM GraalVM CE 22.0.0.2 (build 17.0.2+8-jvmci-22.0-b05, mixed mode, sharing)

# git version
git version 2.30.2

# docker --version
Docker version 20.10.9, build c2ea9bc

# gradle -version

------------------------------------------------------------
Gradle 7.4
------------------------------------------------------------

Build time:   2022-02-08 09:58:38 UTC
Revision:     f0d9291c04b90b59445041eaa75b2ee744162586

Kotlin:       1.5.31
Groovy:       3.0.9
Ant:          Apache Ant(TM) version 1.10.11 compiled on July 10 2021
JVM:          17.0.2 (GraalVM Community 17.0.2+8-jvmci-22.0-b05)
OS:           Linux 5.10.104-linuxkit amd64


# aws --version
aws-cli/1.22.97 Python/3.9.2 Linux/5.10.104-linuxkit botocore/1.24.42

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
systemProp.BLUEID_BCONNECT_INITIALADMINPASSWORD=admin

# ls -la /home/gradle
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .
drwxr-xr-x 1 root root 4096 Apr 13 14:57 ..
-rwxr-xr-x 1 root root  220 Apr 14 08:44 .bash_logout
-rwxr-xr-x 1 root root 3771 Apr 14 08:44 .bashrc
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .gradle
-rwxr-xr-x 1 root root  807 Apr 14 08:44 .profile
```
