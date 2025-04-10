#----------------------- EDITOR -----------------------#
export EDITOR=nvim

#------------------------ PATH ------------------------#
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export K9S_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/k9s"

#--------------------- HOMEBREW -----------------------#
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#------------------- COMMAND CORRECTIONS --------------#
eval "$(thefuck --alias)"

#---------------- TERMINAL SETTINGS -------------------#
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#--------------------- PLUGINS ------------------------#
zinit load zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::aws
zinit snippet OMZP::direnv

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#--------------------- FZF and Zoxide -----------------#
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

#---------------- TERMINAL BINDINGS -------------------#
bindkey '^ ' autosuggest-accept

#--------------------- ALIASES ------------------------#
alias v="nvim"
alias h="nvim ."
alias nvconf="cd ~/.config/nvim/ && nvim ."
alias zshconf="nvim ~/.zshrc"
alias poki="lsof -ti:3000-3010,3421,5173 | xargs kill"
alias ls='ls --color=auto'

#--------------------- COMPLETION ---------------------#
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#---------------------- HISTORY -----------------------#
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#-------------------- OH-MY-POSH ----------------------#
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

#------------------------ MISC ------------------------#
source "$HOME/.misc.zsh"


# bun completions
[ -s "/Users/elvin.baloku@schibsted.com/.bun/_bun" ] && source "/Users/elvin.baloku@schibsted.com/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/Users/elvin.baloku@schibsted.com/.deno/env"