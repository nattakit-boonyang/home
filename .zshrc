export ZSH=$HOME/.oh-my-zsh

global_zsh_setup() {
  # settings
	ZSH_THEME="colorblind"
	CASE_SENSITIVE="true"
	DISABLE_MAGIC_FUNCTIONS="true"

  # plugins
  source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
	plugins=(
    copyfile
    copypath
    1password
    aliases
    autojump
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
	export LANG="en_US.UTF-8"
	export TERM="xterm-256color"
	export PATH="$HOME/go/bin:$PATH"
	export PATH="/usr/local/opt/openjdk/bin:$PATH"
	export PATH="/usr/local/opt/mysql-client/bin:$PATH"
	export PATH="/usr/local/opt/whois/bin:$PATH"
	export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/bin:$PATH"
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
execute_common
