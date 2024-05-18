start() {
  echo " Installing - $item_name"
}

init_script_vars() {
  this_bashrc="$HOME/.bashrc"
  this_name=$item_short_name
  this_item_path=$(get_item_path)
  this_start_text='__nex_'$this_name'_start'
  this_end_text='__nex_'$this_name'_end'
  this_middle_text="source $this_item_path/src/entry.sh"
}

get_item_path() {
  if [ $item_type == "plugin" ]; then
    echo $(nex _plugin $this_name)
  else
    echo $(nex _root $this_name)
  fi
}

debug_on() {
  echo $item_name
  echo $item_type
  echo $item_short_name
  echo $this_item_path
  echo "debug done"
  exit 0
}

validate() {
  validate_user_vars
  init_script_vars
  temp_patch
  # debug_on
  validate_script_vars
}

temp_patch() {
  if [ "$item_type" == "$item_short_name" ]; then
    item_type="plugin"
  fi
}

validate_user_vars() {
  require_param "item_short_name"
  require_param "item_name"
  require_param "item_type"
}

validate_script_vars() {
  require_param "this_name"
  require_param "this_item_path"
  require_param "this_bashrc"
  require_param "this_start_text"
  require_param "this_end_text"
  require_param "this_middle_text"
}

finish() {
  echo " done"
  echo " please run:"
  echo " source ~/.bashrc"
  echo
}

remove_from_bashrc() {
  sed -i '/#'$this_start_text'/,/#'$this_end_text'/{d}' $this_bashrc
}

copy_to_bashrc() {
  local content="$1"
  if [ -z "$this_middle_text" ]; then
    echo " copy_to_bashrc error"
    exit 1
  fi
  echo "" >> $this_bashrc
  echo "#$this_start_text" >> $this_bashrc
  echo "$this_middle_text" >> $this_bashrc
  echo "#$this_end_text" >> $this_bashrc
}

require_param() {
  local var_name="$1"
  local var_value="${!var_name}"
  if [ -z "$var_value" ]; then
    echo " required param is not set: $var_name"
    echo " aborting"
    echo
    exit 1
  fi
}
