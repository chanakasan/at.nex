#!/bin/bash

set -e

# debug_on=1

source $nx_at_root/.internal/mixins/debug.sh
source $nx_at_root/src/config/alias.sh

main() {
  local main_cmd="@ $*"
  local args="$*"
  local input=$(create_key "$args")
  exit_if_empty $1
  log "=> $main_cmd"
  try_alias $input
  try_script "$PWD/.local/script" $input
  try_script "$HOME/user/script" $input
  not_found
}

get_root_path() {
  echo $nx_at_root
}

create_key() {
  local key="$1"
  key=${key//_/}
  key=${key//-/}
  key=${key// /}
  echo $key
}

get_alias() {
  local key=${1:-null}
  local value=${shortcuts_mapping[$key]}
  echo $value
}

try_alias() {
  local alias_value="$(get_alias "$1")"
  if [ -n "$alias_value" ]; then
    bash $(get_root_path)/.internal/cmd/run.sh "$alias_value"
    exit
  else
    log try_alias: not found: $1
  fi
}

try_script() {
  local base_path="$1"
  if [ ! -d $base_path ]; then
    log try_script: not dir: $base_path
    return 1
  fi
  build_files_index $base_path
  local key="$2"
  local value="${files_index[$key]}"
  local file=$value
  log key: $key
  log value: $value
  log file: $file
  if [ -f "$file" ]; then
    bash "$file"
    exit $?
  else
    return
  fi
}

print_usage() {
  echo " Usage: @ <1> <2> <3> ..."
  echo
}

not_found() {
  echo " not found: <$args.sh>"
}

exit_if_empty() {
  if [ -z "$1" ]; then
    echo " argument required"
    print_usage
    exit 1
  fi
}

build_files_index() {
  local basepath="$1"
  exit_if_empty $basepath
  log build_files_index
  declare -g -A files_index
  while IFS= read -r -d '' file; do
    filename=$(basename -s.sh "$file")
    key=$(create_key "$filename")
    files_index["$key"]=$file
  done < <(find $basepath  -type f -name "*.sh" -print0)
  print_assoc_array "${files_index[@]}"
}

main $@
