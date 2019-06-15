# https://github.com/oh-my-fish/oh-my-fish
# https://github.com/jorgebucaran/fish-cookbook
# https://github.com/brigand/fish-functions/tree/master/functions
# http://ridiculousfish.com/sphinx-demo/cmds/function.html

# todo: unzip alias https://linuxize.com/post/how-to-unzip-files-in-linux/

# themes: toaster batman scorphish

set fish_greeting ""

# import vars
test -f $HOME/.sh_vars_fish
  and source $HOME/.sh_vars_fish
  or echo 'could not find file ~/.sh_vars_fish'

alias sudo='sudo ';

# TODO: launch emacs with nohup
function emacs --wraps emacs26
    # --wraps inherits autocompletes
    env XLIB_SKIP_ARGB_VISUALS=1 emacs26 $argv;
end
alias e='emacs';
alias sue='sudo emacs';

alias h='htop';
alias suh='sudo htop';
alias l='ls -a --color=auto -I \'.\' -I \'..\' ';
alias ll='ls -lah --color=auto -I \'.\' -I \'..\' ';

# dev specific
alias hs='emacs -nw /etc/hosts';
alias c='code .';
alias d='env BROWSER=none npm run dev';

# other
alias nomnom='rm -rf ';
alias omr='omf reload';

# tree colorized output X levels deep
alias tr='tree -c -L 1 --sort=name';
alias tr2='tree -c -L 2 --sort=name';
alias tr3='tree -c -L 3 --sort=name';
alias trx='tree -c --sort=name -L ';

# git
function g --wraps git
    git $argv;
end
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --graph --decorate --oneline --abbrev-commit'
alias gla='git log --graph --decorate --oneline --abbrev-commit --all'
alias gm='git merge'
alias gu='git push'
alias gd='git pull'
alias gdr='git pull --rebase'
alias gdnr='git pull --no-rebase'
alias gr='git reset'
alias gs='git status -sb'
alias gsp='git stash pop'


# git who (am i)
function gw
    if test -e .git/config
        set r (cat .git/config | grep name)
        if [ $r ]
            set r (string split ' ' $r)
            echo ' -- '$r[3]
        else
            echo ' -- Global User'
        end
    else
        echo ' -- not a git repo'
    end
end

# TODO: https://superuser.com/questions/199507/how-do-i-ensure-git-doesnt-ask-me-for-my-github-username-and-password
if [ $VARS_SOURCED ]
    function gpanoskouf
        git init
        git config user.name $USER
        git config user.email $MAIL
        echo ' -- set PERSONAL credentials for git'
    end
end

# https://github.com/derekstavis/plugin-nvm

# TODO: add color for .org
if test -e ~/.dircolors
   switch (uname)
      # case Darwin
         # eval (dir..
      case Linux
         eval (dircolors -c ~/.dircolors)
   end
end

# pc dirs
alias cds='cd ~/scratch';
alias cdd='cd ~/documents';
alias cdm='cd ~/media';
alias cda='cd ~/archive';
alias vwh='cd /var/www/html/';
alias cdp='cd ~/documents/projects';
alias downloads='cd ~/downloads';
alias images='cd ~/media/images';
alias music='cd ~/media/music';
alias movies='cd ~/media/movies\ \&\ series/';
alias projects='cd ~/documents/projects';
alias scripts='cd /usr/local/scripts';
alias docs='cd ~/documentation';