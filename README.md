# Seamless communication Demo


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
./script/build-unity.sh
ls ./bin

./scripts/unity -h
```

Run unity.cpp

```shell
$bash ./scripts/unity -m models/seamlessM4T_v2_large.ggml

$unity ./assets/sample_input.mp3 to jpn

```

# TODO
- [ ] `FileNotFoundError: Shared library with base name 'fairseq2_cpp' not found in /workspaces/seamless-communication-demo/seamless_communication/ggml/build/examples/unity`
