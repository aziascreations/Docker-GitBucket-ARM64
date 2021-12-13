# Docker - GitBucket for ARM64
A simple docker-compose file that can be used to create a *GitBucket* container on SBCs.

## Requirements
__CPU Architecture:__ ARM64 <sub><sup>(Use the [official image](https://hub.docker.com/r/gitbucket/gitbucket/) for AMD64)</sup></sub><br>
__RAM:__ Between 256 and 512 MiB<br>
__HDD:__ Around 200 MiB

## Remarks
This container is not intended to be used with an external database and forces GitBucket to use a local DB.<br>
However, it should be relatively easy to use an external one if you change the `DATABASE_URL` environment variable.

This container also uses the Temurin OpenJDK distribution from [Adoptium](https://adoptium.net/) and not the `openjdk-11-jre-headless` and `openjdk-11-jdk-headless` packages from [bitnami/minideb](https://github.com/bitnami/minideb).

This repository has only been tested with on GitBucket *v4.36.0* to *v4.37.0* !

## Building

### Docker
**TODO**

### Docker-compose
1. Clone the repository
2. Configure the files according to the [Configuration](#configuration) section.
3. Run `docker-compose up` in the cloned repository's folder.

## Configuration

### Dockerfile <sub><sup>(Not recommended)</sup></sub>
You can remove the last part of the second instruction to prevent the installation of *Git* if you don't intend to use any extension that requires it to be installed.

You can also edit the last `CMD` instruction to change the `-Xms128m` and `-Xmx256m` JVM arguments to more appropriate values if you need to support more than a couple concurent users and don't want to edit the [docker-compose file](docker-compose.yml) or you `docker build` command.

### Docker-compose
You can change GitBucket version by changing the `GITBUCKET_DESIRED_VERSION` build argument to the desired version number.

You can also uncomment and edit the `GITBUCKET_HOME` and `DATABASE_URL` environment variables if you intend to use an external database and/or data folder.

Finally, you can change the `JVM_RAM_MIN` and `JVM_RAM_MAX` environment variables to change the amount of RAM allocated to the *JVM* if you need to support more than a couple concurent users.

## License
[Unlicensed](LICENSE)

This license does not apply to *GitBucket*, *Java* and any of the other applications used by this container.
