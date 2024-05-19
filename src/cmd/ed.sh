main() {
  local main_cmd="@ ed $@"
  if [ -z "$1" ]; then
    vim $HOME/bashrc2
  elif [ "$1" == "brc" ]; then
    vim $HOME/.bashrc
  elif [ "$1" == "vrc" ]; then
    vim $HOME/.vimrc
  else
    echo " not found: $main_cmd"
  fi
}

main $@
