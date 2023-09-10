#!/usr/bin/env sh

h_wc() {
  (
    cd "$SHARILS_HOME/shell_plugins" &&
      # see ../../.bash_profile
      find -- * -type f \
        ! -name brew.sh \
        ! -name asdf.sh \
        ! -name bat.sh \
        ! -name direnv.sh \
        ! -name fzf.sh \
        ! -name gpg.sh \
        ! -name iterm2.sh \
        ! -name starship.sh \
        ! -name todo.sh.sh \
        ! -name zoxide.sh \
        ! -name alias.sh \
        ! -name export.sh \
        ! -name gitignore.sh \
        ! -name history.sh \
        -exec wc -l {} \;
  ) |
    sed 's/\.sh$//;s#/# #g' |
    sort -k 1 |
    column
}

h_wc "$@"
