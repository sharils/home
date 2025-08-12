#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  animal | nature | food | drink | activity) open "$SHARILS_HOME/emoji/AnimalNatureFoodDrinkActivity.png" ;;
  smiles | people) open "$SHARILS_HOME/emoji/SmilesPeople.png" ;;
  symbols | flags) open "$SHARILS_HOME/emoji/SymbolsFlags.png" ;;
  travel | places | objects) open "$SHARILS_HOME/emoji/TravelPlacesObjects.png" ;;
  *) $EDITOR "$@" ~/.config/karabiner/karabiner.json ;;
  esac
}

e "$@"
