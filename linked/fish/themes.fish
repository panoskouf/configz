function _change_theme
    rm $DIR/fish_prompt.fish
    omf theme $argv[1]
    omr
    # todo add fallback if theme does not exist or is not installed
end

# https://stackoverflow.com/questions/11283625/overwrite-last-line-on-terminal

function setGitLightColors
    # npm i -g diff-so-fancy
    # git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

    git config --global color.ui true

    git config --global color.status.branch   "#22ba57"
    git config --global color.status.nobranch "#ff3636"
    git config --global color.status.header   "#788e96"

    git config --global color.status.added     "#22ba57"
    git config --global color.status.changed   "#ff3636"
    git config --global color.status.untracked "#3369ff"

    git config --global color.branch.current "#22ba57"
    git config --global color.branch.remote  "#ff3636"
    git config --global color.branch.local   "#788e96"

    git config --global color.decorate.branch       "#22ba57"
    git config --global color.decorate.remoteBranch "#ff3636"
    git config --global color.decorate.tag          "#4a7aff"
    git config --global color.diff.commit           "#4a7aff"

    git config --global color.diff-highlight.oldNormal    "#ff6161 bold"
    git config --global color.diff-highlight.oldHighlight "#ff6161 bold 52"
    git config --global color.diff-highlight.newNormal    "#40e379 bold"
    git config --global color.diff-highlight.newHighlight "#40e379 bold 22"

    git config --global color.diff.meta       "#788e96 bold"
    git config --global color.diff.frag       "magenta"
    git config --global color.diff.old        "#ff6161 bold"
    git config --global color.diff.new        "#40e379 bold"
    git config --global color.diff.whitespace "#ff6161 reverse"
end

# set light theme
function _l1
    set DIR (dirname (readlink -m (status --current-filename)))
    # todo custom dircolors per theme # dircolors config in init.fish for now
    # for these one use the same but make it not bold

    # custom colors for commands
    source $DIR/light_vars_1.fish

    # custom prompt theme # do I need to rm first ?
    ln -sf $DIR/light_prompt_1.fish ~/.config/fish/functions/fish_prompt.fish

    # change terminal background and light/dark variant
    gsettings set io.elementary.terminal.settings background 'rgba(253, 246, 227, 0.95)'
    gsettings set io.elementary.terminal.settings prefer-dark-style false
    # check io.elementary.terminal.settings in dconf-editor for more settings

    # todo: maybe also change plank

    setGitLightColors

    # maybe instead of clear, eat lines (but check if colors change)
    clear
    omr
end

# https://www.reddit.com/r/elementaryos/comments/cjn1x5/179_color_schemes_for_your_gtkbased_linux/

# terminal dark theme
function _d
    # https://gist.github.com/denolfe/66a2827bd5fabedff447
    # https://gist.github.com/davidgomes/5162998
    echo 'not implemented yet'
end

if test -e $DIR/dircolors
    eval (dircolors -c $DIR/dircolors)
end
