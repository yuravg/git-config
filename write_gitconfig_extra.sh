#!/usr/bin/env bash

# Script to write extra git configuration file

FNAME=".gitconfig_extra"

HEADER="# NOTE: this file was auto-generated, do not modify!"


UNIX_OS_TXT="$HEADER

[web]
    browser = firefox
"

WINDOWS_OS_TXT="$HEADER
"

if [ "$(uname)" = Linux ]; then
    TXT="$UNIX_OS_TXT"
else
    TXT="$WINDOWS_OS_TXT"
fi

echo "Write extra Git configuration to $FNAME:"
echo ""
echo "$TXT"
echo ""
TMP_FNAME="${FNAME}_tmp"
echo "$TXT" > "$TMP_FNAME"

TARGET_FNAME="$HOME/$FNAME"

cp -iv "$TMP_FNAME" "$HOME/$FNAME"
rm -rf "$TMP_FNAME"
echo "Done."
