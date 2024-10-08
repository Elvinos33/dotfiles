
#----------------------- EDITOR -----------------------#
export EDITOR=nvim

#------------------------ PATH ------------------------#
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.scripts"

#------------------- COMMAND CORRECTIONS --------------#
eval $(thefuck --alias)

#---------------- TERMINAL SETTINGS -------------------#
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

bindkey '^ ' autosuggest-accept

#--------------------- PLUGINS ------------------------#
eval "$(zoxide init zsh)"

#--------------------- ALIASES ------------------------#
alias v="nvim"
alias h="nvim ."
alias nvconf="cd ~/.config/nvim/ && nvim ."
alias zshconf="nvim ~/.zshrc"
alias poki="lsof -ti:3000-3010,3421,5173 | xargs kill"
alias ls="eza --icons -F -H --group-directories-first --git -1"
alias cd="z"

#---------------------- FZF ---------------------------#
eval "$(fzf --zsh)"

#--------------------- PLUGINS ------------------------#
zinit load zsh-users/zsh-history-substring-search
zinit load zsh-users/zsh-syntax-highlighting
zinit load zsh-users/zsh-autosuggestions

zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/aws.plugin.zsh

#-------------------- OH-MY-POSH ----------------------#
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"


