## Minified Docker image with Java

[![Build Status](https://travis-ci.org/anapsix/docker-alpine-java.svg?branch=master)](https://travis-ci.org/anapsix/docker-alpine-java)

[![](https://badge.imagelayers.io/anapsix/alpine-java:latest.svg)](https://imagelayers.io/?images=anapsix/alpine-java:latest)

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.
This image is based on [AlpineLinux](http://alpinelinux.org/) to keep the size dow, yet smaller images do exist.  
Includes BASH, since many Java applications like to have convoluted BASH start-up scripts.

### Versions

**JRE8/JDK8 Version**: `8u66-b17`  
**JRE7/JDK7 Version**: `7u80-b15`

### Tags

* `latest` / `8` /`jre` / `jre8` : Oracle Java 8 (Server JRE)
* `jdk8` or `jdk`: Oracle Java 8 (JDK)
* `7` /`jre` / `jre7` : Oracle Java 7 (Server JRE)
* `jdk` / `jdk8` : Oracle Java 7 (JDK)

### Usage

Example: 

    docker run -it --rm anapsix/alpine-java java -version
