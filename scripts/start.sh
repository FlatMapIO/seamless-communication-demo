#!/usr/bin/env bash
eval "$(pkgx --shellcode)"
env +ffprobe

.venv/bin/python app.py