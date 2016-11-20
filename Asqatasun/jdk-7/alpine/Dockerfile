FROM maven:3-jdk-7-alpine
MAINTAINER Fabrice Gangler <fabrice@asqatasun.org>

# ##########################################################
#
#                      DISCLAIMER
#
# #### usage ######################################################
# 
#   --- BUILDING
#   docker build -t asqa.mvn:jdk7.alpine  . 
#   docker build -t asqa.mvn:jdk7.alpine  --build-arg GIT_BRANCH=develop  .  
#
#   --- TESTING
#   docker run  -it --rm  asqa.mvn:jdk7.alpine  /bin/bash
#   docker run  -it --rm  asqa.mvn:jdk7.alpine  javac -version
#   docker run  -it --rm  asqa.mvn:jdk7.alpine  java  -version
#   docker run  -it --rm  asqa.mvn:jdk7.alpine  mvn   -version
#
#   --- COMPILING
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa.mvn:jdk7.alpine  mvn clean install
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa.mvn:jdk7.alpine  mvn clean 
#
#
# #### source code  ###############################################
#   https://github.com/Asqatasun/Asqatasun/archive/master.zip
#   overwriting with --build-arg GIT_BRANCH=<branch_name>
#
# #### FROM  ######################################################
#   maven:3-jdk-7-alpine      https://github.com/carlossg/docker-maven/blob/alpine/jdk-7/Dockerfile
#   |-- openjdk:7-jdk-alpine  https://github.com/docker-library/openjdk/blob/master/7-jdk/alpine/Dockerfile
#     |-- alpine:3.4          https://github.com/gliderlabs/docker-alpine/blob/master/versions/library-3.4/Dockerfile
###################################################################

# build variables
ARG GIT_BRANCH=master
ARG SRC_URL_PREFIX=https://github.com/Asqatasun/Asqatasun/archive
ARG SRC_URL="${SRC_URL_PREFIX}/${GIT_BRANCH}.zip"

# build
RUN cd      /tmp/                                                   && \
    apk     add --update openssl                                    && \            
    wget    ${SRC_URL}                                              && \
    unzip   ${GIT_BRANCH}.zip                                       && \
    cd      Asqatasun-${GIT_BRANCH}                                 && \
    mvn     clean install                                           && \
    cp -r   /root/.m2   /root/.m2_backup                            && \
    rm -rf  /tmp/*.zip  /tmp/Asq*  /root/.m2/*                      && \
    FIND='exec "$@"'                                                && \
    ADD='mv -f \/root\/.m2_backup\/repository \/root\/.m2\/;'       && \
    FILE=/usr/local/bin/mvn-entrypoint.sh                           && \
    sed -i "s/${FIND}/${ADD}\n${FIND}/g" $FILE                      && \
        echo  "--------------------------------------------------"  && \
        echo  "-----> backup maven plugins : OK"                    && \
        echo  "-----> clean : OK"                                   && \
        echo  "-----> configuration" && cd /root/                   && \
        mvn   -version      && echo "----------------------------"  && \
        javac -version      && echo "----------------------------"  && \
        java  -version      && echo "----------------------------"  && \
        echo  ${SRC_URL}    && echo "----------------------------"
 

# environment variables
ENV SRC_PRELOAD=${SRC_URL}



