a () {
  local command="$@"
  local defaultValue="d"
  local value
  if [[ -z $command ]]; then
    echo Aborted
    return
  fi
  read -p "alias: (d) " value
  if [[ -z "$value" ]]; then
    alias $defaultValue="$command"
  else
    alias $value="$command"
  fi
}
