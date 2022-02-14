# references
# https://hub.docker.com/r/brunojppb/sbt-node
# https://github.com/mozilla/docker-sbt/blob/main/Dockerfile

FROM openjdk:8u292

ARG SBT_VERSION=0.13.18
ARG SBT_HOME="/usr/local/lib/sbt"

RUN apt-get update && \
    apt-get install -y wget curl tar gzip

RUN curl --location --output "sbt-$SBT_VERSION.deb" "https://repo.scala-sbt.org/scalasbt/debian/sbt-$SBT_VERSION.deb" && \
    dpkg -i "sbt-$SBT_VERSION.deb" && \
    rm -v "sbt-$SBT_VERSION.deb" && \
    apt-get update && \
    apt-get install -yqq sbt

RUN sbt sbtVersion

RUN curl -sL "https://deb.nodesource.com/setup_10.x" | bash - && \
    apt-get update -qq && \
    apt-get install -qq --no-install-recommends nodejs && \
    apt-get upgrade -qq

RUN java -version
RUN sbt --version
RUN npm --version
RUN node --version

WORKDIR /home

#RUN mkdir downloads

#RUN wget -P downloads "https://oss.sonatype.org/content/repositories/releases/org/codehaus/izpack/izpack-dist/5.1.3/izpack-dist-5.1.3.jar"

#RUN wget -P downloads "https://nssm.cc/release/nssm-2.24.zip"

#COPY . .

#CMD [ "date" ]
