FROM openjdk:8-jdk-slim

ENV SBT_VERSION=1.0.0 \
    PATH=${PATH}:/usr/local/sbt/bin

RUN set -ex \
  && apt-get update && apt-get -qq -y install wget \
  && wget -q -O - https://github.com/sbt/sbt/releases/download/v1.0.0/sbt-1.0.0.tgz | tar xz -C /usr/local \
  && apt-get -y purge wget \
  && apt-get -y autoremove \
  && apt-get clean \
  && sbt sbtVersion
