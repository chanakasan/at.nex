#!/bin/bash

# debug_on=1

main() {
  local main_cmd="run $*"
  local args="$*"
  local input=$(create_key "$args")
  exit_if_empty $1
  try_script "$PWD/.local/script" $input
  try_script "$HOME/user/script" $input
  not_found
}

create_key() {
  local key="$1"
  key=${key//_/}
  key=${key//-/}
  key=${key// /}
  echo $key
}

try_script() {
  local base_path="$1"
  if [ ! -d $base_path ]; then
    return 1
  fi
  build_files_index $base_path
  print_files_index
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
}

print_files_index() {
  if [ -z "$debug_on" ]; then
    return
  fi
  echo "---------------------------------"
  for key in "${!files_index[@]}"; do
    echo "$key => ${files_index[$key]}"
  done
}

log() {
  if [ -z "$debug_on" ]; then
    return
  fi
  echo " $*"
}

dvar() {
  if [ -z "$debug_on" ]; then
    return
  fi
  echo " $1: <${!1}>"
}

main $@
