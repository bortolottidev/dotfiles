# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ------- OLD CONFIGS --------

# alias ls='ls -alG'
#
# complete -C /opt/vault/vault vault

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Config brew in shell
eval $(/opt/homebrew/bin/brew shellenv)

# Config nvm in shell
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Fix command not found: compdef
autoload -Uz compinit
compinit
# Load kubectl commands
# source <(kubectl completion zsh)

# Tricks to avoid using sudo but install globally packages
# https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md
# NPM_PACKAGES="${HOME}/.npm-packages"
# alias ng='~/.npm-packages/bin/ng'
# alias firebase='~/.npm-packages/bin/firebase'
# alias heroku='~/.npm-packages/bin/heroku'
# alias ngh='~/.npm-packages/bin/ngh'
# alias nodemon='~/.npm-packages/bin/nodemon'
# alias gulp='~/.npm-packages/bin/gulp'
#
# export PATH="$PATH:$NPM_PACKAGES/bin"
# export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# ^ ------- OLD CONFIGS -------- ^

# Path to your oh-my-zsh installation.
export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/plugins/.oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"

# NVM installation
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  terraform
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export TZ="Europe/Rome"
export LANG="it_IT.UTF-8"
export LANGUAGE="it"
export LC_ALL="it_IT.UTF-8"

# Preferred editor for local and remote sessions
export EDITOR='nvim'
export VISUAL='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias n="nvim ."

export LOCAL_SHARE="/Users/danielebortolotti/.local/share"
export PATH="$LOCAL_SHARE:$PATH"

# pnpm
export PNPM_HOME="/Users/danielebortolotti/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
