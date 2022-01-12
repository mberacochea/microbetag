# microbetag: annotating microbial co-occurrence networks
# 
# Aim:   this Docker image will encapsulate all the related  
#        tools, databases and software modules for the microbetag
#        network annotator
# 
# Usage: docker build -t hariszaf/microbetag:<tag> .

FROM ubuntu:20.04 

LABEL maintainer = "Haris Zafeiropoulos" 
LABEL contact    = "haris-zaf@hcmr.gr"
LABEL build_date = "2022-12-01"
LABEL version    = "v.0.0.1"

# This mode allows zero interaction while installing or upgrading the system via apt; it accepts the default answer for all questions.
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /home

# Get general software; bzip is required to install R 
RUN apt-get update &&\
    apt-get install -y software-properties-common &&\
    apt-get update --fix-missing && \
    apt-get install -y wget \ 
                       git \
                       unzip \
                       mlocate \ 
                       libbz2-dev
                     
# Set Python
RUN add-apt-repository ppa:deadsnakes/ppa &&\
# Install py39 from deadsnakes repository
    apt-get install -y python3 &&\
    # Install pip from standard ubuntu packages
    apt-get install -y python3-pip


# Set R

## First I need to get some R dependencies 
RUN apt-get install -y gfortran && \
    apt-get install -y build-essential && \
    apt-get install -y fort77 && \
    apt-get install -y xorg-dev && \
    apt-get install -y libblas-dev &&\ 
    apt-get install -y gcc-multilib && \
    apt-get install -y gobjc++ && \
    apt-get install -y aptitude && \
    aptitude install -y libreadline-dev

RUN export CC=/usr/bin/gcc && \
    export CXX=/usr/bin/g++ && \
    export FC=/usr/bin/gfortran && \
    export PERL=/usr/bin/perl

RUN apt-get install -y libpcre3-dev \
                       libpcre2-dev \
                       libpcre-ocaml-dev \
                       libghc-regex-pcre-dev

# Install some extra staff and leave out later what is not needed
RUN apt-get install -y liblzma-dev \
                       libcurl4-openssl-dev \
                       libglib2.0-0 \
                       libxext6 \
                       libsm6 \
                       libxrender1 \
                       mercurial \
                       subversion \
                       autoconf \
                       autogen \
                       libtool \
                       zlib1g-dev

## Install R 
WORKDIR /usr/local/lib/
RUN wget https://ftp.cc.uoc.gr/mirrors/CRAN/src/base/R-3/R-3.6.0.tar.gz
RUN tar -xf R-3.6.0.tar.gz
WORKDIR /usr/local/lib/R-3.6.0
RUN ./configure &&\
    make &&\
    make install

# Install BugBase dependencies
RUN Rscript -e 'install.packages("dplyr", repos="https://cran.rstudio.com")'
#    Rscript -e 'install.packages("RColorBrewer", repos="https://cran.rstudio.com")' &&\
#    Rscript -e 'install.packages("beeswarm", repos="https://cran.rstudio.com")' &&\
#    Rscript -e 'install.packages("reshape2", repos="https://cran.rstudio.com")' &&\
#    Rscript -e 'install.packages("dplyr", repos="https://cran.rstudio.com")' && \
#    Rscript -e 'install.packages("gridExtra", repos="https://cran.rstudio.com")' && \
#    Rscript -e 'install.packages("RJSONIO", repos="https://cran.rstudio.com")' && \
#    Rscript -e 'install.packages("digest", repos="https://cran.rstudio.com")' && \
#    Rscript -e 'install.packages("optparse", repos="https://cran.rstudio.com")' && \
#    Rscript -e 'install.packages("ggplot2", repos="https://cran.rstudio.com")' && \
#    Rscript -e 'install.packages("Matrix", repos="https://cran.rstudio.com")' && \
#    Rscript -e 'install.packages("labeling", repos="https://cran.rstudio.com")'


# Install BugBase
WORKDIR /mnt/external_tools
RUN git clone https://github.com/knights-lab/BugBase.git 

RUN echo "export BUGBASE_PATH=$PATH:/mnt/external_tools/BugBase" >> /root/.bashrc && \
    echo "export PATH=$PATH:$BUGBASE_PATH/bin" >> /root/.bashrc

WORKDIR /mnt/external_tools/BugBase/R_lib
RUN touch .readme.md

WORKDIR /mnt/external_tools/BugBase

COPY bugbase_env.r .
RUN Rscript bugbase_env.r

