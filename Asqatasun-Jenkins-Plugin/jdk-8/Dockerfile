FROM maven:3-jdk-8
# ##########################################################
#
#                      DISCLAIMER
#
# #### usage ######################################################
# 
#   --- Building this docker image
#   docker build -t asqa.mvn:jenkins_jdk8  .
#   docker build -t asqa.mvn:jenkins_jdk8  --build-arg GIT_BRANCH=develop  .
#   docker build -t asqa.mvn:jenkins_jdk8  --build-arg GIT_BRANCH=v1.3.1   .
#
#   --- Compiling Asqatasun-Jenkins-Plugin with this docker image
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa.mvn:jenkins_jdk8  mvn clean install
#   docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa.mvn:jenkins_jdk8  mvn clean 
#
#   --- Playing with this docker image
#   docker run  -it --rm  asqa.mvn:jenkins_jdk8  /bin/bash
#   docker run  -it --rm  asqa.mvn:jenkins_jdk8  javac -version
#   docker run  -it --rm  asqa.mvn:jenkins_jdk8  java  -version
#   docker run  -it --rm  asqa.mvn:jenkins_jdk8  mvn   -version
#   docker run  -it --rm  asqa.mvn:jenkins_jdk8  dpkg  -l "openjdk*"
#
#
# #### source code  ###############################################
#   https://github.com/Asqatasun/Asqatasun-Jenkins-Plugin/archive/master.zip
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
ARG SRC_URL_PREFIX=https://github.com/Asqatasun/Asqatasun-Jenkins-Plugin/archive
ARG SRC_URL="${SRC_URL_PREFIX}/${GIT_BRANCH}.zip"


# build
RUN cd      /tmp/                                                   && \
    wget    ${SRC_URL}  &&   unzip  *.zip                           && \
    rm      *.zip       &&   mv     Asqa* src                       && \
    cd      src         &&   mvn    clean install                   && \
    cp -r   /root/.m2   /root/.m2_backup                            && \
    rm -rf  /tmp/src    /root/.m2/*                                 && \
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



