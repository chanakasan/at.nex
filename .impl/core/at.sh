@ () {
  local base=$nx_at_root
  local fn=_@$1
  if [[ $(type -t "$fn") == "function" ]]; then
    $fn $@
  else
    bash $base/src/cmd/run.sh "$@"
  fi
}
