#!/bin/sh

#
# Make sure we are in the directory containing this script before running the Shakefile.
# This way we can safely keep all the paths relative to the build directory---see Paths.
#
BUILD_DIR=`dirname $0`
cd ${BUILD_DIR}

runhaskell Shakefile "$@"
