# AlpineLinux without GLIBC, running Oracle Java 9
FROM alpine:3.6

MAINTAINER Anastas Dancha <anapsix@random.io>

# Java Version and other ENV
ENV JAVA_VERSION_MAJOR=9 \
    JAVA_VERSION_MINOR=0 \
    JAVA_VERSION_BUILD=0 \
    JAVA_PACKAGE=server-jre9 \
    JAVA_JCE=standard \
    JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    LANG=C.UTF-8

RUN set -ex && \
    apk upgrade --update && \
    apk add --no-cache bash ca-certificates curl && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    mkdir -p /opt/jdk && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.java.net/java/jdk9-alpine/archive/181/binaries/serverjre-9-ea+181_linux-x64-musl_bin.tar.gz -o /tmp/jdk.tar.gz && \
    JAVA_PACKAGE_SHA256=$(curl -sSL http://download.java.net/java/jdk9-alpine/archive/181/binaries/serverjre-9-ea+181_linux-x64-musl_bin.sha256 | awk '{print $NF}') && \
    echo "${JAVA_PACKAGE_SHA256}  /tmp/jdk.tar.gz" > /tmp/jdk.tar.gz.sha256 && \
    sha256sum -c /tmp/jdk.tar.gz.sha256 && \
    tar zxvf /tmp/jdk.tar.gz -C /opt/jdk --strip-components=1 && \
    rm /tmp/jdk.tar.gz
# EOF
