FROM davidcaste/alpine-tomcat:jdk8tomcat7

ENV OPENGROK_INSTANCE_BASE /var/opengrok
ENV OPENGROK_TOMCAT_BASE=/opt/tomcat

RUN mkdir /var/opengrok;\
mkdir /var/opengrok/data;\
mkdir /var/opengrok/etc

RUN apk upgrade --update && \
    apk add ctags git wget

ADD opengrok-0.12.1.5.tar.gz /tmp/
RUN mv /tmp/opengrok-0.12.1.5/* /var/opengrok/

ENV PATH /var/opengrok/bin:$PATH
RUN OpenGrok deploy

RUN mkdir /src
RUN ln -s /src /var/opengrok/src

ADD run.sh /usr/local/bin/run
ENTRYPOINT ["/usr/local/bin/run"]

EXPOSE 8080

