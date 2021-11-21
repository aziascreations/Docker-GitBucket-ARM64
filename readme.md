# Docker - GitBucket for ARM64
A simple docker-compose file that can be used to create a *GitBucket* container on SBCs.

## Requirements
__CPU Architecture:__ ARM64 (Use the official image for AMD64)<br>
__RAM:__ At least 256 MiB

## Remarks
This container is not intended to be used with an external database and forces *GitBucket* to use a local DB.<br>
However, it should be relatively easy to use an external one if you change the `DATABASE_URL` environment variable.

This container uses the Temurin OpenJDK distribution from [Adoptium](https://adoptium.net/).<br>
However, the `openjdk-11-jre-headless` and `openjdk-11-jdk-headless` packages from [bitnami/minideb](https://github.com/bitnami/minideb) can be used instead if you wish to.

## Building
In order to build this container, all you have to do is to clone this repository and run `docker-compose up`.

## Configuration
TODO.

## License
[Unlicensed](LICENSE)

This license does not apply to *GitBucket*, *Java* and any of the other applications used by this container.
