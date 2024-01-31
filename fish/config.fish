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
set PATH $PATH $HOME/.bin
set PATH $PATH $HOME/.spicetify

# custom pure themes
set --universal pure_symbol_prompt ""
set --universal pure_show_system_time false
set --universal pure_enable_k8s false
set --universal pure_shorten_prompt_current_directory_length 1

# custom tmux
set -Ux fish_tmux_autostart false
set -Ux fish_tmux_autostart_once false
set -Ux fish_tmux_autoconnect false

# custom done notification
set -U __done_exclude ''

# custom bindings for fzf
fzf_configure_bindings --history=\cr --directory=\cf --variables= --processes= --git_log= --git_status=

# alias ls/exa
alias ls="exa --color=always"
alias l="ls"

# alias shell
alias fish_reload="source $HOME/.config/fish/config.fish"
alias vim="nvim"
alias v="nvim"
alias e="exit"
alias c="clear"

# abbreviation last history
function last_history_item
    echo $history[1]
end
abbr --add !! --position anywhere --function last_history_item

# abbreviation tmux
abbr --add td "tmux detach"
abbr --add ta "tmux attach"
abbr --add tsd "tmux new-session -d -t"

# delete git abbr
abbr --erase gup

# often use
function new_abbr
  abbr --add $argv[1] --position anywhere $argv[2]
end

new_abbr go_zerolog   "github.com/rs/zerolog"
new_abbr go_testify   "github.com/stretchr/testify"
new_abbr go_gin       "github.com/gin-gonic/gin"
new_abbr go_echo      "github.com/labstack/echo/v4"
new_abbr go_fiber     "github.com/gofiber/fiber/v2"
new_abbr go_fasthttp  "github.com/valyala/fasthttp"
new_abbr go_kafka_v2  "github.com/confluentinc/confluent-kafka-go/v2"
new_abbr go_dotenv    "github.com/joho/godotenv"
new_abbr go_envconfig "github.com/kelseyhightower/envconfig"
new_abbr go_mongo     "go.mongodb.org/mongo-driver"

new_abbr "..." "../../.."
new_abbr "...." "../../../.."
new_abbr "....." "../../../../.."
new_abbr "......" "../../../../../.."
new_abbr "......." "../../../../../../.."
