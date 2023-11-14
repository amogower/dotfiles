#!/usr/bin/env zsh

asdf_runtimes=false
brew=false
duti_settings=false
fonts=false
mas=false
system_settings=false
verbose_mode=false

usage() {
  echo "Usage: $0 [OPTIONS]"
  echo "Options:"
  echo " -h, --help        Display this help message"
  echo " -v, --verbose     Enable verbose mode"
  echo " -a, --all         Install everything"
  echo " -b, --brew        Install Brewfile"
  echo " -c, --casks       Install brew casks"
  echo " -d, --duti        Set default applications for file types with duti"
  echo " -f, --fonts       Install fonts"
  echo " -m, --mas         Install Apple App Store apps with mas"
  echo " -r, --runtimes    Install asdf to manage runtimes"
  echo " -s, --system      Customise system settings"
}

has_argument() {
  [[ ("$1" == *=* && -n ${1#*=}) || ( ! -z "$2" && "$2" != -*)  ]];
}

extract_argument() {
  echo "${2:-${1#*=}}"
}

# Function to handle options and arguments
handle_options() {
  while [ $# -gt 0 ]; do
    case $1 in
      -h | --help)
        usage
        exit 0
        ;;
      -v | --verbose)
        verbose_mode=true
        ;;
      -a | --all)
        asdf_runtimes=true
        backround_services=true
        brew_casks=true
        brew_packages=true
        duti_settings=true
        fonts=true
        mas=true
        system_settings=true
        ;;
      -b | --background)
        backround_services=true
        ;;
      -c | --casks)
        brew_casks=true
        ;;
      -d | --duti)
        duti_settings=true
        ;;
      -f | --fonts)
        fonts=true
        ;;
      -m | --mas)
        mas=true
        ;;
      -p | --packages)
      brew_packages=true
      ;;
    -r | --runtimes)
      asdf_runtimes=true
      ;;
    -s | --system)
      system_settings=true
      ;;
    *)
      echo "Invalid option: $1" >&2
      usage
      exit 1
      ;;
  esac
  shift
done
}

# Perform the desired actions based on the provided flags and arguments
if [ "$verbose_mode" = true ]; then
  echo "Verbose mode enabled."
fi

# xcode commandline tools
if ! xcode-select -p > /dev/null; then
  if [ "$verbose_mode" = true ]; then
    echo "Installing commandline tools..."
  fi
  xcode-select --install
fi

# zap-zsh
if ! zap > /dev/null; then
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
  rm .zshrc
fi

# dotfiles
if [ "$verbose_mode" = true ]; then
  echo "Checking out configuration files to ${HOME}"
fi
[ ! -d "$HOME/dotfiles" ] && git clone --bare https://github.com/amogower/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout
source $HOME/.zshrc

# Homebrew
## Install
if [ "$verbose_mode" = true ]; then
  echo "Installing brew..."
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
brew bundle

# Misc binaries
echo "Installing other misc binaries..."
curl -sSf https://sshx.io/get | sh

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

# Add .zshrc items that require all of the above installed
cat .zshrc_post_install >> $HOME/.zshrc
source $HOME/.zshrc

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
