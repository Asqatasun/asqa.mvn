#!/bin/bash
#############################################
set -o errexit 
#############################################
REMOTE_BRANCH="develop"
PREFIX_NAME="asqa.mvn:contrast.finder_jdk"
BUILD_ARG="--build-arg GIT_BRANCH=${REMOTE_BRANCH}"
#############################################
docker build ${BUILD_ARG} -t ${PREFIX_NAME}10       jdk-10/
docker build ${BUILD_ARG} -t ${PREFIX_NAME}9        jdk-9/
docker build ${BUILD_ARG} -t ${PREFIX_NAME}8        jdk-8/
docker build ${BUILD_ARG} -t ${PREFIX_NAME}8.alpine jdk-8/alpine
#############################################
