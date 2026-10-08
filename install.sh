#!/usr/bin/env bash
set -e

echo "🚀 Setting up workstation..."

# 1. Install Homebrew if absent
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Install all CLI packages, casks, and fonts
echo "📦 Installing Homebrew packages..."
brew bundle --file=~/dotfiles/Brewfile

# 3. Create config directories & symlinks
echo "🔗 Linking configuration files..."
mkdir -p ~/.config/ghostty ~/.config/fastfetch

ln -sf ~/dotfiles/aerospace/aerospace.toml ~/.aerospace.toml
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
ln -sf ~/dotfiles/zshrc ~/.zshrc
cp -r ~/dotfiles/fastfetch ~/.config/ 2>/dev/null || true

# 4. Silence macOS login banner
touch ~/.hushlogin

echo "✅ Setup complete! Reload Ghostty to apply."
