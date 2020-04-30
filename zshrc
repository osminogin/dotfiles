export DOTFILES=~/Projects/dotfiles
export JAVA_HOME=/opt/jdk-8
export DART_HOME=/opt/flutter/bin/cache/dart-sdk
export FLUTTER_HOME=/opt/flutter
export ANDROID_HOME=/home/oc/Android/Sdk/
export GOPATH=$HOME/go
export CHROME_EXECUTABLE=chromium
export PATH=$HOME/.local/bin:$HOME/.pub-cache/bin:$HOME/.krew/bin:$JAVA_HOME/bin:$PATH:$FLUTTER_HOME/bin:$DART_HOME/bin:$GOROOT/bin:$HOME/Projects/go/bin:$FLUTTER_HOME/bin/cache/dart-sdk/bin

# Path to your oh-my-zsh installation.
export ZSH=$DOTFILES/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/oh-my-zsh/custom

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wezm"

ZSH_AUTOSUGGEST_USE_ASYNC="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	gitfast
	docker
	docker-compose
	celery
	django
	vi-mode
	tmux
	systemd
	pip
	pipenv
	gpg-agent
	zsh-autosuggestions
	sudo
	npm
	common-aliases
	aws
	postgres
	helm
	kubectl
	rsync
)

# If the $term variable is xterm, change it to 258 colors!
if [ "$TERM" = "xterm" ]; then
    export TERM="xterm-256color"
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Key bindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^K' kill-line
bindkey '^U' kill-whole-line
bindkey '^T' forward-char
bindkey '`' autosuggest-accept


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshconfig="$EDITOR ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias pe="pipenv"
alias kc="kubectl"
alias apt="sudo apt"
alias mount="sudo mount"

# Oh my zsh include
source $ZSH/oh-my-zsh.sh

# Base16 shell
source $DOTFILES/base16-shell/base16-shell.plugin.zsh

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i
