#!/usr/bin/env sh

p() {
  case "$1" in
  g)
    shift
    case "$1" in
    a) shift && mix phx.gen.auth "$@" ;;
    e) shift && mix phx.gen.embedded "$@" ;;
    h) shift && mix phx.gen.html "$@" ;;
    j) shift && mix phx.gen.json "$@" ;;
    l) shift && mix phx.gen.live "$@" ;;
    n) shift && mix phx.gen.notifier "$@" ;;
    p) shift && mix phx.gen.presence "$@" ;;
    r) shift && mix phx.gen.release "$@" ;;
    schema) shift && mix phx.gen.schema "$@" ;;
    *) mix phx.gen "$@" ;;
    esac
    ;;
  i) shift && iex -S mix phx.server "$@" ;;
  n)
    shift
    path="${1:-hello_world}" && shift
    mix phx.new "$path" "$@" --install
    cd "$path" || return $?

    cat <<'YAML' >docker-compose.yml
# https://docs.docker.com/compose/compose-file/compose-file-v3/
version: "3.8"
services:
  db:
    # https://hub.docker.com/_/postgres
    image: postgres:15.2-alpine3.17
    restart: always
    environment:
      POSTGRES_USER:
      POSTGRES_PASSWORD:
      POSTGRES_DB:
    ports:
      - 5432:5432
    profiles:
      - psql
YAML

    cat <<YAML >.envrc
#!/usr/bin/env sh

export POSTGRES_USER='postgres'
export POSTGRES_PASSWORD='postgres'
export POSTGRES_DB='${path}_dev'
YAML

    cat <<SH
cd $path
direnv allow
docker compose --profile db start
mix ecto.create
docker compose --profile db stop
SH
    ;;
  s) shift && mix phx.server "$@" ;;
  v) shift && mix phx.new --version "$@" ;;
  esac
}

p "$@"
