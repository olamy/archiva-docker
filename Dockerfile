#
# Apache Archiva 2.1.1 Standalone
#

FROM debian:jessie

MAINTAINER Olivier Lamy

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless openjdk-7-jdk wget && apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
ENV PATH $JAVA_HOME/bin:$PATH

RUN wget --no-verbose http://archive.apache.org/dist/archiva/2.1.1/binaries/apache-archiva-2.1.1-bin.tar.gz

## RUN echo &quot;18b7124e6f0a2c8f7db8167c6946d762 apache-archiva-2.2.1-bin.tar.gz&quot; | md5sum -c
## RUN echo &quot;5a7ddff9d85637cafa1e982a7b313a3ffe8190fa  apache-archiva-2.2.1-bin.tar.gz&quot; | sha1sum -c

RUN tar --extract --ungzip --file apache-archiva-2.1.1-bin.tar.gz --directory /

RUN export ARCHIVA_BASE=/apache-archiva-2.1.1
WORKDIR /apache-archiva-2.1.1

RUN mkdir /archiva-data
RUN ln -s /archiva-data /apache-archiva-2.1.1/data
VOLUME [&quot;/archiva-data&quot;]

EXPOSE 8080
CMD bin/archiva start

