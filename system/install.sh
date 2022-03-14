#!/usr/bin/env bash
# NOT READY NOW
declare -r INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

function detect_platform_install_neovim_fzf() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
      echo "System Detected Arch"
        sudo pacman -S neovim fzf
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        echo "System Detected Fedora"
        sudo dnf install -y neovim fzf
      elif [ -f "/etc/gentoo-release" ]; then
        echo "System Detected Gentoo"
        emerge install -y neovim fzf
      else # assume debian based
        echo "System Detected Debian"
        sudo apt install -y neovim fzf
      fi
      ;;
    FreeBSD)
      sudo pkg install -y neovim fzf
      ;;
    NetBSD)
      sudo pkgin install neovim fzf
      ;;
    OpenBSD)
      doas pkg_add neovim fzf
      ;;
    Darwin)
      brew install neovim fzf
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

function backup_old_config() {
  local src="$LUNARVIM_CONFIG_DIR"
  if [ ! -d "$dir" ]; then
    return
  fi
  mkdir -p "$src.old"
  touch "$src/ignore"
  msg "Backing up old $src to $src.old"
  if command -v rsync &>/dev/null; then
    rsync --archive -hh --stats --partial --copy-links --cvs-exclude "$src"/ "$src.old"
  else
    OS="$(uname -s)"
    case "$OS" in
      Linux | *BSD)
        cp -r "$src/"* "$src.old/."
        ;;
      Darwin)
        cp -R "$src/"* "$src.old/."
        ;;
      *)
        echo "OS $OS is not currently supported."
        ;;
    esac
  fi
  msg "Backup operation complete"
}

function clone_config() {
  echo "Cloning Al-Asr_vim configuration 🌀"
  git clone https://github.com/Monzim/Al-AsrVim ~/.config/nvim
}

function remove_old_cache_files() {
  local packer_cache="$HOME/.config/nvim/plugin/packer_compiled.lua"
  if [ -e "$packer_cache" ]; then
    echo "Removing old packer cache file"
    rm -f "$packer_cache"
  fi
}

function setup_al_asr_vim() {
  remove_old_cache_files
  echo "Installing Al-Asr_vim 🤩"
  clone_config
  echo "Preparing Packer setup"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  echo "Packer setup complete"
}

logo(){

echo "    _   _      _               _       ";
echo "   /_\ | |___ /_\   ____ ___ _(_)_ __  ";
echo "  / _ \| |___/ _ \ (_-< '_\ V / | '  \ ";
echo " /_/ \_\_|  /_/ \_\/__/_|__\_/|_|_|_|_|";
echo "                       |___|           ";

}

logo
detect_platform_install_neovim_fzf
mkdir -p ~/.config/nvim
echo "Backup old config"
backup_old_config
setup_al_asr_vim
echo "**Please use a Patched Nerd Font for better experience**"
  echo "Thank you for installing Al-Asr_vim 😊"