@ () {
  local base=$nx_at_root
  local input="$1"
  if [ -z "$input" ]; then
    echo "Hello @ !"
  else
    bash $base/src/cmd/run.sh "$@"
  fi
}
