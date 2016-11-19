[![License : AGPL v3](https://img.shields.io/badge/license-AGPL3-blue.svg)](https://github.com/Asqatasun/Asqatasun/blob/master/LICENSE)

# Docker Maven

@@@TODO README in english

## Compilation déconnecté de l'OS via Docker

### Images Docker maven avec préchargement
@@@TODO DockerFile 

### Images Docker officielles de maven

#### avec Java 7 (open-jdk7 + maven)
```shell
docker pull maven:3-jdk-7
```

##### Compiler
```shell
git clone (...)
cd Asqatasun
docker run -it --rm --name mvn-jdk7 -v "$PWD":/usr/src/asqa -w /usr/src/asqa maven:3-jdk-7 mvn clean install
```

##### Nettoyer
```shell
cd Asqatasun
docker run -it --rm --name mvn-jdk7 -v "$PWD":/usr/src/asqa -w /usr/src/asqa maven:3-jdk-7 mvn clean
```

#### avec Java 8 (open-jdk8 + maven)
```shell
docker pull maven:3-jdk-8
```

##### Compiler
```shell
git clone (...)
cd Asqatasun
docker run -it --rm --name mvn-jdk8 -v "$PWD":/usr/src/asqa -w /usr/src/asqa maven:3-jdk-8 mvn clean install
```

##### Nettoyer
```shell
cd Asqatasun
docker run -it --rm --name mvn-jdk8 -v "$PWD":/usr/src/asqa -w /usr/src/asqa maven:3-jdk-8 mvn clean
```

## Contact and discussions

* [Asqatasun forum](http://forum.asqatasun.org/) 
* [Twitter @Asqatasun](https://twitter.com/Asqatasun)
* email to `asqatasun AT asqatasun dot org` (only English, French and klingon is spoken :) ) 
