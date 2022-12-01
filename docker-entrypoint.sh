#!/usr/bin/env sh
export XDG_CONFIG_HOME=/root/.config
export XDG_DATA_HOME=/root/.local/share
export XDG_STATE_HOME=/root/.local/state
export XDG_RUNTIME_DIR=/root/
export XDG_CACHE_HOME=/root/

nvim $*
