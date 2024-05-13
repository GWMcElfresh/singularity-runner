FROM ghcr.io/apptainer/apptainer:latest

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
    wget 

RUN mkdir /GW_Python && \
  cd /GW_Python && \
  wget http://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz && \
  tar -zxvf Python-3.8.10.tgz && \
  cd Python-3.8.10 && \
  ./configure --prefix=/GW_Python && \ 
  cd /GW_Python/Python-3.8.10 && \
  make && \
  make install && \
  /GW_Python/bin/pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
  /GW_Python/bin/pip3 install pykan && \
  /GW_Python/bin/pip3 install onnxruntime && \
  chmod -R 777 /GW_Python

#RUN wget https://dl.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/s/singularity-3.8.0-1.el8.x86_64.rpm && \
#    alien -d singularity-3.8.0-1.el8.x86_64.rpm && \
#    apt-get install ./singularity_3.8.0-2_amd64.deb
#RUN curl -L https://dl.google.com/go/go1.17.5.linux-amd64.tar.gz -o go1.17.5.linux-amd64.tar.gz
#RUN tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
#RUN rm go1.17.5.linux-amd64.tar.gz
#RUN chmod -R 777 /cmdstan/*
#RUN R -e "library(cmdstanr);cmdstanr::set_cmdstan_path(path = list.dirs('/cmdstan')[[2]]);cpp_options <- list('CXX' = 'clang++','CXXFLAGS+'= '-march=native',PRECOMPILED_HEADERS = FALSE);rebuild_cmdstan()"
#RUN git clone https://github.com/stan-dev/cmdstan.git -b v2.32.2 /home/cmdstan.github --recursive 
