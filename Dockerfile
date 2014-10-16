#
# Apache Archiva Standalone
#

FROM java:7u65

MAINTAINER Olivier Lamy

ENV VERSION 2.1.1

RUN curl -sSLo /apache-archiva-$VERSION-bin.tar.gz http://archive.apache.org/dist/archiva/$VERSION/binaries/apache-archiva-$VERSION-bin.tar.gz \
  && tar --extract --ungzip --file apache-archiva-$VERSION-bin.tar.gz --directory / \
  && rm /apache-archiva-$VERSION-bin.tar.gz && mv /apache-archiva-$VERSION /apache-archiva

RUN useradd -d /apache-archiva/data -m archiva \
  && rm /apache-archiva/conf/archiva.xml \
  && ln -s /apache-archiva/data/archiva.xml /apache-archiva/conf/archiva.xml \
  && mkdir /apache-archiva/repositories \
  && chown archiva:archiva /apache-archiva/logs /apache-archiva/repositories /apache-archiva/temp

#TODO fix sha1 md5 check
#RUN echo "18b7124e6f0a2c8f7db8167c6946d762 apache-archiva-2.2.1-bin.tar.gz" | md5sum -c
#RUN echo "5a7ddff9d85637cafa1e982a7b313a3ffe8190fa  apache-archiva-2.2.1-bin.tar.gz" | sha1sum -c

ENV ARCHIVA_BASE /apache-archiva
WORKDIR /apache-archiva

USER archiva

VOLUME /apache-archiva/data
VOLUME /apache-archiva/logs
VOLUME /apache-archiva/repositories
VOLUME /apache-archiva/temp
VOLUME /apache-archiva/conf

EXPOSE 8080
CMD bin/archiva console

