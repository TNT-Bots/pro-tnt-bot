#!/usr/bin/env bash

set -euo pipefail

echo
echo "------------------------"
echo "Install Rocks...        "
echo "------------------------"

# github.com/uriid1/argp
echo "Install: argp"
luarocks install --local \
  --tree=$PWD/.rocks \
  --lua-version 5.1 \
  argp
