a () {
  local args="$@"
  local default_value="d"
  local n=1
  local alias_value

  read -p "alias? (d) " alias_value
  if [[ -z "$alias_value" ]]; then
    alias_value=$default_value
  fi

  while true; do
    if [[ -z $args ]]; then
      read -e -p "alias $alias_value: " input
    else
      read -e -p "alias $alias_value: $args " input
    fi

    if [[ "$input" == "\`" ]]; then
        break
    fi

    #<< append args
    if [[ -z $input ]]; then
      : # do nothing
    elif [[ -z $args ]]; then
      args="${input}"
    elif [[ "${input: -1}" == "/" ]]; then
      args="${args}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      args="${args}${input%+}"
    else
      args="${args} ${input}"
    fi
    #>>

    n=2
  done

  if [[ -n $args ]]; then
    alias $alias_value="${args}"
  else
    echo Aborted
  fi
}
