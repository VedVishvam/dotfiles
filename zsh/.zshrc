# Set up the prompt

# This is done to fix max nested function level reached when using vim mode in zsh
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    echo "Load starship"
    eval "$(/usr/local/bin/starship init zsh)"
  }


setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases 
alias lt="tree -L 2"

# Start or Init cargo and rustup
. $HOME/.cargo/env

# Export Alacritty
export PATH="$PATH:/home/thevkvishvam/.cargo/bin"

# Plugins
source $HOME/plugins/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/thevkvishvam/plugins/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
