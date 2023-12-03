# Seamless communication Demo

> Fork from https://colab.research.google.com/github/camenduru/seamless-m4t-colab/blob/main/seamless_expressive_v2_colab.ipynb#scrollTo=VjYy0F2gZIPR

# Setup

Downlaod models and assets

```shell
./scrips/download.sh
```

Open . in devcontainer


# Run demo

Install dependencies
```shell
./scripts/prepare.sh
```

Run demo
```shell
./scripts/run-expressive.sh
```


# unity.cpp

Build unity.cpp CUDA
```shell
./script/build-unitycpp.sh
env +github.com/libsndfile/libsndfile
./bin/unity -h
```

Run unity.cpp

```shell
./bin/unity -m models/seamlessM4T_v2_large.pt --text
```

# TODO
- [ ] `FileNotFoundError: Shared library with base name 'fairseq2_cpp' not found in /workspaces/seamless-communication-demo/seamless_communication/ggml/build/examples/unity`
