# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set Variables
export NULLCMD=bat
export DOTFILES="$HOME/.dotfiles"


# Change ZSH Options

# alias
source $HOME/.aliases

# Adjust History Variables & Options
[[ -z $HISTFILE ]] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000 # Session Memory Limit
SAVEHIST=4000 # File Memory Limit
setopt histNoStore
setopt extendedHistory
setopt histIgnoreAllDups
unsetopt appendHistory # explicit and unnecessary
setopt incAppendHistoryTime

# Line Editor Options (Completion, Menu, Directory, etc.)
# autoMenu & autoList are on by default
setopt autoCd
setopt globDots

# Load history into shell (shareHistory alternative)
alias lh='fc -RI; echo "loaded and showing..."; history;'

# Customize Prompt(s)

# Add Locations to $path Array
typeset -U path

path=(
  "$N_PREFIX/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)


# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Ensure Brewfile is only created in ~/.dotfiles directory
function bbd() {

  local startingDirectory=$PWD;

  if [[ $startingDirectory != $DOTFILES ]]; then
    echo "Changing to $DOTFILES";
    cd $DOTFILES;
  fi

  echo "Dumping Brewfile";
  brew bundle dump --force --describe;

  if [[ $startingDirectory != $DOTFILES ]]; then
    echo "Returning to $startingDirectory";
    cd $startingDirectory;
  fi

}

# Use ZSH Plugins
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source <(antibody init)
antibody bundle < "$DOTFILES/antibody_plugins"


# ...and Other Surprises

# Change Key Bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Add "zstyles" for Completions & Other Things
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':plugin:history-search-multi-word' clear-on-cancel 'yes'

# Load "New" Completion System
autoload -Uz compinit && compinit

# source node
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# source pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# source rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
