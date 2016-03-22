set(CMAKE_CXX_FLAGS "-Wmost -Wno-four-char-constants -Wno-unknown-pragmas -std=c++11")
set(CMAKE_BUILD_TYPE Release CACHE STRING "CMake build type")
set(BUILD_SHARED_LIBS ON CACHE BOOL "Build shared libraries")
set(DREAM3D_SDK_ROOT "/usr/src/DREAM3D_SDK")
set(DREAM3D_DATA_DIR "${DREAM3D_SDK_ROOT}/DREAM3D_Data" CACHE PATH "DREAM3D Data")
set(Qt5_DIR "${DREAM3D_SDK_ROOT}/prefix-${CMAKE_BUILD_TYPE}/lib/cmake/Qt5" CACHE PATH "")
set(QWT_INSTALL "${DREAM3D_SDK_ROOT}/prefix-${CMAKE_BUILD_TYPE}" CACHE PATH "")
set(EIGEN_INSTALL "/usr" CACHE PATH "")
set(BOOST_ROOT "/usr" CACHE PATH "")
set(SIMPL_USE_MULTITHREADED_ALGOS ON CACHE BOOL "")
set(TBB_INSTALL_DIR "/usr" CACHE PATH "")
set(TBB_ARCH_TYPE "intel64" CACHE STRING "")
set(HDF5_INSTALL "${DREAM3D_SDK_ROOT}/prefix-${CMAKE_BUILD_TYPE}" CACHE PATH "")
set(HDF5_DIR "${DREAM3D_SDK_ROOT}/prefix-${CMAKE_BUILD_TYPE}/share/cmake" CACHE PATH "")
