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
    wget \
    libbz2-dev \
    zlib1g-dev \
    python3-dev \
    python3-pip \
    libffi-dev && \
    pip3 --no-cache-dir --break-system-packages install  --no-cache-dir install numpy scipy scikit-learn matplotlib tqdm sympy setuptools pandas pyyaml && \
    pip3 --no-cache-dir --break-system-packages install torch torchvision torchaudio && \
    pip3 --no-cache-dir --break-system-packages install git+https://github.com/KindXiaoming/pykan.git && \
    mkdir /GW_Python && \
    cd /GW_Python && \
    wget http://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz && \
    tar -zxvf Python-3.8.10.tgz && \
    cd Python-3.8.10 && \
    ./configure --prefix=/GW_Python && \ 
    cd /GW_Python/Python-3.8.10 && \
    make && \
    make install && \
    /GW_Python/bin/pip3 --no-cache-dir install numpy scipy scikit-learn matplotlib tqdm sympy setuptools pandas pyyaml && \
    /GW_Python/bin/pip3 --no-cache-dir install torch torchvision torchaudio && \
    /GW_Python/bin/pip3 --no-cache-dir install git+https://github.com/KindXiaoming/pykan.git && \
    /GW_Python/bin/pip3 --no-cache-dir install onnxruntime && \
    /GW_Python/bin/pip3 --no-cache-dir install dill && \
    chmod -R 777 /GW_Python

ENV NUMBA_CACHE_DIR=/work/numba_cache
ENV MPLCONFIGDIR=/work/mpl_cache


#RUN wget https://dl.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/s/singularity-3.8.0-1.el8.x86_64.rpm && \
#    alien -d singularity-3.8.0-1.el8.x86_64.rpm && \
#    apt-get install ./singularity_3.8.0-2_amd64.deb
#RUN curl -L https://dl.google.com/go/go1.17.5.linux-amd64.tar.gz -o go1.17.5.linux-amd64.tar.gz
#RUN tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
#RUN rm go1.17.5.linux-amd64.tar.gz
#RUN chmod -R 777 /cmdstan/*
#RUN R -e "library(cmdstanr);cmdstanr::set_cmdstan_path(path = list.dirs('/cmdstan')[[2]]);cpp_options <- list('CXX' = 'clang++','CXXFLAGS+'= '-march=native',PRECOMPILED_HEADERS = FALSE);rebuild_cmdstan()"
#RUN git clone https://github.com/stan-dev/cmdstan.git -b v2.32.2 /home/cmdstan.github --recursive 
