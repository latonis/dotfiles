#!/bin/bash

# linking .zshrc time
echo "[+] Linking .zshrc"

ln -sf "$(pwd)/.zshrc" ~/.zshrc

echo "[+] Creating .config folder"
mkdir -p ~/.config

for dir in ./config/*/; do
    dir_path=$(realpath $dir)
    name=$(basename $dir_path)
    echo "[+] Linking $name"
    ln -sfn "$dir_path" ~/.config/$name
done

echo "[+] All files linked"
