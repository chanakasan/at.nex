_@hello() {
  echo "Hello @ !"
}

_@rel() {
  source $HOME/.bashrc
}

_@r() {
  _@rel
}

_@ed() {
  bash $base/.internal/cmd/ed.sh ${@:2}
}

_@update() {
  bash $base/.internal/cmd/update.sh ${@:2}
}

_@cd() {
  local destination="$PWD"
  local first_char=""
  while true; do
    read -e -p "[$destination] " input
    if [[ -z "$input" ]]; then
        echo
        break
    fi
    first_char="${input:0:1}"

    if [[ "$first_char" == "~" ]]; then
        input="${HOME}${input:1}"
    fi

    if [[ "$first_char" == "~" && -d "$input" ]]; then
        destination="$input"
    elif [[ -d "$input" ]]; then
        destination="${destination}${input%/}"
    else
        echo " ❌ Not a directory: $input"
    fi
  done

  cd "$destination"
}

_@run() {
  local command=""
  while true; do
    read -e -p "[$command] " input
    if [[ -z "$input" ]]; then
        echo
        break
    fi

    # append
    if [[ "${input: -1}" == "/" ]]; then
      command="${command}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      command="${command}${input%+}"
    else
      command="${command}${input} "
    fi
  done
  
  # run
  $command
}