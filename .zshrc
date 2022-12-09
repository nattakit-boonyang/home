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

# alias home git
alias home='git --work-tree=$HOME --git-dir=$HOME/.home.git'
alias h='home'
alias ha='h a'
alias hc='h c'
alias hs='h s'
alias hsu='h s -uno'
alias hd='h d'
alias hds='h d --staged'
alias hl='h lp'
alias hps='h ps'
alias hpl='h pl'

# alias git
alias gitw='git -c core.sshCommand="ssh -i ~/.ssh/id_rsa_work"'

# alias ls
alias ll='ls -lha'

# alias common
alias e='exit'
alias c='clear'

# export environment
export LANG=en_US.UTF-8
export PATH="/usr/local/opt/php@7.4/bin:/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# enable autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# enable iterm2 shell integration feature
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
