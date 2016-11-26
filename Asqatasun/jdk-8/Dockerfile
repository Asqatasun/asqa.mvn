FROM maven:3-jdk-8
MAINTAINER Fabrice Gangler <fabrice@asqatasun.org>

# ##########################################################
#
#                      DISCLAIMER
#
# #### usage ######################################################
# 
#   --- Building this docker image
#   docker build -t asqa.mvn:jdk8  .
#   docker build -t asqa.mvn:jdk8  --build-arg GIT_BRANCH=develop  .
#   docker build -t asqa.mvn:jdk8  --build-arg GIT_BRANCH=v4.0.3   .
#
#   --- Compiling Asqatasun with this docker image
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa.mvn:jdk8  mvn clean install
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa.mvn:jdk8  mvn clean 
#
#   --- Playing with this docker image
#   docker run  -it --rm  asqa.mvn:jdk8  /bin/bash
#   docker run  -it --rm  asqa.mvn:jdk8  javac -version
#   docker run  -it --rm  asqa.mvn:jdk8  java  -version
#   docker run  -it --rm  asqa.mvn:jdk8  mvn   -version
#   docker run  -it --rm  asqa.mvn:jdk8  dpkg  -l "openjdk*"
#
#
# #### source code  ###############################################
#   https://github.com/Asqatasun/Asqatasun/archive/master.zip
#     could be overridden with  --build-arg GIT_BRANCH=<branch_name>
#     could be overridden with  --build-arg GIT_BRANCH=<tag_name>
#
# #### FROM  ######################################################
#   maven:3-jdk-8                       https://github.com/carlossg/docker-maven/blob/master/jdk-8/Dockerfile
#   |-- openjdk:8-jdk                   https://github.com/docker-library/openjdk/blob/master/8-jdk/Dockerfile
#     |-- buildpack-deps:jessie-scm     https://github.com/docker-library/buildpack-deps/blob/master/jessie/scm/Dockerfile
#       |-- buildpack-deps:jessie-curl  https://github.com/docker-library/buildpack-deps/blob/master/jessie/curl/Dockerfile
#         |-- debian:jessie             https://github.com/tianon/docker-brew-debian/blob/master/jessie/Dockerfile
###################################################################

# build variables
ARG GIT_BRANCH=master
ARG SRC_URL_PREFIX=https://github.com/Asqatasun/Asqatasun/archive
ARG SRC_URL="${SRC_URL_PREFIX}/${GIT_BRANCH}.zip"


# build
RUN cd      /tmp/                                                   && \
    wget    ${SRC_URL}       &&   unzip  *.zip                      && \
    rm      *.zip            &&   mv     Asqa* Asqatasun            && \
    cd      Asqatasun        &&   mvn    clean install              && \
    cp -r   /root/.m2  /root/.m2_backup                             && \
    rm -rf  /tmp/Asq*  /root/.m2/*                                  && \
    rm -rf  /root/.m2_backup/repository/org/asqa*                   && \
    FIND='exec "$@"'                                                && \
    ADD='mv -f \/root\/.m2_backup\/repository \/root\/.m2\/;'       && \
    FILE=/usr/local/bin/mvn-entrypoint.sh                           && \
    sed -i "s/${FIND}/${ADD}\n${FIND}/g" $FILE                      && \
        echo  "--------------------------------------------------"  && \
        echo  "-----> backup maven plugins : OK"                    && \
        echo  "-----> clean : OK"                                   && \
        echo  "-----> configuration" && cd /root/                   && \
        dpkg  -l 'openjdk*'|grep ii  && echo "-------------------"  && \
        mvn   -version      && echo "----------------------------"  && \
        javac -version      && echo "----------------------------"  && \
        java  -version      && echo "----------------------------"  && \
        echo  ${SRC_URL}    && echo "----------------------------"
 

# environment variables
ENV SRC_PRELOAD=${SRC_URL}



