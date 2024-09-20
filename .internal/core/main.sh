
f () {
  local base=$nx_at_root
  if [[ -z "$1" ]]; then
    _f_prompt
  else
    _f_try $1
  fi
}

_f_try() {
  local fn_name=_f_@$1
  if [[ $(type -t "$fn_name") == "function" ]]; then
    $fn_name
  else
    bash $base/.internal/subcommand/run_script.sh "$1"
  fi
}

_f_prompt() {
  local value
  local fn_default=_f_@cmd
  read -p "function: " value
  if [[ -z $value ]]; then
    $fn_default
  else
    _f_try $value
  fi
}

a () {
  local command="$@"
  local defaultValue="d"
  local value
  read -p "alias: (d) " value
  if [[ -z "$value" ]]; then
    alias $defaultValue="$command"
  else
    alias $value="$command"
  fi
}
