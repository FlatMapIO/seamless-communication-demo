#!/usr/bin/env bash
eval "$(pkgx --shellcode)"

if [[ -z "$*" ]]; then
  ./bin/unity -h
else
  ./bin/unity "$@"
fi