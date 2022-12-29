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
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    fancy-ctrl-z
    gitignore
    golang
    tmux
  )
  if [[ $OSTYPE == 'darwin'* ]]; then
    plugins+=(
      docker
      docker-compose
      kubectl
      macos
      brew
    )
  fi
}

alias_home_git() {
  if [[ $OSTYPE == 'darwin'* ]]; then
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
  fi
}

alias_git() {
  alias gicd='git icdiff'
  alias gicds='git icdiff --staged'

  if [[ $OSTYPE == 'darwin'* ]]; then
    alias gw='git -c core.sshCommand="ssh -i ~/.ssh/id_rsa_work"'
  fi
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

alias_ssh() {
  function start_sc_server() {
    while true; do
      socat tcp-listen:34298 - | pbcopy
    done
  }
  alias sc='socat - tcp:localhost:34298'
  alias sc_server='start_sc_server'
}

alias_dir() {
  alias nvc='~/.config/nvim'

  if [[ $OSTYPE == 'linux-gnu'* ]]; then
    alias pg='~/playground'
  elif [[ $OSTYPE == 'darwin'* ]]; then
    alias pg='~/Documents/playground'
    alias wk='~/Documents/work'
  fi
}

alias_firefox() {
  if [[ $OSTYPE == 'darwin'* ]]; then
    alias ff_work='open -a Firefox.app -n --args -P Work'
  fi
}

alias_k8s() {
  if [[ $OSTYPE == 'darwin'* ]]; then
    alias kgvs='kubectl get virtualservice'
    alias kgvsa='kubectl get virtualservice --all-namespaces'
  fi
}

export_env() {
  export LANG=en_US.UTF-8
  export PATH="$HOME/go/bin:$PATH"

  if [[ $OSTYPE == 'linux-gnu'* ]]; then
  elif [[ $OSTYPE == 'darwin'* ]]; then
    export PATH="/Users/kk/Library/Python/3.9/bin:$PATH"
    export PATH="/usr/local/opt/php@7.4/bin:/usr/local/opt/php@7.4/sbin:$PATH"
    export PATH="/usr/local/opt/openjdk/bin:$PATH"
    export PATH="/usr/local/opt/mysql-client/bin:$PATH"
    export PATH="/usr/local/opt/whois/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/bin:$PATH"
  fi
}

execute_common() {
  # enable autojump
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

  if [[ $OSTYPE == 'linux-gnu'* ]]; then
  elif [[ $OSTYPE == 'darwin'* ]]; then
    # iterm2 integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  fi
}

# execute functions
global_zsh_setup
global_zsh_plugins

source $ZSH/oh-my-zsh.sh

global_zsh_themes

alias_firefox
alias_k8s
alias_tmux
alias_ssh
alias_ls
alias_home_git
alias_git
alias_dir
alias_common
export_env
execute_common
