_@hello() {
  echo "Hello @ !"
}

_@rel() {
  source $HOME/.bashrc
}

_@ed() {
  bash $base/.internal/cmd/ed.sh ${@:2}
}

_@update() {
  bash $base/.internal/cmd/update.sh ${@:2}
}

_@cd() {
  while true; do
    read -e -p "[$(pwd)] " input
    if [[ -z "$input" ]]; then
        echo
        break
    fi
    set -- $input
    if [[ $1 == "~" ]]; then
      cd $HOME
    else
      cd "$input"
    fi
  done
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