nx_at_root=$HOME/dotfiles/at.nex
source $nx_at_root/src/init/at.sh

if [ -f ~/bashrc2 ]; then
  source ~/bashrc2
fi

if [ -d ~/user/bash ]; then
  for f in ~/user/bash/*.sh; do
    if [ -f "$f" ]; then
      source $f
    fi
  done
fi
