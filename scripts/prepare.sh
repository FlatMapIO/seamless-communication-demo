#!/usr/bin/env bash
eval "$(pkgx --shellcode)"
env +python@3.11 +git

python -m venv .venv
PIP=".venv/bin/pip"
$PIP install --upgrade pip
$PIP install --no-cache-dir wheel torch torchaudio gradio
$PIP install --no-cache-dir --no-build-isolation fairseq2

echo ">> Install seamless_communication"
git clone --depth 1 https://github.com/facebookresearch/seamless_communication.git
cd seamless_communication
$PIP install .
cd ..

echo  ">> Install apex"
$PIP install -v --no-cache-dir \
  --no-build-isolation \
  --global-option="--cpp_ext" \
  --global-option="--cuda_ext" \
  --global-option="--deprecated_fused_adam" --global-option="--xentropy" \
  --global-option="--fast_multihead_attn" git+https://github.com/NVIDIA/apex
