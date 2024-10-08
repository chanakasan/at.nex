_f_@hello() {
  echo "Hello fun !"
}

_f_@rel() {
  source $HOME/.bashrc
}

_f_@ed() {
  bash $base/.internal/cmd/ed.sh ${@:2}
}

_f_@update() {
  bash $base/.internal/cmd/update.sh ${@:2}
}

_f_@cd() {
  local destination="$PWD"
  local first_char=""
  while true; do
    read -e -p "cd: $destination " input
    if [[ -z "$input" ]]; then
        echo
        break
    fi
    first_char="${input:0:1}"

    if [[ "$first_char" == "~" ]]; then
        input="${HOME}${input:1}"
    elif [[ "$first_char" == "/" ]]; then
        input="${input:1}"
    fi

    if [[ "$first_char" == "~" && -d "$input" ]]; then
        destination="$input"
    elif [[ -d "$input" ]]; then
        destination="${destination}/${input%/}"
    else
        echo " ❌ Not a directory: $input"
    fi
    
    cd "$destination"
  done
}

_f_@r() {
  _f_@rel
}
