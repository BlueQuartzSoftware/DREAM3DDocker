FROM dream3d/sdk:latest
MAINTAINER DREAM3D Community

RUN mkdir /usr/src/DREAM3D
WORKDIR /usr/src/DREAM3D

ENV DREAM3D_VERSION 8e9eabe01ffe8765298f2e5584a854646f338c9d
RUN git clone https://github.com/BlueQuartzSoftware/DREAM3D.git && \
  cd DREAM3D && \
  git checkout ${DREAM3D_VERSION}

ENV CMP_VERSION 5ec851ab3e9724c27fd4d3ad11c00e53d86c558b
RUN git clone https://github.com/BlueQuartzSoftware/CMP.git && \
  cd CMP && \
  git checkout ${CMP_VERSION}

ENV SIMPL_VERSION 1d31b3f836fe8279d342381229b7318dcdf08a66
RUN git clone https://github.com/BlueQuartzSoftware/SIMPL.git && \
  cd SIMPL && \
  git checkout ${SIMPL_VERSION}

ENV SIMPLView_VERSION 0060629be8298d3e0248757c110cce460f1962d8
RUN git clone https://github.com/BlueQuartzSoftware/SIMPLView.git && \
  cd SIMPLView && \
  git checkout ${SIMPLView_VERSION}

ENV CXXFLAGS="-std=c++11"

RUN mkdir DREAM3D-build-Release && \
  cd DREAM3D-build-Release && \
  cmake -C /usr/src/DREAM3D_SDK/DREAM3D_SDK.cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    ../DREAM3D && \
  ninja

VOLUME /usr/src/DREAM3D

# The app to run in the x11vnc server
ENV APP /usr/src/DREAM3D/DREAM3D-build-Release/Bin/DREAM3D

