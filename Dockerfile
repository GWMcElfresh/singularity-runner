FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config \
    git-all \
    alien
    
RUN alien -d singularity-3.8.0-1.el8.x86_64.rpm && \
    apt-get install ./singularity_3.8.0-2_amd64.deb
#RUN curl -L https://dl.google.com/go/go1.17.5.linux-amd64.tar.gz -o go1.17.5.linux-amd64.tar.gz
#RUN tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
#RUN rm go1.17.5.linux-amd64.tar.gz
#RUN chmod -R 777 /cmdstan/*
#RUN R -e "library(cmdstanr);cmdstanr::set_cmdstan_path(path = list.dirs('/cmdstan')[[2]]);cpp_options <- list('CXX' = 'clang++','CXXFLAGS+'= '-march=native',PRECOMPILED_HEADERS = FALSE);rebuild_cmdstan()"
#RUN git clone https://github.com/stan-dev/cmdstan.git -b v2.32.2 /home/cmdstan.github --recursive 
