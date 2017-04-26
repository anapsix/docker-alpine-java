#!/bin/bash

set -o pipefail -e

JVM_FLAVORS=(server-jre jdk jdk-dcevm)
JCE_FLAVORS=(standard unlimited)

# TEMPLATES (one per flavor)
# Dockerfile.server-jre.tpl
# Dockerfile.jdk.tpl
# Dockerfile.jdk-dcevm.tpl

JAVA_VERSIONS=(7-80-15 8-92-14 8-102-14 8-111-14 8-121-13-e9e7ea248e2c4826b92b3f075a80e441 8-131-11-d54c1d3a095b4ff2b6607d096fa80163)

GLIBC_VERSION="2.23-r3"

gen_dockerfile() {
  JVM_PACKAGE="$1"
  DOCKERFILE_TEMPLATE="Dockerfile.${JVM_PACKAGE}.tpl"
  DOCKERFILE_TARGET="${JVM_MAJOR}/${JVM_MINOR}b${JVM_BUILD}/${JVM_PACKAGE}/${JAVA_JCE}/Dockerfile"
  DOCKERFILE_TARGET_DIR="$(dirname ${DOCKERFILE_TARGET})"

  echo -en "Generating Dockerfile for ${JVM_MAJOR}u${JVM_MINOR}b${JVM_BUILD} ${JVM_PACKAGE} (${JAVA_JCE:-$JCE_FLAVORS} JCE policy).. "
  if [ ! -r ${DOCKERFILE_TEMPLATE} ]; then
    echo "failed"
    echo "Missing Dockerfile template ${DOCKERFILE_TEMPLATE}"
    exit 1
  fi

  # create target dockerfile dir
  if [ ! -e ${DOCKERFILE_TARGET_DIR} ]; then
    mkdir -p ${DOCKERFILE_TARGET_DIR}
  fi

  if [ "${JVM_PACKAGE}" == "jdk-dcevm" ]; then
    JVM_PACKAGE="jdk"
  fi

  sed "s/%JVM_MAJOR%/${JVM_MAJOR}/g;
       s/%JVM_MINOR%/${JVM_MINOR}/g;
       s/%JVM_BUILD%/${JVM_BUILD}/g;
       s/%JVM_PACKAGE%/${JVM_PACKAGE}/g;
       s/%JVM_URL%/${JVM_URL}/g;
       s/%JAVA_JCE%/${JAVA_JCE:-standard}/g;
       s/%DCEVM_INSTALLER_URL%/${DCEVM_INSTALLER_URL}/g;
       s/%DCEVM_INSTALLER_NAME%/${DCEVM_INSTALLER_NAME}/g;
       s/%GLIBC_VERSION%/${GLIBC_VERSION}/g" \
    ${DOCKERFILE_TEMPLATE} > ${DOCKERFILE_TARGET} && \
  echo "done" || \
  echo "failed"
}

for version in ${JAVA_VERSIONS[@]}; do
  JVM_MAJOR=$(echo $version | cut -d- -f1)
  JVM_MINOR=$(echo $version | cut -d- -f2)
  JVM_BUILD=$(echo $version | cut -d- -f3)
  JVM_TEMP=$(echo $version | cut -d- -f4)

  if [ "${JVM_MINOR}" -ge 121 ]; then
    JVM_URL='http:\/\/download.oracle.com\/otn-pub\/java\/jdk\/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}\/'${JVM_TEMP}'\/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz'
  else
    JVM_URL='http:\/\/download.oracle.com\/otn-pub\/java\/jdk\/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}\/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz'
  fi

  if [ "${JVM_MAJOR}" -eq "7" ]; then
    DCEVM_INSTALLER_VERSION=7u79
    DCEVM_INSTALLER_URL="https:\\/\\/github.com\\/dcevm\\/dcevm\\/releases\\/download\\/full-jdk${DCEVM_INSTALLER_VERSION}%2B8\\/DCEVM-full-${DCEVM_INSTALLER_VERSION}-installer.jar"
    DCEVM_INSTALLER_NAME="DCEVM-full-${DCEVM_INSTALLER_VERSION}-installer.jar"
  else
    DCEVM_INSTALLER_VERSION=8u112
    DCEVM_INSTALLER_URL="https:\\/\\/github.com\\/dcevm\\/dcevm\\/releases\\/download\\/light-jdk${DCEVM_INSTALLER_VERSION}%2B8\\/DCEVM-light-${DCEVM_INSTALLER_VERSION}-installer.jar"
    DCEVM_INSTALLER_NAME="DCEVM-light-${DCEVM_INSTALLER_VERSION}-installer.jar"
  fi

  for JVM_FLAVOR in ${JVM_FLAVORS[@]}; do
    
    if [ "${JVM_MAJOR}" -eq "8" ]; then
      for JAVA_JCE in ${JCE_FLAVORS[@]}; do
        gen_dockerfile $JVM_FLAVOR
      done
    else
      gen_dockerfile $JVM_FLAVOR
    fi

  done
done

echo -n "Generating symlinks for current versions.. "
for JAVA_MAJOR in $(echo "${JAVA_VERSIONS[@]}" | tr ' ' '\n\' | cut -d- -f1 | uniq); do
  latest=$(ls ${JAVA_MAJOR} | sort -n | tail -n1)
  cd ${JAVA_MAJOR}
  [ -e current ] && rm current || true
  ln -s ${latest} current
  cd ..
done
echo "done"
