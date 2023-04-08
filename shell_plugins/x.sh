#!/usr/bin/env sh

x() {
  cmd="$1"
  shift

  case "$cmd" in

  +) chmod -vv +x "$@" ;;

  -) chmod -vv -x "$@" ;;

  8601) x b 'https://en.wikipedia.org/wiki/ISO_8601' ;;

  ai) # https://www.explainthis.io/zh-hant/chatgpt
    if [ $# -eq 0 ]; then
      openai repl
      return
    fi
    case "$1" in

    add-type-annotations-for-this-python-code)
      shift && (
        echo 'Add type annotations for this Python code'
        cat "$@"
      ) | openai complete -
      return
      ;;

    fix-mypy-warnings-in-this-python-code)
      shift && (
        echo 'Fix mypy warnings in this Python code'
        cat "$@"
        mypy "$@"
      ) | openai complete -
      return
      ;;

    rewrite-these-tests-to-use-pytest-parametrized)
      shift && (
        echo 'Rewrite these tests to use pytest.parametrized'
        cat "$@"
      ) | openai complete -
      return
      ;;

    write-python-function-to-calculate-fibonacci-numbers)
      shift && (
        echo 'Write Python function to calculate Fibonacci numbers'
      ) | openai complete -
      return
      ;;

    write-unit-tests-for-this-python-module-named-fib)
      shift && (
        printf 'Write unit tests for this Python module named "fib":\n'
        cat "$@"
      ) | openai complete -
      return
      ;;

    # https://www.facebook.com/photo/?fbid=112335851759941&set=pcb.112341338426059
    crafting-business-canvas-models) shift && set -- "Generate a business canvas model for ${*:-an agriculture tech product that helps farmers increase their crop yield.}" ;;

    # https://www.facebook.com/photo/?fbid=112335928426600&set=pcb.112341338426059
    market-sizing) shift && set -- "Act as a Product Manager. Assume TAM is Total Addressable Market, SAM is Serviceable Available Market and SOM is Serviceable Obtainable Market. How should I go about estimating the TAM, SAM and SOM for ${*:-an Al-based online form builder tool?}? Please give examples of research sources I should check out." ;;

    # https://www.facebook.com/photo/?fbid=112336035093256&set=pcb.112341338426059
    expanding-product-lines) shift && set -- "I am a Product Manager of ${*:-an ed tech platform that helps students of any age learn how to code and start taking up freelance projects}. I am already monetizing this service well and now want to branch off to other areas. What adjacent product or services can I offer that leverages my strengths and can quickly turn a profit?" ;;

    # https://www.facebook.com/photo/?fbid=112336091759917&set=pcb.112341338426059
    aiding-product-ideation) shift && set -- "Suggest ${1:-3 tech product ideas} I could pursue in the ${2:-solar energy domain} that could turn a profit in ${3:-less than 2 years}. Describe the idea and also share how it will make money." ;;

    # https://www.facebook.com/photo/?fbid=112336188426574&set=pcb.112341338426059
    aligning-teams-with-a-1-pager-memo) shift && set -- "I am a Product Manager planning to build ${1:-a new mobile app that is like Uber for petrol}. It helps busy people ${2:-order fuel for their car on-demand and get a refill while they are at home or office}. Write a 1-pager that I can share with my engineering and design team to explain the product vision & the product components that will most likely be involved." ;;

    # https://www.facebook.com/photo/?fbid=112336248426568&set=pcb.112341338426059
    work-backwards-from-a-press-release-amazon) shift && set -- "Assume you’re building a ${1:-fitness app that recommends workout routines to a user based on their goals and habits}. You’re launching a new feature that will give users ${2:-virtual points for their personal milestones that they can redeem for gift cards}. Using Amazon’s Working Backwards model, write a press release for this product feature. Include some impressive metrics. Give it a catchy title." ;;

    # Training ChatGPT on the stategy framework first https://www.facebook.com/photo?fbid=112336305093229&set=pcb.112341338426059
    drafting-a-product-strategy-based-on-a-framework) shift && set -- "Gibson Biddle has a product strategy framework called the
