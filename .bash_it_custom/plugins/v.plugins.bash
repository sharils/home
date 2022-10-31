#!/usr/bin/env sh

random="$(awk 'BEGIN { srand(); print int(rand()*32768) }')"

v() {
  if [ $# -eq 0 ]; then
    if [ -s Session.vim ]; then
      vim -S Session.vim
    else
      vim +Obsession
    fi
    return
  fi

  cmd=$1
  shift

  case "$cmd" in

  R) vim README.md ;;
  c) vim "/tmp/c-$USER-$random.c" ;;
  css) vim "/tmp/css-$USER-$random.css" ;;
  csv) vim "/tmp/csv-$USER-$random.csv" ;;
  d) vimdiff "$@" ;;
  dco) vim docker-compose.yml ;;
  dk) vim Dockerfile ;;
  eex) vim "/tmp/eex-$USER-$random.eex" ;;
  erl) vim "/tmp/erl-$USER-$random.erl" ;;
  ex) vim "/tmp/ex-$USER-$random.ex" ;;
  exs) vim "/tmp/exs-$USER-$random.exs" ;;
  gi) vim .gitignore ;;
  gql) vim "/tmp/gql-$USER-$random.gql" ;;
  html) vim "/tmp/html-$USER-$random.html" ;;
  java) vim "/tmp/java-$USER-$random.java" ;;
  jq) vim "/tmp/jq-$USER-$random.jq" ;;
  js) vim "/tmp/js-$USER-$random.js" ;;
  json) vim "/tmp/json-$USER-$random.json" ;;
  jsx) vim "/tmp/jsx-$USER-$random.jsx" ;;
  lua) vim "/tmp/lua-$USER-$random.lua" ;;
  md) vim "/tmp/md-$USER-$random.md" ;;
  mdx) vim "/tmp/mdx-$USER-$random.mdx" ;;
  mw) vim "/tmp/mw-$USER-$random.mw" ;;
  pegjs) vim "/tmp/pegjs-$USER-$random.pegjs" ;;
  php) vim "/tmp/php-$USER-$random.php" ;;
  pj) vim package.json ;;
  py) vim "/tmp/py-$USER-$random.py" ;;
  rc) vim ~/git/github.com/sharils/home/.vimrc ;;
  rs) vim "/tmp/rs-$USER-$random.rs" ;;
  scss) vim "/tmp/scss-$USER-$random.scss" ;;
  sh) vim "/tmp/sh-$USER-$random.sh" ;;
  sql) vim "/tmp/sql-$USER-$random.sql" ;;
  story) vim "/tmp/story-$USER-$random.story" ;;
  t) vim "/tmp/$USER-$random" ;;
  ts) vim "/tmp/ts-$USER-$random.ts" ;;
  tsx) vim "/tmp/tsx-$USER-$random.tsx" ;;
  txt) vim "/tmp/txt-$USER-$random.txt" ;;
  wat) vim "/tmp/wat-$USER-$random.wat" ;;
  xhtml) vim "/tmp/xhtml-$USER-$random.xhtml" ;;
  yaml) vim "/tmp/yaml-$USER-$random.yaml" ;;
  yml) vim "/tmp/yml-$USER-$random.yml" ;;
  zep) vim "/tmp/zep-$USER-$random.zep" ;;
  *) vim "$cmd" "$@" ;;

  esac
}

# alias vpc='vim +PlugClean'
# alias vpi='vim +PlugInstall'
# alias vps="vim +'PlugSnapshot! ~/.vim/snapshot.vim'"
# alias vpu='vim +PlugUpdate'

# alias vbh='vim ~/.bash_history'
# alias vgie='vim .git/info/exclude'
# alias vicss='vim index.css'
# alias vihtml='vim index.html'
# alias vijs='vim index.js'
# alias vijsx='vim index.jsx'
# alias vits='vim index.ts'
# alias vmf='vim Makefile'
# alias vnc='vim next.config.js'
# alias vsj='vim server.js'
# alias vtigrc='vim ~/.tigrc'
# alias vtorrc='vim ~/Library/Application\ Support/TorBrowser-Data/Tor/torrc'
