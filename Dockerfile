############################################################
# Dockerfile to build vsearch 1.11.1 software
# Based on debian wheezy
############################################################

# Set the base image to debian wheezy
FROM debian:wheezy

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGES wget make cmake gcc g++

########################### VSEARCH URLS #############################

ENV VSEARCH_SOURCE https://github.com/torognes/vsearch/releases/download/v2.1.0/vsearch-2.1.0-linux-x86_64.tar.gz
ENV VSEARCH_DIR vsearch-2.1.0-linux-x86_64
ENV DIR /opt

################## DEPENDENCIES INSTALLATION ######################
# RUN apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev
RUN apt-get update -y
RUN apt-get install -y ${PACKAGES}

################## VSEARCH INSTALLATION ######################

WORKDIR ${DIR}
RUN wget ${VSEARCH_SOURCE} -O - | tar xzf -
WORKDIR ${DIR}/${VSEARCH_DIR}

RUN cp bin/vsearch /usr/local/bin/

WORKDIR /root

RUN rm -r ${DIR}/${VSEARCH_DIR}

###############################################################

MAINTAINER Monjeaud Cyril <Cyril.Monjeaud@irisa.fr>
