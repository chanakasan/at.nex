@ () {
  local base=$nx_at_root
  local fn=_@$1
  if [[ $(type -t "$fn") == "function" ]]; then
    $fn ${@:2}
  else
    bash $base/src/cmd/run.sh "$@"
  fi
}

_@hello() {
  echo "Hello @ !"
}

_@ed() {
  bash $base/src/cmd/ed.sh ${@:2}
}

_@update() {
  bash $base/src/cmd/update.sh ${@:2}
}

_@rel() {
  source $HOME/.bashrc
}
