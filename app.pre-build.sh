#!/usr/bin/env bash

ROOT_DIR="$(
  cd "$(dirname "$0")" && pwd
)"

source "${ROOT_DIR}/tnt-tg-bot/bin/lib/tools.sh"

#
# Bot rocks
#
bash "$ROOT_DIR/tnt-tg-bot/tnt-tg-bot.pre-build.sh"
