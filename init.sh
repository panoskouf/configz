DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo '(load-file "'$DIR/linked/init.el'")' > ~/.emacs.d/init.el
echo 'source '$DIR/linked/fish/init.fish > ~/.config/omf/init.fish
echo 'source '$DIR/linked/.bashrc > ~/.bashrc
