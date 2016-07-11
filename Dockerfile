FROM docker:latest

ENV MAVEN_VERSION 3.3.9
ENV JRE openjdk8-jre

RUN apk update && apk add $JRE

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven \
  && ln -s /usr/share/maven/apache-maven-$MAVEN_VERSION/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
