# get nixos configuration.nix file
cp /etc/nixos/configuration.nix ./

# get nvim config
cp $HOME/.config/nvim/init.lua .config/nvim/

# get i3 config
cp $HOME/.config/i3/* ./.config/i3/

# get zsh config
cp $HOME/.zshrc ./

# get bash config
cp $HOME/.bashrc ./

# get tmux config
cp $HOME/.tmux.conf ./
