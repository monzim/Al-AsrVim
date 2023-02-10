## Backup old config

```bash
# required
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

# Installation

- Requires Neovim 0.8.0 or higher

- Require Packer

### Install Packer

```bash
# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install config

```bash
# install config
git clone https://github.com/Monzim/Al-AsrVim ~/.config/nvim
```

## Install plugins

```bash
# open nvim and run :PackerInstall
nvim
```
