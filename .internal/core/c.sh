c () {
  local main_cmd="$1"
  local args="${@:2}"
  local n=1

  if [[ -z $main_cmd ]]; then
    read -e -p "cmd: " main_cmd
  fi

  while true; do
    if [[ -z $args ]]; then
      read -e -p "$main_cmd: " input
    else
      read -e -p "$main_cmd: $args " input
    fi

    if [[ "$input" == "\`" ]]; then
        break
    fi

    #<< append args
    if [[ "${input: -1}" == "/" ]]; then
      args="${args}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      args="${args}${input%+}"
    elif [[ $n == 1 && -z $args ]]; then
      args="${input}"
    else
      args="${args} ${input}"
    fi
    #>>

    # remove leading whitespace
    # if [[ $n == 1 ]]; then
    #   command="${command#"${command%%[![:space:]]*}"}"
    # fi
    
    n=2
  done

  if [[ -n $main_cmd ]]; then
    command="$main_cmd $args"
    echo
    $command
  fi
}
