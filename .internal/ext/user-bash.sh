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
