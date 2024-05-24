set -e

export tmp_root=$HOME/dotfiles/at.nex
export tmp_support=$tmp_root/.internal/support
bash $tmp_support/installer/run_default.sh "at.nex"
