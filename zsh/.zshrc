export ZSH=$HOME/.oh-my-zsh

global_zsh_setup() {
  # settings
	# ZSH_THEME="robbyrussell"
	ZSH_THEME="colorblind"
	CASE_SENSITIVE="true"
	DISABLE_MAGIC_FUNCTIONS="true"

  # plugins
  plugins=(
    copyfile
    copypath
    1password
    aliases
    aws
    z
    node
    npm
    sudo
    vscode
    command-not-found
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
    gh
    gitignore
  )
}

alias_home_git() {
	alias h='git --work-tree=$home --git-dir=$home/.home.git'
  alias hs='h statusstagedonly'
  alias hd='h diff --staged'
}

alias_ls() {
	alias ll='ls -lha'
	alias l='ll'
}

alias_tmux() {
	alias td='tmux detach'
  alias ta='tmux attach'
  alias tsd='tmux new-session -d -t'
  alias t='tmux'
}

alias_common() {
	alias jl='jobs -l'
	alias v='vim'
	alias e='exit'
	alias c='clear'
}

alias_dir() {
	pg='~/Documents/playground'
}

export_env() {
	export LANG="en_US.UTF-8"
	export TERM="xterm-256color"
	export PATH="$HOME/go/bin:$PATH"
	export PATH="/usr/local/opt/openjdk/bin:$PATH"
	export PATH="/usr/local/opt/mysql-client/bin:$PATH"
	export PATH="/usr/local/opt/whois/bin:$PATH"
	export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/bin:$PATH"
  export PATH=$HOME/.local/bin:$PATH
}

execute_common() {
  # iterm2 shell integration
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
}

# execute functions
global_zsh_setup
source $ZSH/oh-my-zsh.sh

alias_home_git
alias_tmux
alias_ls
alias_dir
alias_common
export_env
