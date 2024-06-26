source $nx_at_root/src/config/ed.sh

main() {
  local config_file=$HOME/user/bash/config/at.sh
  load_config
  local editor=${nx_at_editor:-vim}
  if [ -z "$1" ]; then
    ed_default
  elif [[ $(type -t "ed_$1") == "function" ]]; then
    ed_$1
  else
    echo " not found: @ ed $@"
  fi
}

load_config() {
  if [ -f "$config_file" ]; then
    source $config_file
  fi
}

ed_default() {
  $editor $HOME/bashrc2
}

ed_config() {
  $editor $config_file
}

ed_alias() {
  $editor $nx_at_root/src/config/alias.sh
}

main $@
