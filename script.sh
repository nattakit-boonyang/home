# TODO: macos backup preferences -> (https://github.com/lra/mackup)
# TODO: generate ssh key (notes)

# install brew (https://brew.sh/)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# disable sent analytics
brew analytics off

# install homebrew-bundle for non-ruby dependencies
# https://github.com/Homebrew/homebrew-bundle
brew bundle

# install font downloader
# https://github.com/Homebrew/homebrew-cask-fonts
brew tap homebrew/cask-fonts

# install applications
brew install firefox 1password neovim visual-studio-code gh node yarn iterm2 php python3 postman \
	dbeaver-community xquartz tor-browser vmware-fusion lazygit docker docker-compose colima kubectl raspberry-pi-image \
	balenaEtcher ghidra vnc-viewer

# install cli tools
brew install zsh fish fzf mas p7zip paragon-ntfs tmux rg mysql-client whois tree openjdk jq rust exa bat fd trash fswatch

# install programming language
brew install go # golang
brew install nao1215/tap/gup

# qmk
brew install qmk/qmk/qmk
brew install armmbed/formulae/arm-none-eabi-gcc # fix arm-none-eabi-gcc not found

# install application on apple store
mas install 497799835 \ # Xcode
1342896380 \ # Hex Fiend
1156815020 \ # BullVPN
1429033973 \ # RunCat
441258766 \ # Magnet
425424353 \ # The Unarchiver
539883307 \ # LINE
747648890 \ # Telegram
1444383602 \ # Goodnotes 6
409183694 \ # Keynote
1278508951 # Trello

# install fonts
brew install font-fira-code font-fira-code-nerd-font # fira-code

# link nvim to vim/vi
sudo ln -s /usr/local/bin/nvim /usr/local/bin/vim
sudo ln -s /usr/local/bin/nvim /usr/local/bin/vi

# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# tmux (tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# iterm2 (shell integration)
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

# enable touch id for sudo
# edit /etc/pam.d/sudo
# auth       sufficient     pam_tid.so

# oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# fisher for fish shell
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# install plugins
fisher install pure-fish/pure
fisher install jethrokuan/z
fisher install PatrickF1/fzf.fish
fisher install markcial/upto
fisher install jhillyerd/plugin-git
fisher install budimanjojo/tmux.fish
