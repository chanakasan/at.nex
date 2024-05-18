set -e

main() {
  local root=$HOME/dotfiles/at.nex
  local nex_support=$root/.impl/support
  bash $nex_support/install/run_default.sh "at.nex"
}

main
