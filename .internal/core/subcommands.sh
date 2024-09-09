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
    read -p "[$(pwd)] " input
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
