@ () {
  local input="$1"
  if [ -z "$input" ]; then
    echo "Hello @ !"
  else
    run "$@"
  fi
}
