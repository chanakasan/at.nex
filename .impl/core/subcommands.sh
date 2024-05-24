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
