read -p "confirm (y/n) ? " value
if [ "$value" != "y" ]; then
  exit
fi
echo " Updating git"
cd ~/dotfiles/at.nex
git pull origin main
echo " done"
echo
