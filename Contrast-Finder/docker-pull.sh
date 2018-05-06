#!/bin/bash
#############################################
set -o errexit 
#############################################
docker pull asqatasun/asqa.mvn:contrast.finder_jdk10
docker pull asqatasun/asqa.mvn:contrast.finder_jdk9
docker pull asqatasun/asqa.mvn:contrast.finder_jdk8
docker pull asqatasun/asqa.mvn:contrast.finder_jdk8.alpine
#############################################

