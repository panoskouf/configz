# archive utils

# alias for rar,zip are you sure you want unzip and not unzip1?
function rar1 --wraps rar
    if test ( count $argv ) -ne 1
        echo "rar1 expects one argument"
        return 1
    end

    set newfile (string replace / "" "$argv[1]")
    rar a $newfile.rar $argv[1]
end

function unrar1 --wraps unrar
    if test ( count $argv ) -ne 1
        echo "unrar1 expects one argument"
        return 1
    end

    if not test -e $argv[1]
        echo "file: $argv[1] does not exist"
        return 1
    end

    set newdirname (string split -r -m1 . $argv[1])[1]
    if test -d $newdirname
        echo "directory: $newdirname already exists"
        return 1
    end

    mkdir $newdirname
    unrar e $argv[1] $newdirname

    # check if folder contains folder of same name and fix it
    set folderRepeats (echo "$newdirname/$newdirname")
    if test -d $folderRepeats
        set tmpname (echo "TEMP$newdirname")
        mv $newdirname $tmpname
        set foo (echo "$tmpname/$newdirname")
        mv $foo .
        rm -rf $tmpname
        echo "fixed repeating folder"
    end
end

function zip1p --wraps zip
    if test ( count $argv ) -ne 1
        echo "zip1 expects one argument"
        return 1
    end

    set newfile (string replace / "" "$argv[1]")
    zip --encrypt -r $newfile.zip $argv[1]
end

function zip1 --wraps zip
    if test ( count $argv ) -ne 1
        echo "zip1 expects one argument"
        return 1
    end

    set newfile (string replace / "" "$argv[1]")
    zip -r $newfile.zip $argv[1]
end

# extracts to a directory with the same name of zipfile
function unzip1 --wraps unzip
    if test ( count $argv ) -ne 1
        echo "unzip1 expects one argument"
        return 1
    end

    set newdirname (string split -r -m1 . $argv[1])[1]
    if test -d $newdirname
        echo "directory $newdirname already exists"
        return 1
    end

    unzip $argv[1] -d $newdirname

    # check if folder contains folder of same name and fix it
    set folderRepeats (echo "$newdirname/$newdirname")
    if test -d $folderRepeats
        set tmpname (echo "TEMP$newdirname")
        mv $newdirname $tmpname
        set foo (echo "$tmpname/$newdirname")
        mv $foo .
        rm -rf $tmpname
        echo "fixed repeating folder"
    end
end
