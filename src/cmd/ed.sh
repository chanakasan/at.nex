source $nx_at_root/src/config/config.sh

main() {
  local editor=${nx_at_editor:-vim}
  if [ -z "$1" ]; then
    ed_default
  elif [[ $(type -t "ed_$1") == "function" ]]; then
    ed_$1
  else
    echo " not found: @ ed $@"
  fi
}

ed_config() {
  $editor $nx_at_root/src/config/config.sh
}

ed_default() {
  $editor $HOME/bashrc2
}

ed_brc() {
  $editor $HOME/.bashrc
}

ed_vrc() {
  $editor $HOME/.vimrc
}

ed_bash() {
  $editor $HOME/user/bash
}

ed_ssh() {
  $editor $HOME/.ssh/config
}

main $@
