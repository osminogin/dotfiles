# Path configuration
export JAVA_HOME=/opt/jdk-8
export GNUPGHOME=/media/veracrypt1/data/gnupg
export DART_HOME=/opt/flutter/bin/cache/dart-sdk
export FLUTTER_HOME=/opt/flutter
export ANDROID_HOME=/opt/android-sdk
export GOPATH=$HOME/Projects/go
export GOROOT=/opt/go
export PATH=$HOME/.local/bin:$HOME/.pub-cache/bin:$HOME/.krew/bin:$JAVA_HOME/bin:$PATH:$FLUTTER_HOME/bin:$DART_HOME/bin:$GOROOT/bin:$HOME/Projects/go/bin:$FLUTTER_HOME/bin/cache/dart-sdk/bin

# Path to your oh-my-zsh installation.
export ZSH=/home/oc/Public/dotfiles/oh-my-zsh
export ZSH_CUSTOM=/home/oc/Public/dotfiles/oh-my-zsh/custom

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

source $ZSH/oh-my-zsh.sh

# If the $term variable is xterm, change it to 258 colors!
if [ "$TERM" = "xterm" ]; then
    export TERM="xterm-256color"
fi

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^K' kill-line
bindkey '^U' kill-whole-line
bindkey '^T' forward-char
bindkey '`' autosuggest-accept

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias pe="pipenv"
alias kc="kubectl"

# Base17
BASE16_SHELL=$HOME/.config/base16-shell/

[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#if [ /usr/bin/kubectl ]; then source <(kubectl completion zsh); fi
