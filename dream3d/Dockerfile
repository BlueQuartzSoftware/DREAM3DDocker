FROM dream3d/sdk-ubuntu-16.04:latest
MAINTAINER DREAM3D Community

RUN mkdir /usr/src/DREAM3D
WORKDIR /usr/src/DREAM3D

ENV DREAM3D_VERSION b56ab529e19c4997019d11e193c66e6de48be38d
RUN git clone https://github.com/BlueQuartzSoftware/DREAM3D.git && \
  cd DREAM3D && \
  git checkout ${DREAM3D_VERSION}

ENV CMP_VERSION 017620d81f2153a123ab376ddf14edef1aa74843
RUN git clone https://github.com/BlueQuartzSoftware/CMP.git && \
  cd CMP && \
  git checkout ${CMP_VERSION}

ENV SIMPL_VERSION 1e796d25bd2c6526d3b618dc85459f16e60033f0
RUN git clone https://github.com/BlueQuartzSoftware/SIMPL.git && \
  cd SIMPL && \
  git checkout ${SIMPL_VERSION}

ENV SIMPLView_VERSION 4532c23df1fedd84d2edfe46d809b9b401c55e2f
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

