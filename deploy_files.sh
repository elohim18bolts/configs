#!/bin/bash
[ -f ~/.doom.d/init.el ] && mv ~/.doom.d/init.el ~/.doom.d/init.el.old
[ -f ~/.doom.d/config.el ] && mv ~/.doom.d/config.el ~/.doom.d/config.el.old
[ -f ~/.doom.d/packages.el ] && mv ~/.doom.d/packages.el ~/.doom.d/packages.el.old
[ -f ~/.doom.d/org-bullets.el] && mv ~/.doom.d/org-bullets.el ~/.doom.d/org-bullets.el.old
ln -s $HOME/configs/emacs/init.el ~/.doom.d/init.el
ln -s $HOME/configs/emacs/config.el ~/.doom.d/config.el
ln -s $HOME/configs/org-bullets.el ~/.doom.d/org-bullets.el
ln -s $HOME/configs/emacs/packages.el ~/.doom.d/packages.el
[ ! -d ~/.doom.d/tab-jump-out ] && cp -r $HOME/configs/emacs/tab-jump-out ~/.doom.d/

[ -f ~/.config/starship.toml ] && mv ~/.config/starship.toml ~/.config/starship.toml.old
ln -s ~/configs/starship.toml ~/.config/starship.toml

[ ! -d ~/.config/leftwm ] &&  mkdir -p ~/.config/leftwm
[ -f ~/.config/leftwm/config.toml ] && mv ~/.config/leftwm/config.toml ~/.config/leftwm/config.toml.old
ln -s ~/configs/leftwm/config.toml ~/.config/leftwm/config.toml
[ ! -d ~/.config/leftwm/themes ] && cp -r ~/configs/leftwm/themes  ~/.config/leftwm/themes
#Adding current themes
ln -s ~/.config/leftwm/themes/leftwm-theme-dracula-rounded ~/.config/leftwm/themes/current

[ -d ~/.config/lf ] && rm -rf ~/.config/lf
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

[ -d ~/.config/alacritty ] && rm -rf ~/.config/alacritty
mkdir ~/.config/alacritty
ln -s ~/configs/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old
ln -s ~/configs/tmux.conf ~/.tmux.conf

[ -f ~/.zshrc ] && mv ~/.zshrc ~/zshrc.old && ln -s ~/configs/zshrc ~/.zshrc
