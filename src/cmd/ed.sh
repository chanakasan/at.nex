main() {
  if [ -z "$1" ]; then
    vim $HOME/bashrc2
  elif [[ $(type -t "ed_$1") == "function" ]]; then
    ed_$1
  else
    echo " not found: @ ed $@"
  fi
}

ed_brc() {
  vim $HOME/.bashrc
}

ed_vrc() {
  vim $HOME/.vimrc
}

ed_bash() {
  vim $HOME/user/bash
}

ed_script() {
  vim $HOME/user/script
}

main $@
