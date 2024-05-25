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

print_assoc_array() {
  local array=("$@")
  if [ -z "$debug_on" ]; then
    return
  fi
  echo "---------------------------------"
  echo "print_assoc_array"
  echo
  for key in "${!array[@]}"; do
    echo "$key => ${array[$key]}"
  done
  echo "---------------------------------"
}
