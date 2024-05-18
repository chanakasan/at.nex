set -e

tmp_root=$HOME/dotfiles/at.nex
tmp_support=$tmp_root/.impl/support
source $tmp_support/install/helpers.sh
source $tmp_support/install/run_default.sh

run_default "at.nex"
