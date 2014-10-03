#
# Apache Archiva Standalone
#

FROM java:7u65

MAINTAINER Olivier Lamy

ENV VERSION 2.1.1

RUN curl -sSLo /apache-archiva-$VERSION-bin.tar.gz http://archive.apache.org/dist/archiva/$VERSION/binaries/apache-archiva-$VERSION-bin.tar.gz \
  && tar --extract --ungzip --file apache-archiva-$VERSION-bin.tar.gz --directory / \
  && rm /apache-archiva-$VERSION-bin.tar.gz

#TODO fix sha1 md5 check
#RUN echo "18b7124e6f0a2c8f7db8167c6946d762 apache-archiva-2.2.1-bin.tar.gz" | md5sum -c
#RUN echo "5a7ddff9d85637cafa1e982a7b313a3ffe8190fa  apache-archiva-2.2.1-bin.tar.gz" | sha1sum -c

ENV ARCHIVA_BASE /apache-archiva-$VERSION
WORKDIR /apache-archiva-2.1.1

RUN mkdir /archiva-data
RUN ln -s /archiva-data /apache-archiva-$VERSION/data
VOLUME /archiva-data

EXPOSE 8080
CMD bin/archiva console

