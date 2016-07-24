#!/bin/bash

set -o pipefail -e

JVM_FLAVORS=(server-jre jdk jdk-dcevm)
JCE_FLAVORS=(standard unlimited)

# TEMPLATES (one per flavor)
# Dockerfile.server-jre.tpl
# Dockerfile.jdk.tpl
# Dockerfile.jdk-dcevm.tpl

JAVA_VERSIONS=( 7-80-15 8-92-14 8-102-14 )

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

  if [ "${JVM_MAJOR}" -eq "7" ]; then
    DCEVM_INSTALLER_URL="https:\\/\\/github.com\\/dcevm\\/dcevm\\/releases\\/download\\/full-jdk7u79%2B8\\/DCEVM-full-7u79-installer.jar"
    DCEVM_INSTALLER_NAME="DCEVM-full-7u79-installer.jar"
  else
    DCEVM_INSTALLER_URL="https:\\/\\/github.com\\/dcevm\\/dcevm\\/releases\\/download\\/light-jdk8u74%2B1\\/DCEVM-light-8u74-installer.jar"
    DCEVM_INSTALLER_NAME="DCEVM-light-8u74-installer.jar"
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


