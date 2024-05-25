source $nx_at_root/src/config/config.sh
source $nx_at_root/src/config/ed.sh

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

ed_default() {
  $editor $HOME/bashrc2
}

ed_config() {
  $editor $nx_at_root/src/config/config.sh
}

ed_alias() {
  $editor $nx_at_root/src/config/alias.sh
}

main $@
