## Minimal Docker image with Java

[![Build Status](https://travis-ci.org/anapsix/docker-alpine-java.svg?branch=master)](https://travis-ci.org/anapsix/docker-alpine-java)

[![](https://badge.imagelayers.io/anapsix/alpine-java:latest.svg)](https://imagelayers.io/?images=anapsix/alpine-java:latest)

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.
This is based off [AlpineLinux](http://alpinelinux.org/) to keep the size minimal.

### Versions

**JRE8/JDK8 Version**: `8u60-b27`  
**JRE7/JDK7 Version**: `7u80-b15`

### Tags

* `latest` / `8` /`jre` / `jre8` : Oracle Java 8 (Server JRE)
* `jdk8` or `jdk`: Oracle Java 8 (JDK)
* `7` /`jre` / `jre7` : Oracle Java 7 (Server JRE)
* `jdk` / `jdk8` : Oracle Java 7 (JDK)

### Usage

Example: 

    docker run -it --rm anapsix/alpine-java java -version
