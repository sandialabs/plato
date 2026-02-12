FROM ubuntu:24.04

# Copy Sandia certificates
ARG CERT_DIR=/usr/local/share/ca-certificates/
COPY --from=cee-gitlab.sandia.gov:4567/innersource/docker/snl-root-ca:latest /*.pem /*.crt ${CERT_DIR}
RUN cat ${CERT_DIR}/*.crt > ${CERT_DIR}/sandia-combined.crt
RUN cat ${CERT_DIR}/sandia-combined.crt >> /etc/ca-certificates.conf

# Proxy environment variables
ENV http_proxy="http://proxy.sandia.gov:80/" \
    https_proxy="http://proxy.sandia.gov:80/" \
    no_proxy="localhost,localnets,sandia.gov,127.0.0.1" \
    HTTP_PROXY="http://proxy.sandia.gov:80/" \
    HTTPS_PROXY="http://proxy.sandia.gov:80/" \
    NO_PROXY="localhost,localnets,sandia.gov,127.0.0.1"

# General system
RUN apt-get update
RUN apt-get install -y git \
                       git-lfs \
                       ca-certificates

RUN update-ca-certificates --fresh

# Python
RUN apt-get install -y python3-full \
                       python3-pip \
                       python3-pip-whl \
                       python3-yaml \
                       python3-setuptools \
                       python3-certifi

# gcc
RUN apt-get install -y gcc-14 g++-14 gfortran-14

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100 && \
    update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-14 100 && \
    update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-14 100

# clang
RUN apt-get install -y clang-18 clang-tidy-18

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-18 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-18 100 && \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-18 100

# Required for cubit, may be removed when updating to newer cubit versions
RUN apt-get install -y mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev

# Quality check tools
RUN apt-get install -y zip \
                       doxygen \
                       openjdk-25-jdk
ADD https://github.com/pmd/pmd/releases/download/pmd_releases%2F7.20.0/pmd-dist-7.20.0-bin.zip /pmd/
RUN unzip /pmd/pmd-dist-7.20.0-bin.zip -d /pmd/ && \
    rm /pmd/pmd-dist-7.20.0-bin.zip
