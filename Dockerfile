#
# Apache Archiva 2.1.1 Standalone
#

#FROM hrafique/openjdk-quantal
FROM debian:jessie

MAINTAINER Olivier Lamy

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless openjdk-7-jdk && apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
ENV PATH $JAVA_HOME/bin:$PATH

RUN wget --no-verbose http://www.apache.org/dist/archiva/2.1.1/binaries/apache-archiva-2.1.1-bin.tar.gz

## RUN echo &quot;997a67da720c0848cfee4726e23984fb  apache-archiva-1.3.6-bin.tar.gz&quot; | md5sum -c
## RUN echo &quot;60c5de4291e2a3b5238f59087a700d71fed3710d  apache-archiva-1.3.6-bin.tar.gz&quot; | sha1sum -c

RUN tar --extract --ungzip --file apache-archiva-1.3.6-bin.tar.gz --directory /
## RUN rm -f /apache-archiva-1.3.6/bin/wrapper-linux-x86-32  # See README.md for explanation.

RUN export ARCHIVA_BASE=/apache-archiva-2.1.1
WORKDIR /apache-archiva-1.3.6

RUN mkdir /archiva-data
RUN ln -s /archiva-data /apache-archiva-2.1.1/data
VOLUME [&quot;/archiva-data&quot;]

EXPOSE 8080
CMD bin/archiva console

