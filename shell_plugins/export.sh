#!/usr/bin/env sh

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

# https://support.apple.com/kb/HT208050.
export BASH_SILENCE_DEPRECATION_WARNING=1

export BROWSER='lynx'

export CLICOLOR='auto' # ls

export EDITOR='vim'

export ERL_AFLAGS="-kernel shell_history enabled"

export GREP_OPTIONS='--color=auto'

export LYNX_CFG="$SHARILS_HOME/.lynx/lynx.cfg"

export LESS='--RAW-CONTROL-CHARS --ignore-case --no-init --quit-at-eof'

export PAGER='less --quit-if-one-screen'

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.deno/bin:$PATH"

# Created by `pipx` on 2023-09-25 13:18:26
export PATH="$PATH:$HOME/.local/bin"

export PATH="$HOMEBREW_PREFIX/opt/python@3.12/libexec/bin:$PATH"

export RIPGREP_CONFIG_PATH="$SHARILS_HOME/.ripgreprc"

export TLDR_AUTO_UPDATE_DISABLED='1'