DHM Model. D stands for delight (how does the product delight customers and add real value), H stands for hard-to-copy (what is an advantage that your product has that is hard to copy and compete with) and M stands for margin-enhancing (how will the product generate a profit and sustain the business). In short, the DHM model dims to answer: \"How will your product delight customers, in hard-to-copy, margin-enhancing ways?\".
Now, act as a Product Manager for ${*:-a web analytics tool like Google Analytics}. Give me a product strategy for this product using Biddle’s DHM model." ;;

    # https://www.facebook.com/photo/?fbid=112336381759888&set=pcb.112341338426059
    competitive-intelligence-summaries) shift && set -- "I’m developing ${1:-a SaaS product that helps restaurants directly sell to their consumers through branded websites & mobile apps without going to a marketplace}. We are serving the ${2:-US market for now}. We help users ${3:-build a personalized website with their branding, customize the menu, launch a white-labelled mobile app & run loyalty deals}. Our unique value prop is that we ${4:-auto-suggest seasonal push notification & email campaigns}. Can you write a competitive intelligence report comparing us to other players that I can share in an investor brief?" ;;

    # https://www.facebook.com/photo/?fbid=112336425093217&set=pcb.112341338426059
    questions-to-uncover-jobs-to-be-done) shift && set -- "Assume I’m a Product Manager for ${1:-a grocery delivery mobile app}. It will be serving the ${2:-Toronto GTA region only}. I want to conduct some consumer research to figure out my consumer's jobs-to-be-done. What personas should I target and then what questions should I be asking them to elicit their job-to-be-done. Take inspiration from the book \"Mom Test\"" ;;
    esac
    echo "$*" | openai complete -
    ;;

  ap)
    : "${X_AP_HOST:?}"
    : "${X_AP_USERNAME:?}"
    : "${X_AP_PASSWORD:?}"
    referer="Referer: $X_AP_HOST"
    user_agent='User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/110.0'
    x_requested_with='X-Requested-With: XMLHttpRequest'

    session_token="$(curl --silent --cookie-jar - --output /dev/null "$X_AP_HOST/common_page/login.html" -H "$user_agent" | grep -v '^#' | cut -f7 | tr -d '\n')"
    session_token="$(curl --silent --cookie-jar - --output /dev/null "$X_AP_HOST/xml/setter.xml" -H "$user_agent" -H "$x_requested_with" -H "$referer" -H "Cookie: session_token=$session_token" --data-raw "token=$session_token&fun=15&Username=$X_AP_USERNAME&Password=$X_AP_PASSWORD" | grep -v '^#' | cut -f7 | tr -d '\n')"
    curl "$X_AP_HOST/xml/setter.xml" -X POST -H "$user_agent" -H "$x_requested_with" -H "$referer" -H "Cookie: session_token=$session_token" --data-raw "token=$session_token&fun=8"
    ;;

  b) "$BROWSER" "$@" ;;

  bc)
    if [ $# -eq 0 ]; then
      bc --mathlib
    elif [ "$1" = 'ft' ]; then
      # Fong’s test https://www.kano.plus/about-kano#discrete-analysis
      shift && bc --mathlib <<BC
a = $1; b = $2; n = $3;
abs(a - b) - 1.65 * sqrt( ( (a + b) * (2 * n - a - b) ) / (2 * n) );
BC
    else
      bc --mathlib --expression="$*"
    fi
    ;;

  cal) cal -A4 -B4 ;;

  cr) /Applications/Chromium.app/Contents/MacOS/Chromium "$@" ;;

  data)
    cmd="${1:-image/gif}"
    shift
    printf "data:%s;base64,%s" "$cmd" "$(base64 "$@")"
    ;;

  diff) diff --color --unified "$@" ;;

  editorconfig)
    cat <<'EOF' >.editorconfig
root = true

