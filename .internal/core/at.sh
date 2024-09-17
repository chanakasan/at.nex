@ () {
  local base=$nx_at_root
  local fn=_@$1
  local fn_run=_@run
  if [[ -z "$1" ]]; then
    $fn_run
  elif [[ $(type -t "$fn") == "function" ]]; then
    $fn $@
  else
    bash $base/.internal/cmd/run.sh "$@"
  fi
}

@a () {
  local command="$@"
  local value
  read -p "alias: " value
  if [[ -z "$value" ]]; then
    return 1
  fi
  alias $value="$command"
}
