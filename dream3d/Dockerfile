FROM dream3d/sdk:latest
MAINTAINER DREAM3D Community

ENV DREAM3D_VERSION 81ab13acb74e2cf2bef1c7ddc7527668f985933a
RUN git clone https://github.com/dream3d/DREAM3D.git && \
  cd DREAM3D && \
  git checkout ${DREAM3D_VERSION}
