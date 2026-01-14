#!/usr/bin/env bash

source "$(dirname "$0")/tnt-tg-bot/scripts/lib/customize.sh"
source "$(dirname "$0")/tnt-tg-bot/scripts/lib/tt-tools.sh"

# Bot rocks
./tnt-tg-bot/tnt-tg-bot.pre-build.sh

# github.com/uriid1/argp
install_luarocks "argp" "1.1-0"
