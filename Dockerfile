# Glassfish 4.1 with JDK 7 Docker image
# Based on: https://github.com/aws/aws-eb-glassfish-dockerfiles/blob/aafcfc5e812dfb9b998105d3ca9da1b7f10664e1/4.0-jdk7/Dockerfile

FROM        java:7-jdk

MAINTAINER  Almir Dzinovic <almirdzin@gmail.com>

ENV         JAVA_HOME         /usr/lib/jvm/java-7-openjdk-amd64
ENV         GLASSFISH_HOME    /usr/glassfish4
ENV         PATH              $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN         apt-get update && \
            apt-get install -y curl unzip zip inotify-tools && \
            rm -rf /var/lib/apt/lists/*

RUN         curl -L -o /tmp/glassfish-4.1.zip http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip && \
            unzip /tmp/glassfish-4.1.zip -d /usr && \
            rm -f /tmp/glassfish-4.1.zip

EXPOSE      8080 4848 8181

WORKDIR     /usr/glassfish4

# verbose causes the process to remain in the foreground so that docker can track it
CMD         asadmin start-domain --verbose
