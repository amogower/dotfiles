#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install zap-zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# Copying and checking out configuration files
echo "Checking out configuration files to ${HOME}"
[ ! -d "$HOME/dotfiles" ] && git clone --bare https://github.com/amogower/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master

# Reload zsh
source $HOME/.zshrc

# Homebrew
## Install
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping brew..."
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap koekeishiya/formulae
brew tap FelixKratz/formulae
brew tap hashicorp/tap

## Formulae
echo "Installing brew formulae..."
### Essentials
brew install git
brew install git-delta
brew install llvm
brew install wget
brew install jq
brew install ripgrep
brew install mas
brew install gh
brew install ifstat
brew install switchaudio-osx
brew install tmux
brew install fzf
brew install asdf
brew install bat
brew install eza
brew install tailspin
brew install stern
brew install duti
brew install foreman
brew install watch
brew install watchman
brew install trash
brew install gpg2
brew install gnupg
brew install pinentry-mac
brew install docker
brew install kubectl
brew install kubectx
brew install hashicorp/tap/terraform
brew install helm
brew install flyctl
brew install redis
brew install task
brew install timewarrior
brew install dooit
brew install skhd
brew install sketchybar
brew install borders
brew install yabai
brew install nnn
brew install jesseduffield/lazygit/lazygit

## Casks
echo "Installing brew casks..."
### Terminals & Browsers
brew install --cask alacritty
brew install --cask kitty
brew install --cask arc

### Utils
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask karabiner-elements
brew install --cask alt-tab
brew install --cask setapp
brew install --cask appcleaner
brew install --cask google-cloud-sdk

### Dev
brew install --cask colima
brew install --cask visual-studio-code
brew install --cask visual-studio-code-insiders
brew install --cask jetbrains-toolbox
brew install --cask postman
brew install --cask herd
brew install --cask tinkerwell
brew install --cask helo
brew install --cask dbngin

### Work
brew install --cask microsoft-teams
brew instsal --cask microsoft-office
brew install --cask microsoft-remote-desktop
brew install --cask slack

### Reversing
brew install --cask machoview
brew install --cask hex-fiend
brew install --cask cutter
brew install --cask sloth

### Nice to have
brew install --cask beeper
brew install --cask raycast
brew install --cask krisp
brew install --cask whatsapp

### Fonts
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-fira-code-nerd-font

# Mac App Store Apps
echo "Installing App Store apps..."
mas install 1451685025 # Wireguard
mas install 497799835 # Xcode

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Set default apps
duti -s com.microsoft.VSCodeInsiders .css all
duti -s com.microsoft.VSCodeInsiders .js all
duti -s com.microsoft.VSCodeInsiders .jsx all
duti -s com.microsoft.VSCodeInsiders .ts all
duti -s com.microsoft.VSCodeInsiders .tsx all
duti -s com.microsoft.VSCodeInsiders .go all
duti -s com.microsoft.VSCodeInsiders .py all
duti -s com.microsoft.VSCodeInsiders .rb all
duti -s com.microsoft.VSCodeInsiders .php all
duti -s com.microsoft.VSCodeInsiders .java all
duti -s com.microsoft.VSCodeInsiders .c all
duti -s com.microsoft.VSCodeInsiders .h all
duti -s com.microsoft.VSCodeInsiders .cpp all
duti -s com.microsoft.VSCodeInsiders .hpp all
duti -s com.microsoft.VSCodeInsiders .rs all
duti -s com.microsoft.VSCodeInsiders .md all
duti -s com.microsoft.VSCodeInsiders .json all
duti -s com.microsoft.VSCodeInsiders .yml all
duti -s com.microsoft.VSCodeInsiders .yaml all
duti -s com.microsoft.VSCodeInsiders .toml all
duti -s com.microsoft.VSCodeInsiders .xml all
duti -s com.microsoft.VSCodeInsiders .svg all
duti -s com.microsoft.VSCodeInsiders .txt all
duti -s com.microsoft.VSCodeInsiders .md all
duti -s com.microsoft.VSCodeInsiders .log all
duti -s com.microsoft.VSCodeInsiders .conf all
duti -s com.microsoft.VSCodeInsiders .ini all
duti -s com.microsoft.VSCodeInsiders .env all
duti -s com.microsoft.VSCodeInsiders .gitignore all
duti -s com.microsoft.VSCodeInsiders .gitattributes all
duti -s com.microsoft.VSCodeInsiders .lock all

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Installing asdf plugins
asdf plugin add bun
asdf install bun latest
asdf plugin add deno
asdf install deno latest
asdf plugin add direnv
asdf direnv setup --shell zsh --version latest
asdf plugin add java
asdf install java latest
asdf plugin add neovim
asdf install neovim latest
asdf plugin add nodejs
asdf install nodejs latest
asdf plugin add pnpm
asdf install pnpm latest
asdf plugin add python
asdf install python latest

source $HOME/.zshrc

cat .zshrc_post_install >> $HOME/.zshrc

cfg config --local status.showUntrackedFiles no

# Start Services
echo "Starting background services..."
brew services start redis
brew services start skhd
yabai --start-service
brew services start sketchybar
brew services start borders

csrutil status
echo "Do not forget to disable SIP..."
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Installation complete...\n"
