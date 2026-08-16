#!/bin/bash

dependencies=("git" "emacs" "brew" "zellij" "bat" "eza")

for dep in "${dependencies[@]}"; do
    if ! command -v "$dep" &> /dev/null; then
        echo "[-] Required dependency not found: $dep"
        exit 1
    fi
    echo "[+] Dependency found: $dep"
done

echo "[+] All required dependencies are installed"
