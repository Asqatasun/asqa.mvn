[![License : AGPL v3](https://img.shields.io/badge/license-AGPL3-blue.svg)](https://github.com/Asqatasun/Asqatasun/blob/master/LICENSE)

# Docker Maven

@@@TODO README in english

## Compilation déconnecté de l'OS via Docker

### Images Docker maven avec préchargement

#### avec Java 7 (open-jdk7 + maven)

##### builder l'image docker
```shell
git clone https://github.com/dzc34/asqatasun_docker.maven.git
cd asqatasun_docker.maven/Asqatasun/jdk-7
docker build -t asqa_mvn-jdk7  .
docker build -t asqa_mvn-jdk7  --build-arg GIT_BRANCH=develop  . 
```

##### Contrôler l'image
```shell
docker run  -it --rm  asqa_mvn-jdk7  /bin/bash
docker run  -it --rm  asqa_mvn-jdk7  javac -version
docker run  -it --rm  asqa_mvn-jdk7  java  -version
docker run  -it --rm  asqa_mvn-jdk7  mvn   -version
docker run  -it --rm  asqa_mvn-jdk7  dpkg  -l "openjdk*"
```

##### Compiler Asqatasun 
```shell
git clone https://github.com/Asqatasun/Asqatasun.git
cd Asqatasun
docker run -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa_mvn-jdk7  mvn clean install
```

##### Nettoyer les dossiers de compilation
```shell
cd Asqatasun
docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa_mvn-jdk7  mvn clean 
```

#### avec Java 8 (open-jdk8 + maven)

##### builder l'image docker
```shell
git clone https://github.com/dzc34/asqatasun_docker.maven.git
cd asqatasun_docker.maven/Asqatasun/jdk-8
docker build -t asqa_mvn-jdk8  .
docker build -t asqa_mvn-jdk8  --build-arg GIT_BRANCH=develop  . 
```

##### Contrôler l'image
```shell
docker run  -it --rm  asqa_mvn-jdk8  /bin/bash
docker run  -it --rm  asqa_mvn-jdk8  javac -version
docker run  -it --rm  asqa_mvn-jdk8  java  -version
docker run  -it --rm  asqa_mvn-jdk8  mvn   -version
docker run  -it --rm  asqa_mvn-jdk8  dpkg  -l "openjdk*"
```

##### Compiler Asqatasun 
```shell
git clone https://github.com/Asqatasun/Asqatasun.git
cd Asqatasun
docker run -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa_mvn-jdk8  mvn clean install
```

##### Nettoyer les dossiers de compilation
```shell
cd Asqatasun
docker run  -it --rm  -v "$PWD":/usr/src/  -w /usr/src/  asqa_mvn-jdk8  mvn clean 
```

------

### Images Docker officielles de maven

#### avec Java 7 (open-jdk7 + maven)
```shell
docker pull maven:3-jdk-7
```
##### Tester l'image en ouvrant un shell
```shell
docker run -it --rm maven:3-jdk-8 /bin/bash
```
##### Afficher la version du compilateur java
```shell
docker run -it --rm maven:3-jdk-8 javac -version
```

##### Compiler
```shell
git clone https://github.com/Asqatasun/Asqatasun.git
cd Asqatasun
docker run -it --rm -v "$PWD":/usr/src/ -w /usr/src/ maven:3-jdk-7 mvn clean install
```

##### Nettoyer les dossiers de compilation
```shell
cd Asqatasun
docker run -it --rm -v "$PWD":/usr/src/ -w /usr/src/ maven:3-jdk-7 mvn clean
```

#### avec Java 8 (open-jdk8 + maven)
```shell
docker pull maven:3-jdk-8
```

##### Compiler
```shell
git clone https://github.com/Asqatasun/Asqatasun.git
cd Asqatasun
docker run -it --rm -v "$PWD":/usr/src/ -w /usr/src/ maven:3-jdk-8 mvn clean install
```

##### Nettoyer les dossiers de compilation
```shell
cd Asqatasun
docker run -it --rm -v "$PWD":/usr/src/ -w /usr/src/ maven:3-jdk-8 mvn clean
```

## Contact and discussions

* [Asqatasun forum](http://forum.asqatasun.org/) 
* [Twitter @Asqatasun](https://twitter.com/Asqatasun)
* email to `asqatasun AT asqatasun dot org` (only English, French and klingon is spoken :) ) 
