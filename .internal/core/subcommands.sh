_@hello() {
  echo "Hello @ !"
}

_@rel() {
  source $HOME/.bashrc
}

_@ed() {
  bash $base/.internal/cmd/ed.sh ${@:2}
}

_@update() {
  bash $base/.internal/cmd/update.sh ${@:2}
}
