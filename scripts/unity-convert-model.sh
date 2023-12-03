#!/usr/bin/env bash
eval "$(pkgx --shellcode)"

source .venv/bin/activate

python seamless_communication/ggml/ggml_convert.py -m models/seamlessM4T_v2_large.pt