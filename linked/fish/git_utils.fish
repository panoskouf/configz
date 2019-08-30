
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
