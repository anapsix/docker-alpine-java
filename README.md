## Minimal Docker image with Java

[![Build Status](https://travis-ci.org/anapsix/docker-alpine-java.svg?branch=master)](https://travis-ci.org/anapsix/docker-alpine-java)

[![](https://badge.imagelayers.io/anapsix/alpine-java:latest.svg)](https://imagelayers.io/?images=anapsix/alpine-java:latest)

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.
This is based off [Busybox](http://www.busybox.net/) to keep the size minimal (about 25% of an ubuntu-based image).

### Tags

* `latest` or `8`: Oracle Java 8 (Server JRE)
* `jdk8` or `jdk`: Oracle Java 8 (JDK)

### Usage

Example: 

    docker run -it --rm anapsix/alpine-java java -version
