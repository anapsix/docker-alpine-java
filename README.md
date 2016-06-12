## Minified Docker image with Java

[![Build Status](https://travis-ci.org/anapsix/docker-alpine-java.svg?branch=master)](https://travis-ci.org/anapsix/docker-alpine-java)

[![](https://badge.imagelayers.io/anapsix/alpine-java:latest.svg)](https://imagelayers.io/?images=anapsix/alpine-java:latest)

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.
This image is based on [AlpineLinux](http://alpinelinux.org/) to keep the size dow, yet smaller images do exist.  
Includes BASH, since many Java applications like to have convoluted BASH start-up scripts.

### Versions/tags
All tags upgraded to `alpine:3.4`

**JRE8/JDK8 Version**: `8u92-b14`  
**JRE7/JDK7 Version**: `7u80-b15`  
**JDK8/JDK7 Versions with alternative JVM - [DCEVM](https://dcevm.github.io/)**: `light-8u92` / `full-7u80`

### Tags

| Java version                                 | tags                    | Size |
| -------------------------------------------- | ----------------------- | ---- |
| Oracle Java 8 JRE                            | latest / 8 / jre / jre8 | [![](https://badge.imagelayers.io/anapsix/alpine-java:jre8.svg)](https://imagelayers.io/?images=anapsix/alpine-java:jre8) |
| Oracle Java 8 JDK                            | jdk / jdk8              | [![](https://badge.imagelayers.io/anapsix/alpine-java:jdk8.svg)](https://imagelayers.io/?images=anapsix/alpine-java:jdk8) |
| Oracle Java 8 JDK with alternate JVM - DCEVM | jdk8-dcevm              | [![](https://badge.imagelayers.io/anapsix/alpine-java:jdk8-dcevm.svg)](https://imagelayers.io/?images=anapsix/alpine-java:jdk8-dcevm) |
| Oracle Java 7 JRE                            | 7 / jre7                | [![](https://badge.imagelayers.io/anapsix/alpine-java:jre8.svg)](https://imagelayers.io/?images=anapsix/alpine-java:jre7) |
| Oracle Java 7 JDK                            | jdk7                    | [![](https://badge.imagelayers.io/anapsix/alpine-java:jdk7.svg)](https://imagelayers.io/?images=anapsix/alpine-java:jdk7) |
| Oracle Java 7 JDK with alternate JVM - DCEVM | jdk7-dcevm              | [![](https://badge.imagelayers.io/anapsix/alpine-java:jdk7-dcevm.svg)](https://imagelayers.io/?images=anapsix/alpine-java:jdk7-dcevm) |


### Usage

Example: 

    docker run -it --rm anapsix/alpine-java java -version
