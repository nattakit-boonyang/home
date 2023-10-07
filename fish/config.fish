# iterm2 shell integration
source $HOME/.iterm2_shell_integration.fish

# editor: nvim
set -Ux EDITOR nvim

# empty greeting
set -U fish_greeting ""

# append PATH
set PATH $PATH /usr/local/bin
set PATH $PATH $HOME/go/bin 
set PATH $PATH /usr/local/opt/openjdk/bin
set PATH $PATH /usr/local/opt/mysql-client/bin
set PATH $PATH /usr/local/opt/whois/bin
set PATH $PATH /usr/local/sbin
set PATH $PATH /usr/local/bin
set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/.nvim-macos/bin
set MANPATH $HOME/.nvim-macos/share/man

# custom pure themes
set --universal pure_symbol_prompt ""
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
alias l="ls"

# alias tmux
alias td="tmux detach"
alias ta="tmux attach"
alias tsd="tmux new-session -d -t"

# alias shell
alias fish_reload="source $HOME/.config/fish/config.fish"
alias jl="jobs -l"
alias vim="nvim"
alias v="nvim"
alias e="exit"
alias c="clear"
alias zz="zellij"

# delete git abbr
abbr --erase gup

# often use
function new_abbr
  abbr --add $argv[1] --position anywhere $argv[2]
end

new_abbr gozerolog "github.com/rs/zerolog"
new_abbr gotestify "github.com/stretchr/testify"
new_abbr gogin "github.com/gin-gonic/gin"
new_abbr goecho "github.com/labstack/echo/v4"
new_abbr gofiber "github.com/gofiber/fiber/v2"
