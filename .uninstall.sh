NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
rm -rf /opt/homebrew/Frameworks/ /opt/homebrew/bin/ /opt/homebrew/etc/ /opt/homebrew/include/ /opt/homebrew/lib/ /opt/homebrew/opt/ /opt/homebrew/sbin/ /opt/homebrew/share/ /opt/homebrew/var/
rm "${XDG_DATA_HOME:-$HOME/.gitconfig}" "${XDG_DATA_HOME:-$HOME/.gitignore}" "${XDG_DATA_HOME:-$HOME/.install.sh}" "${XDG_DATA_HOME:-$HOME/.uninstall.sh}" "${XDG_DATA_HOME:-$HOME/.skhdrc}" "${XDG_DATA_HOME:-$HOME/.taskrc}" "${XDG_DATA_HOME:-$HOME/.tool-versions}" "${XDG_DATA_HOME:-$HOME/.zshrc}" "${XDG_DATA_HOME:-$HOME/karabiner.edn}"
rm -rf "${XDG_DATA_HOME:-$HOME/.config}/alacritty" "${XDG_DATA_HOME:-$HOME/.config}/karabiner" "${XDG_DATA_HOME:-$HOME/.config}/kitty" "${XDG_DATA_HOME:-$HOME/.config}/nvim" "${XDG_DATA_HOME:-$HOME/.config}/sketchybar" "${XDG_DATA_HOME:-$HOME/.config}/tmux" "${XDG_DATA_HOME:-$HOME/.config}/yabai" "${XDG_DATA_HOME:-$HOME/.config}/zsh"
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/zap"
rm -rf "${XDG_DATA_HOME:-$HOME/dotfiles}"
