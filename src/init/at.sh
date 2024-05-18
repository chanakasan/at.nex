@ () {
  local base=$nx_at_root
  if args_empty $@; then
    print_usage
    return
  elif is_match "rel" $@; then
    at_rel
  elif is_match "ed" $@; then
    at_ed ${@:2}
  else
    at_run $@
  fi
}

print_usage() {
  echo " Hello @ !"
}

args_empty() {
  if [ -z "$1" ]; then
    return 0
  else
    return 1
  fi
}

is_match() {
  if [ "$1" == "$2" ]; then
    return 0
  else
    return 1
  fi
}

at_rel() {
  source $HOME/.bashrc
}

at_ed() {
  if [ "$1" == "brc" ]; then
    vim $HOME/.bashrc
  elif [ "$1" == "vrc" ]; then
    vim $HOME/.vimrc
  else
    vim $HOME/bashrc2
  fi
}

at_run() {
  bash $base/src/cmd/run.sh "$@"
}