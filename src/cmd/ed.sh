main() {
  if [ -z "$1" ]; then
    ed_default
  elif [[ $(type -t "ed_$1") == "function" ]]; then
    ed_$1
  else
    echo " not found: @ ed $@"
  fi
}

ed_default() {
  vim $HOME/bashrc2
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

ed_ssh() {
  vim $HOME/.ssh/config
}

main $@
