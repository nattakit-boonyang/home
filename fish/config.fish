set -Ux EDITOR nvim
set -U fish_greeting ""

# set default PATH
set PATH $PATH $HOME/go/bin
set PATH $PATH $HOME/.local/bin
set PATH $PATH /usr/local/bin
set PATH $PATH /usr/local/sbin
set PATH $PATH /usr/local/bin

# set default alias
alias fish_reload="source $HOME/.config/fish/config.fish"
alias ls="exa -g --color=always"
alias l="ls"
alias e="exit"
alias c="clear"
alias vim="nvim"
alias v="nvim"
alias vv="nvim ."

function otherwise
    # set PATH
    set PATH /usr/local/go/bin $PATH
    # alias
    alias pbcopy="xsel -b --input"
    alias pbpaste="xsel -b --output"
    if test -f /usr/bin/wslview
        alias ff="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe -p"
    end
    set -U nvm_default_version v22.2.0
end

function only_darwin
    # iterm2 shell integration
    source $HOME/.iterm2_shell_integration.fish
    # set PATH
    set PATH $PATH /usr/local/opt/openjdk/bin
    set PATH $PATH /usr/local/opt/mysql-client/bin
    set PATH $PATH /usr/local/opt/whois/bin
    set PATH $PATH $HOME/.spicetify
    # alias
    alias ff="open -a Firefox -n --args -p"
end

# select os
switch (uname)
    case Darwin
        only_darwin
    case '*'
        otherwise
end

# custom pure themes
set -U pure_symbol_prompt ""
set -U pure_show_system_time false
set -U pure_shorten_prompt_current_directory_length 1

# custom tmux
set -Ux fish_tmux_autostart false
set -Ux fish_tmux_autostart_once false
set -Ux fish_tmux_autoconnect false

# custom bindings for fzf
fzf_configure_bindings --history=\cr --directory=\cf --variables= --processes= --git_log= --git_status=

# delete git abbr
abbr --erase gup

# abbreviation last history
function last_history_item
    echo $history[1]
end
abbr --add !! --position anywhere --function last_history_item

# often use
function new_abbr
    abbr --add $argv[1] --position anywhere $argv[2]
end

# abbreviation tmux
new_abbr td "tmux detach"
new_abbr ta "tmux attach"
new_abbr tsd "tmux new-session -d -t"

# abbreviation docker
new_abbr dcu "docker compose up -d"
new_abbr dcd "docker compose down"
new_abbr dcp "docker compose ps -a"
new_abbr dcl "docker compose logs -f"

# abbreviation go package frequency used
new_abbr go_zerolog "github.com/rs/zerolog"
new_abbr go_testify "github.com/stretchr/testify"
new_abbr go_gin "github.com/gin-gonic/gin"
new_abbr go_echo "github.com/labstack/echo/v4"
new_abbr go_fiber "github.com/gofiber/fiber/v2"
new_abbr go_fasthttp "github.com/valyala/fasthttp"
new_abbr go_kafka_v2 "github.com/confluentinc/confluent-kafka-go/v2"
new_abbr go_dotenv "github.com/joho/godotenv"
new_abbr go_envconfig "github.com/kelseyhightower/envconfig"
new_abbr go_mongo "go.mongodb.org/mongo-driver/mongo"
new_abbr go_resty "github.com/go-resty/resty/v2"
new_abbr go_goquery "github.com/PuerkitoBio/goquery"

# abbreviation path
new_abbr "..." "../.."
new_abbr "...." "../../.."
new_abbr "....." "../../../.."
new_abbr "......" "../../../../.."
new_abbr "......." "../../../../../.."

# TODO: add fisher plugin detection
# jorgebucaran/fisher
# pure-fish/pure
# patrickf1/fzf.fish
# catppuccin/fish
# jorgebucaran/nvm.fish
# jethrokuan/z
