FROM dream3d/sdk:latest
MAINTAINER DREAM3D Community

ENV DREAM3D_VERSION 81ab13acb74e2cf2bef1c7ddc7527668f985933a
RUN git clone https://github.com/dream3d/DREAM3D.git && \
  cd DREAM3D && \
  git checkout ${DREAM3D_VERSION}

# Move to the upstream "develop" branch after the Qt-5.6.0-Linux branch has been merged
ENV CMP_VERSION 52e3365a14174fb43259cba9ff4ebedf9c1ee1af
RUN git clone https://github.com/thewtex/CMP.git && \
  cd CMP && \
  git checkout ${CMP_VERSION}

ENV CXXFLAGS="-std=c++11"

RUN mkdir DREAM3D-build-Release && \
  cd DREAM3D-build-Release && \
  cmake -C /usr/src/DREAM3D_SDK/DREAM3D_SDK.cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    ../DREAM3D && \
  ninja
