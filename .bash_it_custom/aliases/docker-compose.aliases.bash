#!/usr/bin/env bash

alias dcob='docker-compose build'
alias dcod='docker-compose down'
alias dcodv='docker-compose down --volumes'
alias dcoe='docker-compose exec'
alias dcops='docker-compose ps'
alias dcorr='docker-compose run --rm --volume $PWD:$PWD --workdir $PWD'
alias dcoru='docker-compose run --rm --user $(id -u):$(id -g) --volume $PWD:$PWD --workdir $PWD'
alias dcou='docker-compose up'
alias dcoub='docker-compose up --build'
alias dcoud='docker-compose up --detach'
