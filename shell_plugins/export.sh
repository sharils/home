#!/usr/bin/env sh

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

# https://support.apple.com/kb/HT208050.
export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLOR='auto' # ls

export EDITOR='vim -p'

export ERL_AFLAGS="-kernel shell_history enabled"

export GREP_OPTIONS='--color=auto'

export LESS='--RAW-CONTROL-CHARS --ignore-case --no-init --quit-if-one-screen'

export PAGER='less'

export PATH="$HOME/.cargo/bin:$PATH"
