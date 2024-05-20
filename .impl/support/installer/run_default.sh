source $tmp_support/installer/helpers.sh

main() {
  local item_name="$1"
  local item_short_name="${1%.*}"
  local item_type="${1##*.}"
  validate
  start
  remove_from_bashrc
  copy_to_bashrc
  finish
}

main $@
