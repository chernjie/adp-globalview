#!/usr/bin/env bash

# @author CJ lim@chernjie.com

COLOR_RED()   { echo -en "\033[31m"; }
COLOR_RESET() { echo -en "\033[0m";  }

_error() {
  COLOR_RED && echo $(date) "$@" && COLOR_RESET && exit 1
}

use() {
  for i do
    if ! command -v $i > /dev/null
    then
      _error command $i not found
    fi
  done
}

main() {
    mkdir -p data
    jq -f lib/jq/overview.jq overview.json | json2csv --output data/overview.csv
}

case $1 in

  setup)
    brew install jq node
    npm install --global json2csv
  ;;

  *)
    use brew jq npm json2csv
    main
  ;;

esac
