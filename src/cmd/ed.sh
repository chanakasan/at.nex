main() {
  if [ "$1" == "brc" ]; then
    vim $HOME/.bashrc
  elif [ "$1" == "vrc" ]; then
    vim $HOME/.vimrc
  else
    vim $HOME/bashrc2
  fi
}

main $@
