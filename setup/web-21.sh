#!/bin/bash

set -e

main() {
  local install_dir=$HOME/dotfiles/at.nex
  local git_url="https://github.com/chanakasan/at.nex"
  clone_repo
  run_installer
}

clone_repo() {
  echo " => Cloning $git_url"
  if [ -d "$install_dir" ]; then
    echo " Dir exists: $install_dir"
    echo " Please remove it first" 
    exit 1
  fi

  mkdir -p $install_dir
  git clone $git_url $install_dir
}

run_installer() {
  bash $install_dir/setup/install.sh
}

main
