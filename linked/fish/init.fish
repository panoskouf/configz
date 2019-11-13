# this file should be sourced by ~/.config/omf/init.fish
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
# https://github.com/oh-my-fish/oh-my-fish
# https://github.com/jorgebucaran/fish-cookbook
# https://github.com/brigand/fish-functions/tree/master/functions
# https://github.com/derekstavis/plugin-nvm

# light theme coffeeandcode
# dark theme

set fish_greeting ''

set DIR (dirname (readlink -m (status --current-filename)))

# todo move fish_vars to gitignored and add it to source control
test -f $DIR/fish_vars
  and source $DIR/fish_vars
  or echo 'could not find file' $DIR/fish_vars

test -f $DIR/gitignored.fish
  and source $DIR/gitignored.fish
  or echo 'could not find file' $DIR/gitignored.fish

source $DIR/git_utils.fish
source $DIR/archive_utils.fish;
source $DIR/themes.fish;

alias sudo='sudo ';

function emacs --wraps emacs26
    nohup env XLIB_SKIP_ARGB_VISUALS=1 emacs26 $argv[1] >/dev/null 2>&1 &
end
alias e='emacs';
alias sue='sudo emacs';
set -Ux EDITOR 'emacs26 -nw'
set -Ux VISUAL 'env XLIB_SKIP_ARGB_VISUALS=1 emacs26'

# sudo sh -c "todo"

set -Ux SCRIPTS '/usr/local/scripts/'

function new_script
    set filename $argv[1]
    set ext $argv[2]
    if test -e $SCRIPTS$filename.$ext
	echo filename $filename.$ext  already exist
	return
    end
    if [ $ext = 'sh' ]
	echo '#!/bin/bash' > $SCRIPTS$filename.$ext
    else if [ $ext = 'fish' ]
	echo '#!/usr/bin/env fish' > $SCRIPTS$filename.$ext
    end
    chmod 755 $SCRIPTS$filename.$ext
    e $SCRIPTS$filename.$ext
end

function n_fish
    new_script $argv[1] 'fish'
end

function n_sh
    new_script $argv[1] 'sh'
end


alias config-nginx='sue /etc/nginx/nginx.conf'
alias logs-cron='tail -f /var/log/syslog'


alias h='htop';
alias suh='sudo htop';

alias c='code .'
alias d='env BROWSER=none npm run dev'
alias chrome-no-cors='cd ~/scratch; and nohup google-chrome --disable-web-security --user-data-dir=~/scratch > /dev/null 2>&1 &; prevd'
alias _~='sudo apt update'
alias _~~='sudo apt upgrade'
alias _~l='sudo apt list --upgradable'
alias hs='emacs26 -nw /etc/hosts'
alias suhs='sudo emacs26 -nw /etc/hosts'
alias vwh='cd /var/www/html/';
alias lan-ip="hostname -I | cut -d' ' -f1"
alias ex='exit';
alias lg='ls -la | grep ';
alias py3='python3';

# other
alias nomnom='rm -rf '
alias omr='omf reload'
# tree colorized output X leves deep
alias tr='tree -c -L 1 --sort=name'
alias tr2='tree -c -L 2 --sort=name'
alias tr3='tree -c -L 3 --sort=name'
alias trx='tree -c --sort=name -L '

alias l='ls -a --color=auto -I \'.\' -I \'..\' ';
alias ll='ls -lah --color=auto -I \'.\' -I \'..\' ';

alias drives='df -h';
alias usage='du -h -d1'

# scripts
alias lang='/usr/local/scripts/runOnBoot.sh';
alias λανγ='/usr/local/scripts/runOnBoot.sh';


# todo https://stackoverflow.com/questions/10312521/how-to-fetch-all-git-branches
# git --todo: checkout https://gist.github.com/james2doyle/6e8a120e31dbaa806a2f91478507314c
function g --wraps git
    git $argv;
