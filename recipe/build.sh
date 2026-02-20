#!/bin/bash

if [[ "${target_platform}" == osx-* ]]; then
    # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

    # pugixml use CXX 20 module and need clang-scan-deps.
    # It's installed by the clang-tools package, but it doesn't have the right CMAKE_TOOLCHAIN_PREFIX.
    CMAKE_CUSTOM_ARGS="-DCMAKE_CXX_COMPILER_CLANG_SCAN_DEPS="clang-scan-deps""
fi

cmake -G "Ninja" \
      ${CMAKE_ARGS} ${CMAKE_CUSTOM_ARGS} \
      -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib     \
      $SRC_DIR

cmake --build . --config Release -- -j$CPU_COUNT
cmake --build . --config Release --target install
