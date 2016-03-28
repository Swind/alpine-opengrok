#!/bin/sh

/opt/tomcat/bin/catalina.sh start 

echo "Generate the index."
OpenGrok index /src

echo "Update the index every one minute."
while true
do
    OpenGrok index /src
    sleep 60
done
