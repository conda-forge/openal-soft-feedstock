#!/bin/bash

cmake ${CMAKE_ARGS} \
      -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib     \
      $SRC_DIR

make install
