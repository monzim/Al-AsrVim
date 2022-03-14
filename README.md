<img src="https://github.com/Monzim/Al-AsrVim/blob/main/system/Header-v1.jpg?raw=true">

<div align="center"><p>

  <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/monzim/Al-AsrVim?style=for-the-badge">  <img alt="Last commit" src="https://img.shields.io/github/last-commit/monzim/Al-AsrVim?style=for-the-badge"/>   ![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white) ![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white) 
</p>

</div>


## Features

Can be used as vs-code alternative

- Packer
- LSP
- Syntax Highlight
- Formatting
- Customization

## Installation


### Linux Single commad install:

```bash
bash <(curl -s https://raw.githubusercontent.com/Monzim/Al-AsrVim/main/system/install.sh)
```

NOTE: MAY NOT WORK THIS FOR YOUR IF TRY MANUAL INSTALL

## Manual Installation

#### Arch Linux

`sudo pacman -Syy neovim fzf`

#### Debian/Ubuntu

`sudo apt-get install neovim fzf`

#### Create a new directory for neovim config

`mkdir -p ~/.config/nvim`

#### Clone Al-AsrVim repo to ~/.config/nvim/

`git clone https://github.com/Monzim/Al-AsrVim ~/.config/nvim`

#### Install Packer

`git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

#### Start Neovim

`nvim`

#### Install Plugins

`:PackerInsatll`

#### Close neovim and start again

`:q!`
`nvim`
Enjoy

## KeyMaps

[NotionNote](https://ultra-pilot-b2f.notion.site/Al-Asr_vim-fee9ce43084d4f0f94ede176cce0da12) or [doc](https://github.com/Monzim/Al-AsrVim/wiki)


## Screenshots

<div align="center"><p>
  
![App Screenshot](https://github.com/Monzim/Al-AsrVim/blob/main/system/screenshot/my-1neovim.png?raw=true)

![App Screenshot](https://github.com/Monzim/Al-AsrVim/blob/main/system/screenshot/my-3neovim.png?raw=true)

![App Screenshot](https://github.com/Monzim/Al-AsrVim/blob/main/system/screenshot/my-4neovim.png?raw=true)

![App Screenshot](https://github.com/Monzim/Al-AsrVim/blob/main/system/screenshot/my-8neovim.png?raw=true)
  
</p>

</div>


## This project fully inspired by [LunarVim](https://github.com/LunarVim/LunarVim). You can watch this tutorial of LunarVim creator: [Neovim from Scratch](https://youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
