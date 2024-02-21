#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

n() {
  path="${1:-hello_elixir}" && shift
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

  cat <<SH >.envrc
#!/usr/bin/env sh

export POSTGRES_HOST='db'
export POSTGRES_USER='$(mix run -e 'Application.get_env(:world, World.Repo)[:username] |> IO.write()')'
export POSTGRES_PASSWORD='$(mix run -e 'Application.get_env(:world, World.Repo)[:password] |> IO.write()')'
export POSTGRES_DB='$(mix run -e 'Application.get_env(:world, World.Repo)[:database] |> IO.write()')'
SH

  cat <<SH
cd $path
direnv allow
docker compose up db --detach
mix setup
docker compose down db
SH
}

n "$@"
