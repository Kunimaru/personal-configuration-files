# Basics
export LANG=en_US.UTF-8
export PATH="$PATH"

autoload -Uz colors
colors
autoload -Uz compinit
compinit

# Key Bindings
bindkey -v
bindkey "^[[3~" delete-char
stty erase "^?"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_all_dups hist_reduce_blanks

# Other Options
setopt auto_cd
setopt correct
setopt print_eight_bit
setopt no_flow_control ignore_eof
setopt no_beep
setopt extended_glob

# Prompt 
PROMPT="%(4/|%-1//…/%1/|%3/)%# "
RPROMPT="[%n@%m]"

# Completion 
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..

# History Search
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# VCS Info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# Aliases
alias sgui='export LANG=ja_JP.utf8 && mono ~/shogi/ShogiGUI/ShogiGUI.exe'
alias apt='sudo apt'

# Functions
function s() {
  for word in $*
  google-chrome "https://www.google.com/search?q=${word}" > /dev/null
}
