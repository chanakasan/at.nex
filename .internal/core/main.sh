
f () {
  local base=$nx_at_root
  if [[ -z "$1" ]]; then
    _f_prompt
  else
    _f_try $1
  fi
}

_f_prompt() {
  local value
  local fn_default=_f_@cmd
  read -p "function: " value
  if [[ -n $value ]]; then
    _f_try $value
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

c () {
  local command=""
  while true; do
    read -e -p "cmd: $command" input
    if [[ -z "$input" ]]; then
        break
    fi

    # append
    if [[ "${input: -1}" == "/" ]]; then
      command="${command}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      command="${command}${input%+}"
    else
      command="${command}${input} "
    fi
  done
  
  # run
  $command
}
