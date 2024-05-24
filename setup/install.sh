set -e

export nx_at_root=$HOME/dotfiles/at.nex
export nx_at_support=$nx_at_root/.internal/support
bash $nx_at_support/installer/run_default.sh "at.nex"
