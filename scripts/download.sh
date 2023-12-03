#!/usr/bin/env bash
eval "$(pkgx --shellcode)"

aria2c -c -i ./scripts/data.aria2c.txt