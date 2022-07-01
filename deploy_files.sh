#!/bin/bash
initel="~/.doom.d/init.el"
configel="~/doom.d/config.el"
packagesel="~/doom.d/packages.el"
[ -f $initel ] && mkdir -p ~/.doom.d/old && mv ~/.doom.d/init.el ~/.doom.d/old
[ -f $configel ] && mv ~/.doom.d/config.el ~/.doom.d/old
[ -f $packagesel ] && mv ~/.doom.d/packages.el ~/.doom.d/old
ln -s $HOME/configs/emacs/init.el ~/.doom.d/init.el
ln -s $HOME/configs/emacs/config.el ~/.doom.d/config.el
ln -s $HOME/configs/org-bullets.el ~/.doom.d/org-bullets.el
ln -s $HOME/configs/emacs/packages.el ~/.doom.d/packages.el
cp -r emacs/tab-jump-out ~/.doom.d/

[ -f ~/.config/starship.toml ] && mv ~/.config/starship.toml ~/.config/starship.toml.old
ln -s ~/configs/starship.toml ~/.config/starship.toml

! [ -d ~/.config/leftwm ] &&  mkdir -p ~/.config/leftwm
[ -f ~/.config/leftwm/config.toml ] && mv ~/.config/leftwm/config.toml ~/.config/leftwm/config.toml.old
ln -s ~/configs/leftwm/config.toml ~/.config/leftwm/config.toml
cp -r ~/configs/leftwm/themes  ~/.config/leftwm/themes

[ -d ~/.config/lf ] && mv ~/.config/lf ~/.config/lf.old
mkdir -p ~/.config/lf
os_plat=$(uname -s)
if [ $os_plat = Darwin ]; then
   ln -s ~/configs/lf/lfrc_mac ~/.config/lf/lfrc
elif [ $os_plat = Linux ]; then
   ln -s ~/configs/lf/lfrc ~/.config/lf/lfrc
   ln -s ~/configs/lf/scope ~/.config/lf/scope
   ln -s ~/configs/lf/cleaner ~/.config/lf/cleaner
fi

! [ -d ~/.local/share/fonts ] && mkdir -p ~/.local/share/fonts
cp -r ~/configs/fonts ~/.local/share/fonts

[ -d ~/.config/alacritty ] && mv ~/.config/alacritty ~/.config/alacritty.old
mkdir ~/.config/alacritty
ln -s ~/configs/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old
ln -s ~/configs/tmux.conf ~/.tmux.conf

[ -f ~/.zshrc ] && mv ~/zshrc.old
ln -s ~/configs/zshrc ~/.zshrc
