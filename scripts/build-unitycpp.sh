#!/usr/bin/env bash

eval "$(pkgx --shellcode)"

env +python@3.11 +cmake +git +github.com/libsndfile/libsndfile


if [[ ! -d seamless_communication ]]; then
  git clone --depth 1 https://github.com/facebookresearch/seamless_communication.git
  else
  git -C seamless_communication pull --ff
fi

cd seamless_communication/ggml

test -d build || mkdir build; cd build
echo $(pwd)

cmake -DGGML_CUBLAS=ON \
    -DBUILD_SHARED_LIBS=On \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_CXX_FLAGS="-g2 -fno-omit-frame-pointer" \
    ..

make -j4 unity # Interactive Console
