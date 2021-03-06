#!/bin/bash

# This script bundles up all files into a pip package, including the
# various versions of the .so files.

set -e
set -x

if [[ -z ${1} ]]; then
  echo "No input directory provided"
  exit 1
fi
TMP=${1}

if [[ -z ${2} ]]; then
  echo "No output directory provided"
  exit 1
fi
OUT=${2}

OS_NAME="$(uname -s | tr A-Z a-z)"

if [[ $OS_NAME == "darwin" ||  $OS_NAME == "linux" ]]; then
  pushd ${TMP}
  python setup.py bdist_wheel > /dev/null
  popd
  python -m twine check ${TMP}/dist/*.whl
  cp ${TMP}/dist/*.whl ${OUT}

else
  echo "Don't know how to bundle package for '$OS_NAME'"
  exit 1
fi