end
alias g.='g add .'
alias gb='g branch'
alias gnb='g checkout -b '
alias grb='g branch -d '
alias grfb='g branch -D '
alias gcm='g commit -m'
alias ghcm='g commit --no-verify -m '
alias gl="g log --graph --oneline --pretty=format:'%C(reset) %C(#4a7aff)%h %C(magenta)-%C(#637a82)%d %s %C(#db9ad2)(%cr) %C(blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gla='g log --graph --decorate --oneline --abbrev-commit --all'
alias gma='g merge --abort'
alias gu='g push'
alias gd='g pull'
alias gdr='g pull --rebase'
alias gdnr='g pull --no-rebase'
alias gs='g status -sb'
alias gsp='g stash pop'
# https://github.com/so-fancy/diff-so-fancy
alias g~='g diff'
alias g~~='g diff --staged'
# todo these need autocompletions
alias ga='g add'
alias gap='g add -p'
alias gc='g commit'
# amend only for local commit
alias gca='g commit --amend'
alias gcl='g clone'
alias gco='g checkout'
alias master='gco master'
alias gm='g merge'
alias gr='g reset'

# delete unpushed commits # check git rebase --onto https://stackoverflow.com/questions/3197413/how-do-i-delete-unpushed-git-commits

# reset rewrites history, use it only for local not-pushed commits
# Delete the most recent commit, keeping the work you\'ve done'
alias gfs='git reset --soft HEAD~1'
# Delete the most recent commit, destroying the work you\'ve done
alias gfh='git reset --hard HEAD~1'
# revert does not rewrite history
# g revert HEAD~5 # this will revert just the 5th commit from the end
# g revert HEAD~5..HEAD # this will revert the last 5 commits

# more -> https://stackoverflow.com/questions/4114095/how-do-i-revert-a-git-repository-to-a-previous-commit

# https://stackoverflow.com/questions/4089430/how-can-i-determine-the-url-that-a-local-git-repository-was-originally-cloned-fr

#switch (uname)
#   case Darwin
#       # mac only config
#   case Linux
#       # linux only config
#end

# random commands
#printf 'woot: %s/%s' $newdirname $tmpname | paste -sd,
#https://bash.cyberciti.biz/guide/Numeric_comparison
# https://www.devdungeon.com/content/working-files-javascript-nodejsx

# to add default theme remove omr from _l to not cause inf loop

# check if these are good
# alias csv="paste -d, -s"
# alias mycon="mysql -A -h"
# The 'csv' alias is used when I have a list of items that I want to change to a CSV. My most used case is a situation when I have a file that contains id's, one per line, and I want to convert it to a MySQL IN list.

# Search for running processes.
# alias psg='ps -ef | grep '

# alias PANIC="espeak 'OH NO, the sky is falling'"

#A system notification to popup when a long shell task finishes:
# Display an "alert" after running commands.  Use like so:
#   sleep 10; alert "Done sleeping"
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# add get random password alias & dont save to history


# use https://github.com/wting/autojump ?

# https://askubuntu.com/questions/676017/how-to-make-notification-bubbles-with-custom-size-colour-and-position-using-com - osd cat notification
# https://forum.porteus.org/viewtopic.php?t=3902

# use https://github.com/sindresorhus/trash-cli and test nomnom

# check node notifier: https://davidwalsh.name/system-notifications-node

#fc-list see installed fonts on ubuntu derivatives

# echo "Porteus OSD" | osd_cat -A center  -s 5 -S black -c yellow -d 10 -f -bitstream-courier*10*pitch-medium-r-normal--150-0-0-0-m-0-iso8859-1*

#https://manned.org/osd_cat/6d60600c

# echo Hello | osd_cat -p middle -A center -f -bitstream-courier*10*pitch-medium-r-normal--150-0-0-0-m-0-iso8859-1*


# echo "Porteus OSD" | osd_cat -A center  -s 5 -S black -c red -d 1 -f -bitstream-courier*10*pitch-medium-r-normal--150-0-0-0-m-0-iso8859-1*
# -d is time (above)


# https://bbs.archlinux.org/viewtopic.php?id=147456
# osd_cat --font=-*-fixed-bold-r-*-*-18-*-*-*-*-*-*-* --shadow=1 --color=#1E90FF \
#  --pos=bottom --offset=30 --align=center --lines=2 --delay=5 --barmode=percentage
# remove hases since it contains a new line

# https://gist.github.com/netzverweigerer/696b71c45e1adf1097ec

# osd_cat -b slider --text="test"

# also check zenity
# check more here https://bbs.archlinux.org/viewtopic.php?id=103881

# multiple smooth osd_cat
# https://gist.github.com/netzverweigerer/696b71c45e1adf1097ec

# notify-send " " -h string:synchronous:volume -h int:value:50 -h string:x-canonical-private-synchronous:script

# [[https://elementaryos.stackexchange.com/questions/14276/notify-send-icon-custom-png][notifications - notify-send icon: custom png - elementary OS Stack Exchange]]