[*]
charset = utf-8
end_of_line = lf
trim_trailing_whitespace = true
insert_final_newline = true
; indent_style = space
; indent_size = 2
EOF
    ;;

  erl)
    if [ $# -eq 0 ]; then
      erl
    else
      erl -noshell -eval "$*,init:stop()."
    fi
    ;;

  ex)
    if [ $# -eq 0 ]; then
      iex
    else
      elixir -e "$*"
    fi
    ;;

  f) /Applications/Firefox.app/Contents/MacOS/firefox "$@" ;;

  fde) /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox "$@" ;;

  focus_mode)
    now="$(date +%H%m)"
    [ "$now" -lt '1900' ] || [ '1930' -lt "$now" ]
    ;;

  fx)
    if [ $# -ne 0 ]; then
      x fx | grep --ignore-case --color=never "$1"
      return
    fi
    cmd="$HOME/git/github.com/sharils/~sinopac/$(d F).json"
    [ ! -f "$cmd" ] && curl 'https://mma.sinopac.com/ws/share/rate/ws_exchange.ashx' >"$cmd"
    jq '([first.TitleInfo|splits("<.*?>")]|map(select(.!=""))[0][5:]|sub(" "; "T")) as $date|first.SubInfo|sort_by(.DataValue4)|map([$date,.DataValue4,.DataValue2,.DataValue3]|@tsv)[]' -r <"$cmd" | column -t
    ;;

  fzf) fzf --select-1 --height=~14 --layout=reverse "$@" ;;

  gpg) echo | gpg --clearsign >/dev/null ;;

  gif)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo '==> 43B.gif <==' >&2
      x gif | tee 43B.gif
      ;;
    *) printf "\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x80\x00\x00\xff\xff\xff\x00\x00\x00\x21\xf9\x04\x01\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02\x02\x44\x01\x00\x3b" ;;
    esac
    ;;

  hostnameise) tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g' ;;

  html)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo '==> index.html <==' >&2
      x html | tee index.html
      ;;
    *) echo '<!doctype html><html><head><meta charset="utf-8" /><meta http-equiv="Content-type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1" /><title>Hello HTML</title></head><body><h1>Hello HTML</h1></body></html>' ;;
    esac
    ;;

  ico)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo '==> favicon.ico <==' >&2
      x ico | tee favicon.ico
      ;;
    *) printf "\x00\x00\x01\x00\x01\x00\x01\x01\x00\x00\x01\x00\x18\x00\x30\x00\x00\x00\x16\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x01\x00\x18\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\x00\x00\x00" ;;
    esac
    ;;

  ip) ipconfig getifaddr "${@:-en0}" ;;

  js) node --print "$*" ;;

  log) log show --predicate 'eventMessage CONTAINS "unlockUIBecomesActive"' --last "${@:-1h}" ;;

  mh)
    dir="$HOME/git/github.com/sharils/~miraheze/$(d F)"
    x mp "$dir"
    mv -v ~/Downloads/smilingpuffinwiki_xml_*.xml.gz "$dir"
    ;;

  mp) mkdir -pv "$@" && cd "$@" || return ;;

  o) open "${@:-.}" ;;

  pdf)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo '==> 130B.pdf <==' >&2
      x pdf | tee 130B.pdf
      ;;
    *) printf "\x25\x50\x44\x46\x2d\x31\x2e\x0a\x31\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x50\x61\x67\x65\x73\x20\x32\x20\x30\x20\x52\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x32\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x4b\x69\x64\x73\x5b\x33\x20\x30\x20\x52\x5d\x2f\x43\x6f\x75\x6e\x74\x20\x31\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x33\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x50\x61\x72\x65\x6e\x74\x20\x32\x20\x30\x20\x52\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x74\x72\x61\x69\x6c\x65\x72\x20\x3c\x3c\x2f\x52\x6f\x6f\x74\x20\x31\x20\x30\x20\x52\x3e\x3e" ;;
    esac
    ;;

  php) php -r "$*" ;;

  png)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo '==> 68B.png <==' >&2
      x png | tee 68B.png
      ;;
    *) printf "\x89\x50\x4e\x47\x0d\x0a\x1a\x0a\x00\x00\x00\x0d\x49\x48\x44\x52\x00\x00\x00\x01\x00\x00\x00\x01\x08\x04\x00\x00\x00\xb5\x1c\x0c\x02\x00\x00\x00\x0b\x49\x44\x41\x54\x78\xda\x63\x64\x60\x00\x00\x00\x06\x00\x02\x30\x81\xd0\x2f\x00\x00\x00\x00\x49\x45\x4e\x44\xae\x42\x60\x82" ;;
    esac
    ;;

  py)
    if [ $# -eq 0 ]; then
      python3
    else
      python3 -c "$*"
    fi
    ;;

  resetLaunchPad | showHidden)
    defaults write com.apple.dock "$cmd" -bool true
    killall Dock
    ;;

  rm)
    args=$(printf '%s\n' "$@")
    printf '%s\n' "$args" | while read -r arg; do
      osascript - "$(realpath "$arg")" <<APPLESCRIPT
on run argv
  set posix_files to {}

  repeat with arg in argv
    set end of posix_files to the POSIX file arg
  end repeat

  tell application "Finder" to move posix_files to trash
end run
APPLESCRIPT
    done
    ;;

  screen) screen -xRRe^Gg "$@" ;;

  sh)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      cmd="${*:-sh}"
      echo "==> $cmd <==" >&2
      x sh | tee "$cmd"
      x + "$cmd"
      ;;
    *)
      cat <<'EOF'
#!/usr/bin/env sh
set -o errexit -o nounset -o xtrace

echo 'Hello sh!'
EOF
      ;;
    esac
    ;;

  sn)
    # shellcheck disable=2087
    ssh no sh <<EOF
set -o errexit -o nounset -o xtrace
for arg in $@; do
  curl --location --continue-at - --output sn/sn-\$arg.mp3 https://media.grc.com/sn/sn-\$arg.mp3
