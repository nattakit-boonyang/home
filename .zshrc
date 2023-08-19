export ZSH=$HOME/.oh-my-zsh

global_zsh_themes() {
  # clone robbyrussell theme
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

  PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )$USER"
  PROMPT+=" %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)
♜ "
}

global_zsh_setup() {
  ZSH_THEME=""
  CASE_SENSITIVE="true"
  DISABLE_MAGIC_FUNCTIONS="true"
}

global_zsh_plugins() {
  plugins=(
    web-search
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    fancy-ctrl-z
    gitignore
    golang
    tmux
    docker
    docker-compose
    kubectl
    macos
    brew
  )
}

alias_home_git() {
  alias h='git --work-tree=$HOME --git-dir=$HOME/.home.git'
}

alias_ls() {
  alias ll='ls -lha'
  alias l='ll'
}

alias_tmux() {
  alias td='tmux detach'
}

alias_common() {
  alias jl='jobs -l'
  alias v='vim'
  alias e='exit'
  alias c='clear'
}

alias_dir() {
  alias nvc='~/.config/nvim'
  alias pg='~/Documents/pg'
}

execute_common() {
  # enable autojump
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

  # iterm2 integration
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
}

export_env() {
  export LANG=en_US.UTF-8
  export PATH="$HOME/go/bin:$PATH"
  export PATH="/usr/local/opt/openjdk/bin:$PATH"
  export PATH="/usr/local/opt/mysql-client/bin:$PATH"
  export PATH="/usr/local/opt/whois/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/bin:$PATH"
}

# execute functions
global_zsh_setup
global_zsh_plugins

source $ZSH/oh-my-zsh.sh

global_zsh_themes
alias_home_git
alias_tmux
alias_ls
alias_dir
alias_common
export_env
execute_common
