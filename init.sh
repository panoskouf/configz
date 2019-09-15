THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# LINK EMACS, FISH & BASH
echo '(load-file "'$DIR/linked/init.el'")' > ~/.emacs.d/init.el
echo 'source '$DIR/linked/fish/init.fish > ~/.config/omf/init.fish
echo 'source '$DIR/linked/.bashrc > ~/.bashrc
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
