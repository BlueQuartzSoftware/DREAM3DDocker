FROM dream3d/sdk:latest
MAINTAINER DREAM3D Community

RUN mkdir /usr/src/DREAM3D
WORKDIR /usr/src/DREAM3D

ENV DREAM3D_VERSION 81ab13acb74e2cf2bef1c7ddc7527668f985933a
RUN git clone https://github.com/dream3d/DREAM3D.git && \
  cd DREAM3D && \
  git checkout ${DREAM3D_VERSION}

# Move to the upstream "develop" branch after the Qt-5.6.0-Linux branch has been merged
ENV CMP_VERSION 52e3365a14174fb43259cba9ff4ebedf9c1ee1af
RUN git clone https://github.com/thewtex/CMP.git && \
  cd CMP && \
  git checkout ${CMP_VERSION}

ENV SIMPL_VERSION 94678388260b1b3bdc3bc14ae14e4c0254bcc8e8
RUN git clone https://github.com/BlueQuartzSoftware/SIMPL.git && \
  cd SIMPL && \
  git checkout ${SIMPL_VERSION}

ENV SIMPLView_VERSION 18df48075de921934dedac36869d37af5ee3d81d
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
