@ () {
  local base=$nx_at_root
  local input="$1"
  if args_empty $@; then
    print_usage
    return
  elif is_match "rel" $@; then
    at_rel
  elif is_match "ed" $@; then
    at_ed
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
  vim $HOME/.bashrc
}

at_run() {
  bash $base/src/cmd/run.sh "$@"
}