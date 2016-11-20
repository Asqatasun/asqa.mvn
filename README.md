[![License : AGPL v3](https://img.shields.io/badge/license-AGPL3-blue.svg)](https://github.com/dzc34/asqa.mvn/blob/master/LICENSE) [![Release](https://img.shields.io/github/release/dzc34/asqa.mvn.svg)](https://github.com/dzc34/asqa.mvn/releases/latest)

# Docker Maven for Asqatasun

@@@TODO README in english

Compilation indépendante de l'OS 
via des images Docker de Maven préchargées
avec les plugins Maven nécessaire à la compilation.

## Supported tags 

Supported tags and respective `Dockerfile` links :

* jdk7.alpine ([Asqatasun/jdk-8/alpine/Dockerfile](https://github.com/dzc34/asqa.mvn/Asqatasun/jdk-8/alpine/Dockerfile))
* jdk8.alpine ([Asqatasun/jdk-8/alpine/Dockerfile](https://github.com/dzc34/asqa.mvn/Asqatasun/jdk-8/alpine/Dockerfile))
* jdk7, latest ([Asqatasun/jdk-7/Dockerfile](https://github.com/dzc34/asqa.mvn/Asqatasun/jdk-7/Dockerfile))
* jdk8 ([Asqatasun/jdk-8/Dockerfile](https://github.com/dzc34/asqa.mvn/Asqatasun/jdk-8/Dockerfile))

## How to use this image

### Usage
```shell
docker pull dzc34/asqa.mvn:jdk7
```

#### Compiler Asqatasun 
```shell
git clone https://github.com/Asqatasun/Asqatasun.git
cd Asqatasun
docker run -it --rm  -v "$PWD":/usr/src/  -w /usr/src/ dzc34/asqa.mvn:jdk7  mvn clean install
```

#### Nettoyer les dossiers de compilation 
```shell
cd Asqatasun
docker run -it --rm  -v "$PWD":/usr/src/  -w /usr/src/ dzc34/asqa.mvn:jdk7  mvn clean 
```


##### Contrôler et manipuler l'image 
```shell
docker run -it --rm  dzc34/asqa.mvn:jdk7  /bin/bash
docker run -it --rm  dzc34/asqa.mvn:jdk7  javac -version
docker run -it --rm  dzc34/asqa.mvn:jdk7  java  -version
docker run -it --rm  dzc34/asqa.mvn:jdk7  mvn   -version
```

### Documentation


-----------

## Contact and discussions

* [Asqatasun forum](http://forum.asqatasun.org/) 
* [Twitter @Asqatasun](https://twitter.com/Asqatasun)
* email to `asqatasun AT asqatasun dot org` (only English, French and klingon is spoken :) ) 


