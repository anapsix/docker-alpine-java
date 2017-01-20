## Minified Docker image with Java

[![Build Status](https://travis-ci.org/anapsix/docker-alpine-java.svg?branch=master)](https://travis-ci.org/anapsix/docker-alpine-java)

[![](https://images.microbadger.com/badges/image/anapsix/alpine-java:latest.svg)](https://microbadger.com/images/anapsix/alpine-java:latest)

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.
This image is based on [AlpineLinux](http://alpinelinux.org/) to keep the size dow, yet smaller images do exist.  
Includes BASH, since many Java applications like to have convoluted BASH start-up scripts.

### Versions/tags
All tags upgraded to `alpine:3.4`

#### MAJOR TAGGING UPDATE
To allow selection of specific Java version, a **major retagging is taking place**.
Old tags will remain for compatibility sake, but are no longer documented.

#### JCE Policy
Special `_unlimited` images are available with Unlimited JCE Policy

**Latest JRE8/JDK8 Version**: `8u112b15`  
**Latest JRE7/JDK7 Version**: `7u80b15`  
**JDK8/JDK7 Versions with alternative JVM - [DCEVM](https://dcevm.github.io/)**: `light-8u112` / `full-7u80`

### Tags

Latest Oracle Java 8 Server-JRE:
* `latest`
* `8`
* `8_server-jre`
* `8_server-jre_unlimited`

Latest Oracle Java 8 JDK (plus DCEVM variant)
* `8_jdk`
* `8_jdk_unlimited`
* `8_jdk-dcevm`
* `8_jdk-dcevm_unlimited`

Latest Oracle Java 7 Server-JRE:
* `7`
* `7_server-jre`

Latest Oracle Java 7 JDK (plus DCEVM variant):
* `7_jdk`
* `7_jdk-dcevm`


### Usage

Example: 

    docker run -it --rm anapsix/alpine-java java -version
