## Minified Docker image with Java

[![Docker Pulls](https://img.shields.io/docker/pulls/anapsix/alpine-java.svg?style=round-square)](https://hub.docker.com/r/anapsix/alpine-java/)
[![](https://images.microbadger.com/badges/image/anapsix/alpine-java:latest.svg)](https://microbadger.com/images/anapsix/alpine-java:latest)
[![Build Status](https://travis-ci.org/anapsix/docker-alpine-java.svg?branch=master)](https://travis-ci.org/anapsix/docker-alpine-java)

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.  
This image is based on [AlpineLinux](http://alpinelinux.org/) to keep the size down, yet smaller images do exist.  
Includes BASH, since many Java applications like to have convoluted BASH start-up scripts.

### Versions/tags
All tags upgraded to `alpine:3.4`
Latest tags are based on `alpine:3.6`.

#### MAJOR TAGGING UPDATE
To allow selection of specific Java version, a **major retagging is taking place**.
Old tags will remain for compatibility sake, but are no longer documented.  
`:8`,`:7` and `:latest` are all valid, but are not "locked" to any specific Java version / patch set - i.e. depending on when you pull the `:8` tagged image, for example, you might end up with `8u102b14`, `8u112b15`, `8u121b13`, etc..
Well, `:7` no as much, since it's EOL and no more patches are released.  

However specific `:8uXXXbYY` tags (such as `:8u102b14`, `:8u112b15`) will guarantee particular MAJOR-MINOR-BUILD Java versions.

#### JCE Policy
Special `_unlimited` images are available with Unlimited JCE Policy

**Early Release MUSL JRE9 / JDK9**: `9 / 9_jdk`  
**Latest JRE8/JDK8 Version**: `8u162b12`  
**Latest JRE7/JDK7 Version**: `7u80b15` - no longer buildable, as Oracle provides no downloadable packages. 
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


### Disclaimer

By using Dockerfiles contained in this repo and/or container images derived from them, you are agreeing to any and all applicable license agreements & export rules related to unlimited strength crypto, etc..
