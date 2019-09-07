# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/magnuspastuhoff/.oh-my-zsh"

# EXPORTS
export PGDATA=/usr/local/var/postgres
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="~/Library/Android/sdk/platform-tools:$PATH"

#Theme
ZSH_THEME="simple"

#Plugins
plugins=(
  git
)

#Source it
source $ZSH/oh-my-zsh.sh

# ALIASES
# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# Default editor
export EDITOR=/usr/bin/vim

#Custom Scripts
alias rnc='~/code/scripts/component_generator.zsh'
alias rns='~/code/scripts/scene_generator.zsh'
