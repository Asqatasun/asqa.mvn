FROM maven:3-jdk-7
MAINTAINER Fabrice Gangler <fabrice@asqatasun.org>

# ##########################################################
#
#                      DISCLAIMER
#
# #### usage ######################################################
# 
#   --- BUILDING
#   docker build -t asqa_mvn-jdk7  .
#   docker build -t asqa_mvn-jdk7  --build-arg GIT_BRANCH=develop  .  
#
#   --- TESTING
#   docker run  -it --rm  asqa_mvn-jdk7  /bin/bash
#   docker run  -it --rm  asqa_mvn-jdk7  javac -version
#   docker run  -it --rm  asqa_mvn-jdk7  java  -version
#   docker run  -it --rm  asqa_mvn-jdk7  mvn   -version
#   docker run  -it --rm  asqa_mvn-jdk7  dpkg  -l "openjdk*"
#
#   --- COMPILING
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa_mvn-jdk7  mvn clean install
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa_mvn-jdk7  mvn clean 
#
#
# #### source code  ###############################################
#   https://github.com/Asqatasun/Asqatasun/archive/master.zip
#   overwriting with --build-arg GIT_BRANCH=<branch_name>
#
# #### FROM  ######################################################
#   maven:3-jdk-7           https://github.com/carlossg/docker-maven/blob/master/jdk-7/Dockerfile
#    |--- openjdk:7-jdk     https://github.com/docker-library/openjdk/blob/master/7-jdk/Dockerfile
###################################################################

# build variables
ARG SRC_URL_PREFIX=https://github.com/Asqatasun/Asqatasun/archive
ARG GIT_BRANCH=master

ENV SRC_URL="${SRC_URL_PREFIX}/${GIT_BRANCH}.zip"
RUN cd    /tmp/                                                     && \
    wget  ${SRC_URL}                                                && \
    unzip ${GIT_BRANCH}.zip                                         && \
    cd    Asqatasun-${GIT_BRANCH}                                   && \
    mvn   clean install                                             && \
    mv    /root/.m2/repository  /usr/share/maven/ref/repository     && \
    rm    -rf /tmp/*.zip /tmp/Asq*  /root/.m2/*                     && \
        echo  "\n\n\n"                                              && \
        echo  "-----> backup maven plugins : OK"                    && \
        echo  "-----> clean : OK"                                   && \
        echo  "-----> configuration" && cd /root/                   && \
        dpkg  -l 'openjdk*'|grep ii  && echo "-------------------"  && \
        mvn   -version      && echo "----------------------------"  && \
        javac -version      && echo "----------------------------"  && \
        java  -version      && echo "----------------------------"  && \
        echo  ${SRC_URL}    && echo "----------------------------"
               


