"git.ignoreMissingGitWarning": true,


"new component": {
    "prefix": "_nc",
    "body": [
      "import { makeStyles } from '@material-ui/core/styles'",
      "import Layout from '../Layout';",
      "",
      "",
      "const useStyles = makeStyles(() => ({",
      "",
      "}))",
      "",
      "export default function() {",
      "  const s = useStyles()",
      "",
      "  return (",
      "    <Layout>",
      "      $0",
      "    </Layout>",
      "  )",
      "",
      "}"
    ]
  }


todo port to zsh


# git who (am i)
function gw
    # this only works if you are at root
    if test -e .git/config
        set r (cat .git/config | grep name)
        if [ $r ]
            set r (string split ' ' $r)
            echo '      '$r[3]
        else
            echo '      Global User'
        end
    else
        echo '      not a git repo'
    end
end

if [ $VARS_SOURCED ]
    function gpanos
        git config user.name $GIT_USERNAME
        git config user.email $GIT_MAIL
        echo '     PERSONAL credentials for git configured.'
    end

    function gwork
        git config user.name $GIT_WORK_USERNAME
        git config user.email $GIT_WORK_MAIL
        echo '     WORK credentials for git configured.'
    end
end


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


alias youtube-dl-best='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" '
alias youtube-dl-480='youtube-dl -f "bestvideo[height<=480][ext=mp4]+bestaudio[ext=m4a]" '
alias youtube-dl-720='youtube-dl -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]" '
alias youtube-dl-4k='echo -e "This will transcode the video from webm to h264 which could take a long time\n\n"; youtube-dl -f "bestvideo[ext=webm]+bestaudio[ext=m4a]" --recode-video mp4 '
alias youtube-dl-mp3='youtube-dl --extract-audio -f bestaudio[ext=mp3] --no-playlist '
# extract audio  with ffmpeg -i source.mp4 new.mp3

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

# [[https://elementaryos.stackexchange.com/questions/14276/notify-send-icon-custom-png][notifications - notify-send icon: custom png - elementary OS Stack



alias ram='free -h'
# create a ram partition
alias ram4g='sudo mkdir -p /mnt/ram; and sudo mount -t tmpfs tmpfs /mnt/ram -o size=4096M'

# key should be in gdrive set directory
alias cl='gdrive --service-account gdrive-sync-key.json'

alias config-nginx='sue /etc/nginx/nginx.conf'
alias logs-cron='tail -f /var/log/syslog'

alias h='htop';
alias suh='sudo htop';
alias hs='http-server -c-1';

# find file
alias ff='find ~/ -name '
# find document
alias fd='find ~/Dropbox/documentation -name '
# tree -f | grep filename



function emacs --wraps emacs26
    nohup env XLIB_SKIP_ARGB_VISUALS=1 emacs26 $argv[1] >/dev/null 2>&1 &
end
alias e='emacs';
alias sue='sudo emacs';
set -Ux EDITOR 'emacs26 -nw'
set -Ux VISUAL 'env XLIB_SKIP_ARGB_VISUALS=1 emacs26'