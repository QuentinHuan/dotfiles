echo "This program may requiere sudo priviledge"

echo "Copy configuration.nix into /etc/nixos/"
cp configuration.nix /etc/nixos/

echo "Copy .config into home directory"
cp -a .config $HOME/

echo "Copy .zshrc into home directory"
cp -a .zshrc $HOME/

echo "Copy .bashrc into home directory"
cp -a .bashrc $HOME/

echo "Copy .tmux.conf into home directory"
cp -a .tmux.conf $HOME/

# install vimplug
echo "Download Vimplug "
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Finish
echo "DONE"
echo "Consider running : nixos-rebuild boot    to finish the install"
