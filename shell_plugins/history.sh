#!/usr/bin/env bash

# add this configuration to ~/.bashrc
# export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace:erasedups:autoshare
export HISTFILESIZE=100000
export HISTSIZE=100000
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
