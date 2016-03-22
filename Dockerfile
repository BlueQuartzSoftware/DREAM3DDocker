FROM thewtex/opengl:latest
MAINTAINER DREAM3D Community

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  bison \
  build-essential \
  ca-certificates \
  curl \
  doxygen \
  flex \
  freeglut3-dev \
  git \
  gperf \
  gyp \
  libasound2-dev \
  libboost-dev \
  libbz2-dev \
  libcurl4-openssl-dev \
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
  libncurses5-dev \
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
  libtiff5-dev \
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
  ruby \
  wget

WORKDIR /usr/src
RUN mkdir -p /usr/src/DREAM3D_SDK/prefix-Release

RUN git clone git://cmake.org/cmake.git CMake && \
  cd CMake && \
  git checkout v3.5.0 && \
  cd .. && mkdir CMake-build && cd CMake-build && \
  /usr/src/CMake/bootstrap \
    --parallel=$(nproc) \
    --prefix=/usr && \
  make -j$(nproc) && \
  ./bin/cmake -DCMAKE_USE_SYSTEM_CURL:BOOL=ON \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_USE_OPENSSL:BOOL=ON . && \
  make install && \
  cd .. && \
  rm -rf CMake*

RUN wget http://download.qt.io/official_releases/qt/5.6/5.6.0/single/qt-everywhere-opensource-src-5.6.0.tar.gz && \
  tar -xzf qt-everywhere-opensource-src-5.6.0.tar.gz && \
  rm qt-everywhere-opensource-src-5.6.0.tar.gz && \
  cd qt-everywhere-opensource-src-5.6.0 && \
  ./configure \
    -opensource -confirm-license \
    -prefix /usr/src/DREAM3D_SDK/prefix-Release \
    -no-compile-examples \
    -icu -openssl -qt-xcb -opengl -gui -widgets \
    -release && \
  make -j$(nproc) && \
  make install && \
  cd .. && rm -rf qt-everywhere-opensource*

