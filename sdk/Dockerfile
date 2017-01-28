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
  graphviz \
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
  libfftw3-dev \
  libflac-dev \
  libflac++-dev \
  libfontconfig1-dev \
  libgcrypt11-dev \
  libglu1-mesa-dev \
  libicu-dev \
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
  vim \
  wget && \
  apt-get -y clean

RUN mkdir -p /usr/src/DREAM3D_SDK/prefix-Release
WORKDIR /usr/src/DREAM3D_SDK

RUN wget http://download.qt.io/official_releases/qt/5.6/5.6.1/single/qt-everywhere-opensource-src-5.6.1.tar.gz && \
  tar -xzf qt-everywhere-opensource-src-5.6.1.tar.gz && \
  rm qt-everywhere-opensource-src-5.6.1.tar.gz && \
  cd qt-everywhere-opensource-src-5.6.1 && \
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

RUN wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.17/src/hdf5-1.8.17.tar.bz2 && \
  tar -xjf hdf5-1.8.17.tar.bz2 && \
  rm hdf5-1.8.17.tar.bz2 && \
  mkdir hdf5-Release-build && \
  cd hdf5-Release-build && \
  cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_CXX_FLAGS:STRING=-std=c++11 \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr/src/DREAM3D_SDK/prefix-Release/ \
    -G Ninja \
    ../hdf5-1.8.17/ && \
  ninja && \
  ninja install && \
  cd .. && rm -rf hdf5*

RUN git clone https://www.github.com/InsightSoftwareConsortium/ITK.git InsightToolkit && \
  cd InsightToolkit && \
  git checkout dbd0714865282679b2b812efc188af90acf8a54d && \
  cd .. && \
  mkdir InsightToolkit-build && \
  cd InsightToolkit-build && \
  cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_CXX_FLAGS:STRING=-std=c++11 \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DModule_ITKReview:BOOL=ON \
    -DModule_SCIFIO:BOOL=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DITK_USE_SYSTEM_HDF5:BOOL=ON \
    -DHDF5_DIR:FILEPATH=/usr/src/DREAM3D_SDK/prefix-Release/share/cmake \
    -DITK_USE_SYSTEM_HDF5:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr/src/DREAM3D_SDK/prefix-Release/ \
    -G Ninja \
    ../InsightToolkit/ && \
  ninja && \
  cd ..

ADD DREAM3D_SDK.cmake /usr/src/DREAM3D_SDK/
VOLUME /usr/src/DREAM3D_SDK
