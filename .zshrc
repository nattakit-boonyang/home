export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
DISABLE_MAGIC_FUNCTIONS="true"

# zsh plugins
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	docker
	docker-compose
	fzf
	brew
	fancy-ctrl-z
	gitignore
	golang
	kubectl
	macos
	nmap
	tmux
)

source $ZSH/oh-my-zsh.sh

prompt_context() {
	prompt_segment white black "🐾 $USER"
}
build_prompt() {
	RETVAL=$?
	prompt_status
	prompt_virtualenv
	prompt_context
	prompt_dir
	prompt_git
	prompt_hg
	prompt_end
}
PROMPT='%{%f%b%k%}$(build_prompt)
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )'

# alias home git
alias home='git --work-tree=$HOME --git-dir=$HOME/.home.git'
alias h='home'
alias ha='h add'
alias hc='h commit'
alias hs='h status'
alias hsu='h status -uno'
alias hd='h icdiff'
alias hds='h icdiff --staged'
alias hl='h lp'
alias hps='h push'
alias hpl='h pull'
alias ham="ha \$(hsu -s | awk '{print \$2}')"

# alias git
alias gitw='git -c core.sshCommand="ssh -i ~/.ssh/id_rsa_work"'

# alias ls
alias ll='ls -lha'

# alias tmux
alias td='tmux detach'

# alias common
alias jl='jobs -l'
alias v='vim'
alias e='exit'
alias c='clear'

# export environment
export LANG=en_US.UTF-8
export PATH="$HOME/go/bin:$PATH"
export PATH="/Users/kk/Library/Python/3.9/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/bin:/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/whois/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# must set last
export PATH="/usr/local/bin:$PATH"

# enable autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

