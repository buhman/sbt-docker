FROM openjdk:8-jdk-slim

ENV SBT_VERSION=1.0.0 \
    DOCKER_VERSION=17.06.1 \
    PATH=${PATH}:/usr/local/sbt/bin

RUN set -ex \
  && apt-get update && apt-get -qq -y install wget \
  && wget -q -O - https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar xz -C /usr/local \
  && wget -q -O - https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz | tar xz -C /usr/local/bin --strip-components=1 docker/docker \
  && apt-get -y purge wget \
  && apt-get -y autoremove \
  && apt-get clean \
  && sbt sbtVersion
