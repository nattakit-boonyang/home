# iterm2 shell integration
source $HOME/.iterm2_shell_integration.fish

# editor: nvim
set -Ux EDITOR nvim

# empty greeting
set -U fish_greeting

# append PATH
set PATH $PATH /usr/local/bin
set PATH $PATH $HOME/go/bin 
set PATH $PATH /usr/local/opt/openjdk/bin
set PATH $PATH /usr/local/opt/mysql-client/bin
set PATH $PATH /usr/local/opt/whois/bin
set PATH $PATH /usr/local/sbin
set PATH $PATH /usr/local/bin
set PATH $PATH $HOME/.local/bin

# custom pure themes
set --universal pure_symbol_prompt ""
set --universal pure_show_system_time false
set --universal pure_enable_k8s false
set --universal pure_shorten_prompt_current_directory_length 1

# custom tmux
set -Ux fish_tmux_autostart false
set -Ux fish_tmux_autostart_once false
set -Ux fish_tmux_autoconnect false

# custom bindings for fzf
fzf_configure_bindings --history=\cr --directory=\cf --variables= --processes= --git_log= --git_status=

# alias ls/exa
alias ls="exa --color=always"

# alias tmux
alias td="tmux detach"
alias ta="tmux attach"
alias tsd="tmux new-session -d -t"

# alias shell
alias jl="jobs -l"
alias v="vim"
alias e="exit"
alias c="clear"

