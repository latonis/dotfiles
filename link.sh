#!/bin/bash

# linking .zshrc time
echo "[+] Linking .zshrc"

ln -s "$(pwd)/.zshrc" ~/.zshrc
rc=$?

if [ $rc -eq 0 ]; then
    echo "[+] .zshrc linked successfully"
else
    echo "[-] Failed to link .zshrc"
fi

# check if .config folder exists, if it doesn't congrats new environment!!
if [ ! -d ~/.config ]; then
    echo "[+] Creating .config folder"
    mkdir ~/.config
fi

echo "[+] All files linked"
