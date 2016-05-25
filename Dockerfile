############################################################
# Dockerfile to build vsearch 1.11.1 software
# Based on debian wheezy
############################################################

# Set the base image to debian wheezy
FROM debian:wheezy

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGES wget make cmake gcc g++ autoconf libbz2-dev zlib1g-dev

########################### VSEARCH URLS #############################

ENV VSEARCH_SOURCE https://github.com/torognes/vsearch/archive/v1.11.1.tar.gz
ENV VSEARCH_DIR vsearch-1.11.1
ENV DIR /opt

################## DEPENDENCIES INSTALLATION ######################
# RUN apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev
RUN apt-get update -y
RUN apt-get install -y ${PACKAGES}

################## VSEARCH INSTALLATION ######################

WORKDIR ${DIR}
RUN wget ${VSEARCH_SOURCE} -O - | tar xvzf -
WORKDIR ${DIR}/${VSEARCH_DIR}

RUN ./autogen.sh && ./configure && make && make install

WORKDIR /root

RUN rm -r ${DIR}/${VSEARCH_DIR}

###############################################################

MAINTAINER Monjeaud Cyril <Cyril.Monjeaud@irisa.fr>
