#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

pymdown -s ../pymdown.yml -p ../wiki/Extensions.md