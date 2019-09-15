DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo '(load-file "'$DIR/linked/init.el'")' > ~/.emacs.d/init.el
echo 'source '$DIR/linked/fish/init.fish > ~/.config/omf/init.fish
echo 'source '$DIR/linked/.bashrc > ~/.bashrc
# link vscode
cd ~/.config/Code/User
mkdir snippets
rm -r keybindings.json settings.json snippets/*
cd $DIR
cd linked/vscode
ln keybindings.json ~/.config/Code/User/keybindings.json
ln settings.json ~/.config/Code/User/settings.json
ln snippets/javascript.json ~/.config/Code/User/snippets/javascript.json
ln snippets/javascriptreact.json ~/.config/Code/User/snippets/javascriptreact.json
