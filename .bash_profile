#!/usr/bin/env sh

SHARILS_HOME=~/git/github.com/sharils/home

. $SHARILS_HOME/.bash_it_custom/plugins/export.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/gitignore.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/history.plugins.bash

. $SHARILS_HOME/.bash_it_custom/plugins/android-studio.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/direnv.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/fzf.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/gpg.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/iterm2.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/rust.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/starship.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/zoxide.plugins.bash

. $SHARILS_HOME/.bash_it_custom/plugins/dco.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/dk.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/home.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/kp.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/nx.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/wb.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/yarn.plugins.bash

. $SHARILS_HOME/.bash_it_custom/plugins/b.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/c.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/d.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/e.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/g.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/l.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/n.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/t.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/u.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/v.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/w.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/x.plugins.bash
. $SHARILS_HOME/.bash_it_custom/plugins/z.plugins.bash

##!/usr/bin/env bash
#
# # Path to the bash it configuration
# export BASH_IT="$HOME/.bash_it"
#
# # Lock and Load a custom theme file
# # location /.bash_it/themes/
# # export BASH_IT_THEME='bobby'
# # export BASH_IT_THEME="$HOME/.bash_it_custom/custom/themes/axin-custom.theme.bash"
# export BASH_IT_THEME=''
#
# # (Advanced): Change this to the name of your remote repo if you
# # cloned bash-it with a remote other than origin such as `bash-it`.
# # export BASH_IT_REMOTE='bash-it'
#
# # Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'
#
# # Don't check mail when opening terminal.
# unset MAILCHECK
#
# # Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'
#
# # Set this to the command you use for todo.txt-cli
# export TODO='todo.sh'
#
# # Set this to false to turn off version control status checking within the prompt for all themes
# export SCM_CHECK=true
#
# export SCM_GIT_SHOW_MINIMAL_INFO=true
#
# # Set Xterm/screen/Tmux title with only a short hostname.
# # Uncomment this (or set SHORT_HOSTNAME to something else),
# # Will otherwise fall back on $HOSTNAME.
# #export SHORT_HOSTNAME=$(hostname -s)
#
# # Set Xterm/screen/Tmux title with only a short username.
# # Uncomment this (or set SHORT_USER to something else),
# # Will otherwise fall back on $USER.
# #export SHORT_USER=${USER:0:8}
#
# # Set Xterm/screen/Tmux title with shortened command and directory.
# # Uncomment this to set.
# #export SHORT_TERM_LINE=true
#
# # Set vcprompt executable path for scm advance info in prompt (demula theme)
# # https://github.com/djl/vcprompt
# #export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt
#
# # (Advanced): Uncomment this to make Bash-it reload itself automatically
# # after enabling or disabling aliases, plugins, and completions.
# #export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
#
# # Uncomment this to make Bash-it create alias reload.
# #export BASH_IT_RELOAD_LEGACY=1
#
# # Load bashrc
# # shellcheck source=.bashrc
# source ~/.bashrc
#
# # Load Bash It
# # shellcheck source=.bash_it/bash_it.sh
# source "$BASH_IT"/bash_it.sh
#
# export LC_ALL=en_US.UTF-8
#
# # https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/
# export BASH_SILENCE_DEPRECATION_WARNING=1
#
# # https://stackoverflow.com/questions/9457233/unlimited-bash-history
# export HISTFILESIZE=123456        # increase history file size (default is 500)
# export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
