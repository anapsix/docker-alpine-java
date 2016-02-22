#!/bin/bash

set -o pipefail -e

JRE_TEMPLATE="Dockerfile.jre.tpl"
JDK_TEMPLATE="Dockerfile.jdk.tpl"

JAVA_VERSIONS=( 7-80-15 8-74-02 )

for version in ${JAVA_VERSIONS[@]}; do
  JVM_MAJOR=$(echo $version | cut -d- -f1)
  JVM_MINOR=$(echo $version | cut -d- -f2)
  JVM_BUILD=$(echo $version | cut -d- -f3)
  echo -en "Generating Dockerfile for ${JVM_MAJOR}u${JVM_MINOR}b${JVM_BUILD} JRE.. "
  sed "s/%JVM_MAJOR%/$JVM_MAJOR/g;s/%JVM_MINOR%/$JVM_MINOR/g;s/%JVM_BUILD%/$JVM_BUILD/g;s/%JVM_PACKAGE%/server-jre/g" $JRE_TEMPLATE > $JVM_MAJOR/jre/Dockerfile && \
    echo "done" || \
    echo "failed"
  echo -en "Generating Dockerfile for ${JVM_MAJOR}u${JVM_MINOR}b${JVM_BUILD} JDK.. "
  sed "s/%JVM_MAJOR%/$JVM_MAJOR/g;s/%JVM_MINOR%/$JVM_MINOR/g;s/%JVM_BUILD%/$JVM_BUILD/g;s/%JVM_PACKAGE%/jdk/g" $JDK_TEMPLATE > $JVM_MAJOR/jdk/Dockerfile && \
    echo "done" || \
    echo "failed"
done
