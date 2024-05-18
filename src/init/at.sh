@ () {
  local base=$nx_at_root
  if _at_is_match "rel" $@; then
    source $HOME/.bashrc
  elif _at_is_match "ed" $@; then
    bash $base/src/cmd/ed.sh ${@:2}
  else
    bash $base/src/cmd/run.sh "$@"
  fi
}

_at_is_match() {
  if [ "$1" == "$2" ]; then
    return 0
  else
    return 1
  fi
}
