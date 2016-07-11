FROM docker:latest

ENV MAVEN_VERSION 3.3.9
ENV JDK openjdk8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN apk update \
  && apk add $JDK \
  && ln -s $JAVA_HOME/javac /usr/bin/javac

RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven \
  && ln -s /usr/share/maven/apache-maven-$MAVEN_VERSION/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
