#!/usr/bin/env bash

eval "$(pkgx --shellcode)"

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
    -DGGML_BUILD_EXAMPLES=ON \
    -DBUILD_SHARED_LIBS=On \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_CXX_FLAGS="-g2 -fno-omit-frame-pointer" \
    ..
cmake --build .


cd $ROOT

test -d bin || ln -s seamless_communication/ggml/build/bin .

echo ">> Done."