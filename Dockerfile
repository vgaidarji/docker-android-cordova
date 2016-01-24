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

#RUN npm install -g cordova
#RUN cordova -v

# Cordova CLI (alternative installation)
RUN apt-add-repository ppa:cordova-ubuntu/ppa
RUN apt-get update
RUN apt-get -y install cordova-cli
# To build an application for the Ubuntu platform, the following extra packages are required
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cmake debhelper libx11-dev libicu-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pkg-config qtbase5-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y qtchooser qtdeclarative5-dev qtfeedback5-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y qtlocation5-dev qtmultimedia5-dev qtpim5-dev qtsensors5-dev qtsystems5-dev



# ------------------------------------------------------
# --- Cleanup and rev num

# Cleaning
RUN apt-get clean

ENV BITRISE_DOCKER_REV_NUMBER_ANDROID_CORDOVA 2016_01_24_1
CMD bitrise -version
