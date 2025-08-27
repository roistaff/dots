function git_dirty_info {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}

function git_branch_info {
  git_branch=$(git branch 2>/dev/null | sed -n '/\* /s///p')
  git_dirty=$(git_dirty_info)
  color=$([[ -n $git_dirty ]] && echo "%F{yellow}" || echo "%F{green}")
  [[ -n $git_branch ]] && echo " ${color} (${git_branch}${git_dirty})"
}

function virtualenv_info() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
      echo "(%F{white}$(basename $VIRTUAL_ENV)%f) "
  fi
}

setopt prompt_subst
setxkbmap jp
prompt() {
  local last_status=$?
  local prompt_color=$([[ $last_status -eq 0 ]] && echo "%F{green}" || echo "%F{red}")
  
  PS1="$(virtualenv_info)$(pwd | sed "s|^$HOME|~|")$(git_branch_info) ${prompt_color}￫ %F{reset}"
}

precmd_functions+=(prompt)
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
alias less='less -R'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
