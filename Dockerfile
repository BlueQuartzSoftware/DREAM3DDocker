FROM ubuntu:14.04
MAINTAINER DREAM3D Community

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  bison \
  build-essential \
  doxygen \
  flex \
  freeglut3-dev \
  git \
  gperf \
  gyp \
  libasound2-dev \
  libboost-dev \
  libbz2-dev \
  libcap-dev \
  libcups2-dev \
  libdrm-dev \
  libegl1-mesa-dev \
  libeigen3-dev \
  libevent-dev \
  libflac-dev \
  libflac++-dev \
  libfontconfig1-dev \
  libgcrypt11-dev \
  libglu1-mesa-dev \
  libicu-dev \
  libinsighttoolkit4-dev \
  libjpeg-dev \
  libjsoncpp-dev \
  libmng-dev \
  libnss3-dev \
  libpci-dev \
  libopusfile-dev \
  libopus-dev \
  libpng12-dev \
  libpulse-dev \
  libspeex-dev \
  libspeexdsp-dev \
  libsnappy-dev \
  libsrtp0-dev \
  libssl-dev \
  libtbb-dev \
  libtiff4-dev \
  libudev-dev \
  libx11-dev \
  libxcomposite-dev \
  libxcursor-dev \
  libxdamage-dev \
  libxi-dev \
  libxmu-dev \
  libxrandr-dev \
  libxss-dev \
  libxtst-dev \
  ninja-build \
  python-dev \
  ruby

WORKDIR /usr/src
RUN mkdir /usr/src/DREAM3D_SDK
