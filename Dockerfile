FROM davidcaste/alpine-tomcat:jdk8tomcat7

MAINTAINER Swind Ou

ENV OPENGROK_INSTANCE_BASE /var/opengrok
ENV OPENGROK_TOMCAT_BASE=/opt/tomcat

RUN mkdir /var/opengrok;\
mkdir /var/opengrok/data;\
mkdir /var/opengrok/etc

RUN apk upgrade --update 
RUN apk add --upgrade  \
    wget \ 
    ctags \
    git \
    && rm -rf /var/cache/apk/*

RUN curl -SL https://github.com/OpenGrok/OpenGrok/files/213268/opengrok-0.12.1.5.tar.gz \
    | tar -zxC /var

ENV PATH /var/opengrok-0.12.1.5/bin:$PATH
RUN OpenGrok deploy

RUN mkdir /src
RUN ln -s /src /var/opengrok/src

ADD run.sh /usr/local/bin/run
ENTRYPOINT ["/usr/local/bin/run"]

EXPOSE 8080

