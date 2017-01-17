FROM dream3d/sdk-ubuntu-16.04:latest
MAINTAINER DREAM3D Community

RUN mkdir /usr/src/DREAM3D
WORKDIR /usr/src/DREAM3D

ENV DREAM3D_VERSION 4401c072fca483c9011db2aca096b8a44f0c6727
RUN git clone https://github.com/BlueQuartzSoftware/DREAM3D.git && \
  cd DREAM3D && \
  git checkout ${DREAM3D_VERSION}

ENV CMP_VERSION 9e385c6248bb3cd51280131166396e8e4757cbfd
RUN git clone https://github.com/BlueQuartzSoftware/CMP.git && \
  cd CMP && \
  git checkout ${CMP_VERSION}

ENV SIMPL_VERSION 5c3e35d80d8ed9bbd66384c89c439d224e0e753d
RUN git clone https://github.com/BlueQuartzSoftware/SIMPL.git && \
  cd SIMPL && \
  git checkout ${SIMPL_VERSION}

ENV SIMPLView_VERSION 8f2eab7b72c81abed548cfa9267342c218914de8
RUN git clone https://github.com/BlueQuartzSoftware/SIMPLView.git && \
  cd SIMPLView && \
  git checkout ${SIMPLView_VERSION}

ENV CXXFLAGS="-std=c++11 -Wall"
ENV CC="/usr/bin/clang"
ENV CXX="/usr/bin/clang++"

RUN mkdir DREAM3D-build-Release && \
  cd DREAM3D-build-Release && \
  cmake -C /usr/src/DREAM3D_SDK/DREAM3D_SDK.cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DTBB_ARCH_PLATFORM:PATH=x86_64-linux-gnu \
    ../DREAM3D && \
  ninja

VOLUME /usr/src/DREAM3D

# The app to run in the x11vnc server
ENV APP /usr/src/DREAM3D/DREAM3D-build-Release/Bin/DREAM3D

