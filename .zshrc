# eomebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Codes/toolbox/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# GPG TTY
export GPG_TTY=$(tty)

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# golang
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
if which goenv > /dev/null; then eval "$(goenv init -)"; fi
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Deno
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then export FPATH="$HOME/.zsh/completions:$FPATH"; fi
. "$HOME/.deno/env"

# ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# Entire CLI shell completion
autoload -Uz compinit && compinit && source <(entire completion zsh)
