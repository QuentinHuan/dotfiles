## git
apt install git

# keepassxc
apt install keepassxc

## i3 window manager
apt install i3-wm
apt install suckless-tools
apt install feh
apt install i3lock
apt install i3status
apt install pavucontrol

## tmux
apt install tmux

## zsh
apt install zsh

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# zsh-history based command completion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
## neovim
apt install neovim
## alacritty
apt install alacritty

## various tools
apt install htop
apt install curl
apt install mesa-utils

## bib
apt install build-essential
apt-get install libc6-i386

#ghcup and haskell
apt install libffi-dev libgmp-dev libgmp10 libncurses-dev pkg-config

## rhythmbox
apt install rhythmbox

## c++
apt install clang
apt install clang-15
apt install g++
