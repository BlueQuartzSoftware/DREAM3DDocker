FROM dream3d/sdk:latest
MAINTAINER DREAM3D Community

RUN mkdir /usr/src/DREAM3D
WORKDIR /usr/src/DREAM3D

ENV DREAM3D_VERSION 1de16865d7543727874ddb8a2e9897c7d8bdb348
RUN git clone https://github.com/BlueQuartzSoftware/DREAM3D.git && \
  cd DREAM3D && \
  git checkout ${DREAM3D_VERSION}

ENV CMP_VERSION 87547f0801533c9f347b9dddbf25f6e9d695a73b
RUN git clone https://github.com/BlueQuartzSoftware/CMP.git && \
  cd CMP && \
  git checkout ${CMP_VERSION}

ENV SIMPL_VERSION f7c9d0102b61d7443b61e0b444d7b2b4bf4e4089
RUN git clone https://github.com/BlueQuartzSoftware/SIMPL.git && \
  cd SIMPL && \
  git checkout ${SIMPL_VERSION}

ENV SIMPLView_VERSION 13965e798c23db741ee2724ce1186b17a767320a
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

