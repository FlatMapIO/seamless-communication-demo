#!/usr/bin/env bash

eval "$(pkgx --shellcode)"

env +python@3.11 +cmake +git +github.com/libsndfile/libsndfile

ROOT=$(pwd)

if [[ ! -d seamless_communication ]]; then
  echo ">> seamless_communication not found. Cloning..."
  git clone --depth 1 https://github.com/facebookresearch/seamless_communication.git
  else
  echo ">> seamless_communication found. Pulling..."
  git -C seamless_communication pull --ff
fi

cd seamless_communication/ggml

test -d build || mkdir build; cd build
echo $(pwd)


BLAS="-DGGML_OPENBLAS=ON"
if [[ -d /usr/local/cuda/ ]]; then
  echo ">> Found CUDA, enabling cuBLAS"
  BLAS="-DGGML_CUBLAS=ON"
fi

echo ">> Build unity.cpp with [$BLAS]"

cmake $BLAS \
    -DBUILD_SHARED_LIBS=On \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_CXX_FLAGS="-g2 -fno-omit-frame-pointer" \
    ..

make -j4 unity # Interactive Console


cd $ROOT

test -d bin || ln -s seamless_communication/ggml/build/bin .

echo ">> Done."