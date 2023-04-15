#!/usr/bin/env sh

ap() {
  : "${X_AP_HOST:?}"
  : "${X_AP_USERNAME:?}"
  : "${X_AP_PASSWORD:?}"
  referer="Referer: $X_AP_HOST"
  user_agent='User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/110.0'
  x_requested_with='X-Requested-With: XMLHttpRequest'

  session_token="$(curl --silent --cookie-jar - --output /dev/null "$X_AP_HOST/common_page/login.html" -H "$user_agent" | grep -v '^#' | cut -f7 | tr -d '\n')"
  session_token="$(curl --silent --cookie-jar - --output /dev/null "$X_AP_HOST/xml/setter.xml" -H "$user_agent" -H "$x_requested_with" -H "$referer" -H "Cookie: session_token=$session_token" --data-raw "token=$session_token&fun=15&Username=$X_AP_USERNAME&Password=$X_AP_PASSWORD" | grep -v '^#' | cut -f7 | tr -d '\n')"
  curl "$X_AP_HOST/xml/setter.xml" -X POST -H "$user_agent" -H "$x_requested_with" -H "$referer" -H "Cookie: session_token=$session_token" --data-raw "token=$session_token&fun=8"
}

ap "$@"
