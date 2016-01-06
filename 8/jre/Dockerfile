FROM alpine:3.3
MAINTAINER Vladimir Krivosheev <develar@gmail.com>

ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 66
ENV JAVA_VERSION_BUILD 17
ENV JAVA_PACKAGE server-jre

# about nsswitch.conf - see https://registry.hub.docker.com/u/frolvlad/alpine-oraclejdk8/dockerfile/

RUN apk add --update curl ca-certificates && \
 cd /tmp && \
 curl -o glibc-2.21-r2.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
 apk add --allow-untrusted glibc-2.21-r2.apk && \
 curl -o glibc-bin-2.21-r2.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" && \
 apk add --allow-untrusted glibc-bin-2.21-r2.apk && \
 /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
 curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | gunzip -c - | tar -xf - && \
  apk del curl && \
  mv jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/jre /jre && \
  rm /jre/lib/ext/nashorn.jar && \
  rm /jre/lib/jfr.jar && \
  rm -rf /jre/lib/jfr && \
  rm -rf /jre/lib/oblique-fonts && \
  rm -rf /tmp/* /var/cache/apk/* && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

ENV JAVA_HOME /jre
ENV PATH ${PATH}:${JAVA_HOME}/bin
ENV LANG C.UTF-8
