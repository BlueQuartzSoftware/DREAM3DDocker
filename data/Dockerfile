FROM debian:8
MAINTAINER DREAM3D Community

RUN mkdir -p /usr/src/DREAM3D_Data/Data/JSONFilters
ADD DREAM3D_Data/EbsdTestFiles /usr/src/DREAM3D_Data/EbsdTestFiles
ADD DREAM3D_Data/Data/Image /usr/src/DREAM3D_Data/Data/Image
ADD DREAM3D_Data/Data/Input /usr/src/DREAM3D_Data/Data/Input
ADD DREAM3D_Data/Data/Output /usr/src/DREAM3D_Data/Data/Output
ADD DREAM3D_Data/Data/JSONFilters/Input /usr/src/DREAM3D_Data/Data/JSONFilters/Input
ADD DREAM3D_Data/Data/JSONFilters/Baseline /usr/src/DREAM3D_Data/Data/JSONFilters/Baseline
VOLUME /usr/src/DREAM3D_Data

# This is to be used as a Docker Data Volume Container
# Create with
#   docker create --name dream3d-data dream3d/data
CMD /bin/true
