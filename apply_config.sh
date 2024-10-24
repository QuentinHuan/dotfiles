home="/home/huan"
## vim config
mkdir $home/.config/nvim
cp init.vim $home/.config/nvim/

## zsh config
cp .zshrc $home/

## bash config
cp .bashrc $home/

## tmux config
cp .tmux.conf $home/

## i3wn config
cp config/i3/config $home/.config/i3/
cp config/i3/i3status.conf $home/.config/i3/

## copy wallpapers
cp -r wallpapers /home/huan/Pictures/

