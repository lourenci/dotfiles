[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--cycle --reverse --bind ctrl-j:jump-accept,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-f:page-down,ctrl-b:page-up'

if [[ -z $TMUX ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [[ -z "$TERMINAL_EMULATOR" ]]; then # don't change editor for jetbrains terminal (it doesn't support some nvim plugins)
	export EDITOR="nvim"
fi

export GPG_TTY=$(tty)
export LC_ALL='en_US.UTF-8'
export HISTCONTROL=ignoreboth

alias g="git"
alias ll="ls -lah"

set-tool-version() {
  if [ $# -ne 2 ]; then
	echo "Usage: set-tool-version <tool> <version>"
	return 1
  fi

  asdf direnv local $1 $2
}

set-global-tool-version() {
  if [ $# -ne 2 ]; then
	echo "Usage: set-global-tool-version <tool> <version>"
	return 1
  fi

  cd ~ && asdf direnv local $1 $2 && cd -
}

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

KEYTIMEOUT=1 # remove timeout
# Insensitive tab-completion
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Set PROMPT colors
autoload colors && colors

local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local reset="%{$reset_color%}"

local current_dir_color=$blue
local current_dir="%~"

local current_dir_output="$current_dir_color$current_dir$reset"
local jobs_bg="${red}%j ⚙$reset"
local last_command_output="%(?.%(!.$red.$green).$yellow)"

PROMPT="$current_dir_output%1(j. [$jobs_bg].)"
PROMPT+="
$last_command_output\$$reset "

############# show the elapsed time
zmodload zsh/datetime

prompt_preexec() {
  prompt_prexec_realtime=${EPOCHREALTIME}
}

prompt_precmd() {
  if (( prompt_prexec_realtime )); then
    local -rF elapsed_realtime=$(( EPOCHREALTIME - prompt_prexec_realtime ))
    local -rF s=$(( elapsed_realtime%60 ))
    local -ri elapsed_s=${elapsed_realtime}
    local -ri m=$(( (elapsed_s/60)%60 ))
    local -ri h=$(( elapsed_s/3600 ))
    if (( h > 0 )); then
      printf -v prompt_elapsed_time '%ih%im' ${h} ${m}
    elif (( m > 0 )); then
      printf -v prompt_elapsed_time '%im%is' ${m} ${s}
    elif (( s >= 10 )); then
      printf -v prompt_elapsed_time '%.2fs' ${s} # 12.34s
    elif (( s >= 1 )); then
      printf -v prompt_elapsed_time '%.3fs' ${s} # 1.234s
    else
      printf -v prompt_elapsed_time '%ims' $(( s*1000 ))
    fi
    unset prompt_prexec_realtime
  else
    # Clear previous result when hitting ENTER with no command to execute
    unset prompt_elapsed_time
  fi
}

setopt nopromptbang prompt{cr,percent,sp,subst}

autoload -Uz add-zsh-hook
add-zsh-hook preexec prompt_preexec
add-zsh-hook precmd prompt_precmd

RPS1='%F{cyan}${prompt_elapsed_time}%F{none}'

###### end of elapsed time

source ~/fzf-tab/fzf-tab.plugin.zsh

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"

export DIRENV_LOG_FORMAT=
export ASDF_DIRENV_IGNORE_MISSING_PLUGINS=1
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

[ -f ~/.ignored-zshrc ] && source ~/.ignored-zshrc # Use this to put sensible things
