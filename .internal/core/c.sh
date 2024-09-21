
c () {
  local command="$@"
  local n=1

  while true; do
    if [[ -z $command ]]; then
      read -e -p "cmd: " input
    else
      read -e -p "cmd: $command " input
    fi

    if [[ -z "$input" ]]; then
        break
    fi

    # append
    if [[ "${input: -1}" == "/" ]]; then
      command="${command}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      command="${command}${input%+}"
    elif [[ $n == 1 && -z $command ]]; then
      command="${input}"
    else
      command="${command} ${input}"
    fi

    # remove leading whitespace
    # if [[ $n == 1 ]]; then
    #   command="${command#"${command%%[![:space:]]*}"}"
    # fi
    
    n=2
  done
  
  echo
  $command
}
