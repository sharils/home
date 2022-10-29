#!/usr/bin/env sh

rand="$(awk 'BEGIN { srand(); print int(rand()*32768) }')"

v() {
  if [ $# -eq 0 ]; then
    vim -S Session.vim
  fi

  cmd=$1
  shift

  case "$cmd" in
  R)
    vim README.md
    ;;

  c)
    vim "/tmp/c-$USER-$rand.c"
    ;;

  css)
    vim "/tmp/css-$USER-$rand.css"
    ;;

  csv)
    vim "/tmp/csv-$USER-$rand.csv"
    ;;

  d)
    vimdiff "$@"
    ;;

  dco)
    vim docker-compose.yml
    ;;

  dk)
    vim Dockerfile
    ;;

  eex)
    vim "/tmp/eex-$USER-$rand.eex"
    ;;

  erl)
    vim "/tmp/erl-$USER-$rand.erl"
    ;;

  ex)
    vim "/tmp/ex-$USER-$rand.ex"
    ;;

  exs)
    vim "/tmp/exs-$USER-$rand.exs"
    ;;

  gi)
    vim .gitignore
    ;;

  gql)
    vim "/tmp/gql-$USER-$rand.gql"
    ;;

  html)
    vim "/tmp/html-$USER-$rand.html"
    ;;

  java)
    vim "/tmp/java-$USER-$rand.java"
    ;;

  jq)
    vim "/tmp/jq-$USER-$rand.jq"
    ;;

  js)
    vim "/tmp/js-$USER-$rand.js"
    ;;

  json)
    vim "/tmp/json-$USER-$rand.json"
    ;;

  jsx)
    vim "/tmp/jsx-$USER-$rand.jsx"
    ;;

  lua)
    vim "/tmp/lua-$USER-$rand.lua"
    ;;

  md)
    vim "/tmp/md-$USER-$rand.md"
    ;;

  mdx)
    vim "/tmp/mdx-$USER-$rand.mdx"
    ;;

  mw)
    vim "/tmp/mw-$USER-$rand.mw"
    ;;

  pegjs)
    vim "/tmp/pegjs-$USER-$rand.pegjs"
    ;;

  php)
    vim "/tmp/php-$USER-$rand.php"
    ;;

  pj)
    vim package.json
    ;;

  py)
    vim "/tmp/py-$USER-$rand.py"
    ;;

  rc)
    vim ~/git/github.com/sharils/home/.vimrc
    ;;

  rs)
    vim "/tmp/rs-$USER-$rand.rs"
    ;;

  scss)
    vim "/tmp/scss-$USER-$rand.scss"
    ;;

  sh)
    vim "/tmp/sh-$USER-$rand.sh"
    ;;

  sql)
    vim "/tmp/sql-$USER-$rand.sql"
    ;;

  story)
    vim "/tmp/story-$USER-$rand.story"
    ;;

  t)
    vim "/tmp/$USER-$rand"
    ;;

  ts)
    vim "/tmp/ts-$USER-$rand.ts"
    ;;

  tsx)
    vim "/tmp/tsx-$USER-$rand.tsx"
    ;;

  txt)
    vim "/tmp/txt-$USER-$rand.txt"
    ;;

  wat)
    vim "/tmp/wat-$USER-$rand.wat"
    ;;

  xhtml)
    vim "/tmp/xhtml-$USER-$rand.xhtml"
    ;;

  yaml)
    vim "/tmp/yaml-$USER-$rand.yaml"
    ;;

  yml)
    vim "/tmp/yml-$USER-$rand.yml"
    ;;

  zep)
    vim "/tmp/zep-$USER-$rand.zep"
    ;;

  *)
    vim "$cmd" "$@"
    ;;

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
