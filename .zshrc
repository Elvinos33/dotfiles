#-----------------SSH------------------#
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

#----------------EDITOR----------------#
export EDITOR=nvim

#-----------------PATH-----------------#

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/home/elvin/.local/bin:$PATH"
eval $(thefuck --alias)

#-----------------TERMINAL SETTINGS-----------------#


bindkey '^ ' autosuggest-accept

#-----------------PLUGINS-----------------#

eval "$(zoxide init zsh)"

#-----------------ALIASES-----------------#

alias v="nvim"
alias h="nvim ."
alias nvconf="cd ~/.config/nvim/ && nvim ."

alias zshconf="nvim ~/.zshrc"
alias zsrc="source ~/.zshrc"

alias poki="lsof -ti:3000-3010,3421,5173 | xargs kill"

alias ls="eza --icons -F -H --group-directories-first --git -1"
alias cd="z"

#-----------------GIT-----------------#
gho() {
  originUrl=$(git config --get remote.origin.url)

  if [[ -z "$originUrl" ]]; then
    echo "No GitHub repository found."
    return 1
  fi

  if echo "$originUrl" | grep -q "^https://"; then
    webUrl=$(echo "$originUrl" | sed 's|\.git$||')
  else
    webUrl=$(echo "$originUrl" | sed 's|^git@\(.*\):|\1/|;s|\.git$||;s|^|https://|')
  fi

  xdg-open "$webUrl$1"
}

#-----------------FZF-----------------#

eval "$(fzf --zsh)"

#-----------------SYNTAX HIGHLIGHTING-----------------#
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ${ZDOTDIR:-$HOME}/.zshrc

#-----------------AUTOCOMPLETE-----------------#
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#-----------------SUBSTRING COMPLETION-----------------#
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
