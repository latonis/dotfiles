# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export TERM=xterm-256color
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dieter"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# if cargo installed
if [ -d "$HOME/.cargo" ]; then
    export PATH=$PATH:$HOME/.cargo/bin
fi

# if go installed
if command -v go &> /dev/null; then
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:/Users/jacoblatonis/go/bin
fi

# if platformio installed
if [ -d "$HOME/.platformio" ]; then
    export PATH=$PATH:$HOME/.platformio/penv/bin
fi

# if llvm installed
if [ -d "/opt/homebrew/opt/llvm" ]; then
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi

# if atuin installed
if [ -d "$HOME/.atuin" ]; then
    . "$HOME/.atuin/bin/env"
    eval "$(atuin init zsh)"
fi

if [ -d "$HOME/.bun" ]; then
    # bun completions
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
    # bun
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

if command -v nvm &> /dev/null; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# pnpm
if command -v pnpm &> /dev/null; then
    export PNPM_HOME="$HOME/Library/pnpm"
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi
# pnpm end

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
if command -v juliaup &> /dev/null; then
    path=('/Users/jacoblatonis/.juliaup/bin' $path)
    export PATH
fi
# <<< juliaup initialize <<<

if command -v zellij &> /dev/null; then
    eval "$(zellij setup --generate-auto-start zsh)"
fi

alias ls="eza --icons"
alias cat=bat
alias gs="git stash && git switch main"
alias emacs="emacs -nw"
