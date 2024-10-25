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
alias ls="eza -g --color=always"
alias cat="bat"
alias l="ls"
alias e="exit"
alias c="clear"
alias vim="nvim"
alias v="nvim"
alias vv="nvim ."
alias python="python3"
alias ggup="gup"
alias commit="go-git-commit-date"

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
    set -x BROWSER open
    set -x HOMEBREW_NO_ANALYTICS 1
    # path
    set PATH /opt/homebrew/bin $PATH
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
set -U pure_symbol_prompt "󰄛"
set -U pure_show_system_time false
set -U pure_shorten_prompt_current_directory_length 1

# custom bindings for fzf
fzf --fish | source
fzf_configure_bindings --history=\cr --directory=\cf --variables= --processes= --git_log= --git_status=

# abbreviation last history
function last_history_item
    echo $history[1]
end
abbr --add !! --position anywhere --function last_history_item

# often use
function new_abbr
    abbr --add $argv[1] --position anywhere $argv[2]
end

# abbreviation github cli
new_abbr ghv "gh repo view -w"
new_abbr ghcp "gh repo create --source=. --remote=origin --private"
new_abbr ghcu "gh repo create --source=. --remote=origin --public"
new_abbr glv "glab repo view -w"
new_abbr glmc "glab mr create --remove-source-branch --squash-before-merge --target-branch="
new_abbr glmcm "glab mr create --remove-source-branch --squash-before-merge --target-branch=main"
new_abbr glmcd "glab mr create --remove-source-branch --squash-before-merge --target-branch=develop"

# abbreviation git
new_abbr gds "git diff --staged"
new_abbr grsh "git reset --soft HEAD^"
new_abbr gcue "git config user.email nattakit.boonyang@gmail.com"

# abbreviation tmux
new_abbr td "tmux detach"
new_abbr ta "tmux attach"
new_abbr tls "tmux list-sessions"
new_abbr tn "tmux new-session"

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

function go_new_poc
  set -l go_version 1.$(go env GOVERSION | awk -F'.' '{print $2}')
  go mod init poc
  go mod edit -go=$go_version
  go get -u github.com/rs/zerolog
  echo -e "package main\n\nfunc main() {\n\n}\n" > main.go
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.fish.inc" ]; . "$HOME/.google-cloud-sdk/path.fish.inc"; end

function fish_init
  # install fisher and plugins
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher install pure-fish/pure
  fisher install patrickf1/fzf.fish
  fisher install catppuccin/fish
  fisher install jorgebucaran/nvm.fish
  fisher install jethrokuan/z
  fisher install jhillyerd/plugin-git

  # install go tools
  go install golang.org/x/tools/cmd/callgraph@latest
  go install github.com/go-delve/delve/cmd/dlv@latest
  go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
  go install github.com/davidrjenni/reftools/cmd/fillswitch@latest
  go install github.com/onsi/ginkgo/v2/ginkgo@latest
  go install github.com/abice/go-enum@latest
  go install mvdan.cc/gofumpt@latest
  go install golang.org/x/tools/cmd/goimports@latest
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  go install github.com/segmentio/golines@latest
  go install github.com/fatih/gomodifytags@latest
  go install github.com/abenz1267/gomvp@latest
  go install golang.org/x/tools/cmd/gonew@latest
  go install github.com/haya14busa/goplay/cmd/goplay@latest
  go install golang.org/x/tools/gopls@latest
  go install golang.org/x/tools/cmd/gorename@latest
  go install github.com/cweill/gotests/gotests@latest
  go install gotest.tools/gotestsum@latest
  go install golang.org/x/vuln/cmd/govulncheck@latest
  go install github.com/nao1215/gup@latest
  go install golang.org/x/tools/cmd/guru@latest
  go install github.com/koron/iferr@latest
  go install github.com/josharian/impl@latest
  go install github.com/tmc/json-to-struct@latest
  go install github.com/jesseduffield/lazygit@latest
  go install go.uber.org/mock/mockgen@latest
  go install github.com/kyoh86/richgo@latest
  go install honnef.co/go/tools/cmd/staticcheck@latest
  go install github.com/jesseduffield/lazygit@latest
  go install github.com/vektra/mockery/v2@latest
  go install github.com/bufbuild/buf/cmd/buf@latest
  go install gitlab.com/gitlab-org/cli/cmd/glab@latest
  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
end