done
EOF
    ;;

  ssh) ssh -t "$@" screen -xRRe^Gg ;;

  ssh-copy-id) ssh-copy-id -o PreferredAuthentications=password -i "$HOME/.ssh/id_ed25519.pub" "$@" ;;

  ssh-keygen)
    ssh-keygen -f ~/.ssh/id_ed25519 -t ed25519 -C "${@:?}"
    pbcopy <~/.ssh/id_ed25519.pub
    pbpaste
    cp ~/.ssh/id_ed25519.pub "$HOME/.ssh/$*.pub"
    ;;

  tb) /Applications/Tor\ Browser.app/Contents/MacOS/firefox "$@" ;;

  tel) open "tel:$*" ;;

  touch)
    x mp "$(dirname "$*")"
    touch "$*"
    ;;

  tree) (
    cmd="${*:-$HOME/Sync/Camera}"
    cd "$cmd" && find . -print | sed "s#[^/]*/#|____#g;s#____|# |#g;1s#.*#$cmd#"
  ) ;;

  tz)
    cmd="$1"
    shift
    if [ "$cmd" = pdt ]; then
      cmd=PST8PDT
    elif [ "$cmd" = mdt ]; then
      cmd=MST7MDT
    elif [ "$cmd" = cdt ]; then
      cmd=CST6CDT
    elif [ "$cmd" = edt ]; then
      cmd=EST5EDT
    fi
    if [ -n "$cmd" ] && realpath -q "/usr/share/zoneinfo/$cmd" >/dev/null; then
      TZ="$cmd" "$@"
      return
    fi
    tz="$(cd /usr/share/zoneinfo && find ./* -type f -name '*[[:upper:]]*' ! -name +VERSION | sed 's#^./##')"
    if [ "$cmd" = 'date' ]; then
      # shellcheck disable=SC2016 # in sh -c
      tz="$(echo "$tz" | xargs -I{} sh -c 'printf "%s {}\n" "$(TZ={} date +%z)"')"
      echo "$tz" | grep '^-' | sort -r
      echo "$tz" | grep '^+' | sort
    else
      tz="$(echo "$tz" | sort)"
      echo "$tz" | grep /
      echo "$tz" | grep -v /
    fi
    ;;

  venv)
    if type deactivate >/dev/null 2>&1; then
      deactivate
      return
    fi
    cmd="${1:-.venv}"
    [ ! -e "$cmd" ] && python3 -m venv "$cmd"
    cmd="$cmd/bin/activate"
    echo >&2 "+ . $cmd"
    # shellcheck source=/dev/null
    . "$cmd"
    ;;

  w8)
    cmd="$HOME/Sync/Libera PRO/${2:?}.txt"
    curl --compressed --location --silent --output "$cmd" "https://dl1.wenku8.com/down.php?type=big5&id=${1:?}"
    echo "$cmd" | pbcopy
    pbpaste
    ;;

  webp)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo '==> 72B.webp <==' >&2
      x webp | tee 72B.webp
      ;;
    *) printf "\x52\x49\x46\x46\x40\x00\x00\x00\x57\x45\x42\x50\x56\x50\x38\x58\x0a\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x41\x4c\x50\x48\x02\x00\x00\x00\x00\x00\x56\x50\x38\x20\x18\x00\x00\x00\x30\x01\x00\x9d\x01\x2a\x01\x00\x01\x00\x02\x00\x34\x25\xa4\x00\x03\x70\x00\xfe\xfb\x94\x00\x00" ;;
    esac
    ;;

  whois)
    # support whois -b example.com
    for name in "$@"; do :; done
    whois -c "${name##*.}" "$@"
    ;;

  x) (
    set -x
    "$@"
  ) ;;

  zws) printf "\xe2\x80\x8b" | c ;;

  aud | cad | chf | cnh | cny | eur | gbp | hkd | jpy | mop | nzd | sek | sgd | thb | usd | zar)
    x fx "$cmd" | x bc "$(awk '{ print $3 }')" "$@"
    ;;

  am | at | au | bg | br | by | cn | cz | de | dk | ee | et | fi | fr | gb | gr | hk | hr | hu | ie | il | is | it | jp | kr | kz | lt | nl | no | nz | pl | pt | ro | ru | se | si | sk | tr | tw | ua | us | yu | za | dech | frbe | frca | frch | itch | nlbe | ca | es | eu | en)
    unset -v lang loc
    loc="$(locale -a)"
    lang="${lang:="$(echo "$loc" | grep --ignore-case "^.._$cmd$")"}"
    lang="${lang:="$(echo "$loc" | grep --ignore-case "^$(echo "$cmd" | sed 's/^\(..\)\(..\)$/\1_\2/')$")"}"
    lang="${lang:="$(echo "$loc" | grep "^${cmd}_..$")"}"
    lang="${lang:="$([ "$cmd" = 'en' ] && echo en_CA || echo '')"}"
    LC_ALL="$lang.UTF-8" "$@"
    ;;

  *) echo not implemented >&2 ;;

  esac
}
