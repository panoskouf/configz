THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# $THISDIR is the path relative to system's root folder, this  way all configs will work no matter where the dotfiles repo is cloned


# LINK EMACS #todo maybe use printf
echo '' > ~/.emacs.d/init.el
echo '(setq emacsdir  "'$THISDIR/linked/emacs/'")' >> ~/.emacs.d/init.el
echo '(load-file "'$THISDIR/linked/emacs/init.el'")' >> ~/.emacs.d/init.el
# LINK FISH & BASH
echo 'source '$THISDIR/linked/fish/init.fish > ~/.config/omf/init.fish
echo 'source '$THISDIR/linked/.bashrc > ~/.bashrc
# LINK VSCODE CONFIGS
cd ~/.config/Code/User
mkdir snippets
rm -r keybindings.json settings.json snippets/*
cd $THISDIR/linked/vscode
vsdir=".config/Code/User"
ln keybindings.json ~/$vsdir/keybindings.json
ln settings.json ~/$vsdir/settings.json
ln snippets/javascript.json ~/$vsdir/snippets/javascript.json
ln snippets/javascriptreact.json ~/$vsdir/snippets/javascriptreact.json
# LINK PLANK THEMES
plankdir=".local/share/plank/themes"
mkdir ~/$plankdir
rm -rf ~/$plankdir/*
cd ~/$plankdir
mkdir haze_purple mate_blue cupertino_effect_black frost glassier mitis
cd $THISDIR/linked/plank_themes
ln haze_purple/dock.theme ~/$plankdir/haze_purple/dock.theme
ln mate_blue/dock.theme ~/$plankdir/mate_blue/dock.theme
ln cupertino_effect_black/dock.theme ~/$plankdir/cupertino_effect_black/dock.theme
ln frost/dock.theme ~/$plankdir/frost/dock.theme
ln glassier/dock.theme ~/$plankdir/glassier/dock.theme
ln mitis/dock.theme ~/$plankdir/mitis/dock.theme
