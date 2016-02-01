FROM bitriseio/docker-android:latest

# ------------------------------------------------------
# --- Install required tools

RUN apt-get update -qq

# ------------------------------------------------------
# --- Node JS

# Node JS
# Add the Node.js-maintained repositories to Ubuntu package source list
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
# The nodejs package contains the nodejs binary as well as npm
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
# "build-essential" required, but were pre-installed in base image
RUN nodejs -v
RUN npm -v

# ------------------------------------------------------
# --- Cordova CLI

RUN npm install -g cordova
RUN cordova -v

# ------------------------------------------------------
# --- Install Ant

RUN apt-get install -y ant
RUN ant -version

# ------------------------------------------------------
# --- Set missing environment variables

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
ENV PATH ${PATH}:${JAVA_HOME}

# ------------------------------------------------------
# --- Cleanup and rev num

# Cleaning
RUN apt-get clean

ENV BITRISE_DOCKER_REV_NUMBER_ANDROID_CORDOVA 2016_01_24_1
CMD bitrise -version
