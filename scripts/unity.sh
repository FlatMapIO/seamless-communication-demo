#!/usr/bin/env bash
eval "$(pkgx --shellcode)"
env +python@3.11 +github.com/libsndfile/libsndfile

if [[ -z "$*" ]]; then
  ./bin/unity -h
else
  ./bin/unity "$@"
fi