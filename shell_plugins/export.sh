#!/usr/bin/env sh

# dependency stands out
export PAGER='less'

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

# https://support.apple.com/kb/HT208050.
export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLOR='auto' # ls

export EDITOR='vim'

export ERL_AFLAGS="-kernel shell_history enabled"

export GIT_PAGER="$PAGER --quit-if-one-screen"

export GLAB_PAGER="$PAGER --quit-if-one-screen"

export GREP_OPTIONS='--color=auto'

export LANG='en_US.UTF-8'

export LYNX_CFG="$SHARILS_HOME/.lynx/lynx.cfg"

export MANPAGER="$PAGER --quit-if-one-screen"

export LESS='--RAW-CONTROL-CHARS --ignore-case --no-init'

export PATH="$HOME/.cargo/bin:$PATH"

export RIPGREP_CONFIG_PATH="$SHARILS_HOME/.ripgreprc"
