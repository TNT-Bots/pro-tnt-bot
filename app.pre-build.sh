#!/usr/bin/env bash

ROOT_DIR="$(
  cd "$(dirname "$0")" && pwd
)"

source "${ROOT_DIR}/tnt-tg-bot/bin/lib/tools.sh"

#
# Bot rocks
#
bash "$ROOT_DIR/tnt-tg-bot/tnt-tg-bot.pre-build.sh"

#
# App rocks
#
# github.com/uriid1/argp
tools::luarocks_install "argp" "1.1-0"
