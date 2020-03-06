#!/usr/bin/env bash

# Installation script
#
# it creates symbolic links in the HOME directory pointing to local files
#

echo "Make links:"

mklink () {
    fname="$1"
    ln -v -s $(pwd)/"$fname" "$HOME/$fname"
}

mklink .gitconfig
mklink .gitignore_global
mklink .gitmessage
