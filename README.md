## Minimal Docker image with Java

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.
This is based off [Busybox](http://www.busybox.net/) to keep the size minimal (about 25% of an ubuntu-based image).

### Tags

* `latest` or `8`: Oracle Java 8
* `7`: Oracle Java 7

### Usage

Example: 

    docker run -it --rm jeanblanchard/busybox-java:8 java -version
