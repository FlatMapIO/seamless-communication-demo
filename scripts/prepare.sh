#!/usr/bin/env bash
eval "$(pkgx --shellcode)"
env +python@3.11

python -m venv .venv
source .venv/bin/activate

pip install git+https://github.com/facebookresearch/seamless_communication.git
pip install fairseq2 gradio
