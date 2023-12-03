#!/usr/bin/env bash

eval "$(pkgx --shellcode)"
env +aria2c

aria2c -c -i ./scripts/data.aria2c.txt