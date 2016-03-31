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
  libjasper-dev \
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

RUN wget --content-disposition https://sourceforge.net/projects/qwt/files/qwt/6.1.2/qwt-6.1.2.tar.bz2/download && \
  tar -xjf qwt-6.1.2.tar.bz2 && \
  rm qwt-6.1.2.tar.bz2 && \
  cd qwt-6.1.2 && \
  sed -i 's%/usr/local/qwt-$$QWT_VERSION%/usr/src/DREAM3D_SDK/prefix-Release%' qwtconfig.pri && \
  /usr/src/DREAM3D_SDK/prefix-Release/bin/qmake qwt.pro && \
  make -j$(nproc) && \
  make install && \
  cd .. && rm -rf qwt*

RUN wget https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.15-patch1/src/hdf5-1.8.15-patch1.tar.bz2 && \
  tar -xjf hdf5-1.8.15-patch1.tar.bz2 && \
  rm hdf5-1.8.15-patch1.tar.bz2 && \
  mkdir hdf5-Release-build && \
  cd hdf5-Release-build && \
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS=-std=c++11 \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr/src/DREAM3D_SDK/prefix-Release/ \
    -G Ninja \
    ../hdf5-1.8.15-patch1/ && \
  ninja && \
  ninja install && \
  cd .. && rm -rf hdf5*

RUN wget --content-disposition https://sourceforge.net/projects/itk/files/itk/4.9/InsightToolkit-4.9.0.tar.xz/download && \
  tar -xJf InsightToolkit-4.9.0.tar.xz && \
  mkdir InsightToolkit-build && \
  cd InsightToolkit-build && \
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS=-std=c++11 \
    -DBUILD_SHARED_LIBS=ON \
    -DModule_ITKReview=ON \
    -DBUILD_TESTING=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DHDF5_DIR=/usr/src/DREAM3D_SDK/prefix-Release/share/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/src/DREAM3D_SDK/prefix-Release/ \
    -G Ninja \
    ../InsightToolkit-4.9.0/ && \
  ninja && \
  ninja install && \
  cd .. && rm -rf InsightToolkit*

ADD DREAM3D_SDK.cmake /usr/src/DREAM3D_SDK/
VOLUME /usr/src/DREAM3D_SDK
