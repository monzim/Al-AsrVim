local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "nvim-lualine/lualine.nvim" -- A lua line plugin for Neovim
  -- use "beauwilliams/statusline.lua" -- A statusline plugin for Neovim
  use "windwp/windline.nvim" -- A statusline plugin for Neovim

  
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"

  --- Utilities
  -- use "wakatime/vim-wakatime" -- Track your time need api key from wakatime.com

  -- Telescope
  --- Please install ripgrep {https://github.com/BurntSushi/ripgrep#installation} for live grep support
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim' --For viewing Image requrie "ueberzug" intall with pip
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  ---Colors Schemes
  use "morhetz/gruvbox" --Popular One
  use "tomasiser/vim-code-dark" -- Dark+ scheme of Visual Studio Code.
  use "folke/tokyonight.nvim" -- Ine of best supported colorscheme.
  use "dracula/vim"
  use "tomasr/molokai"
  use "LunarVim/darkplus.nvim"
  --use "Mofiqul/dracula.nvim" --comunity version
  use "joshdick/onedark.vim"
  use  "sainnhe/gruvbox-material"
  use "Mangeshrex/uwu.vim"
  use "ayu-theme/ayu-vim"
  use "bluz71/vim-moonfly-colors"
  use "kaicataldo/material.vim"
  use "srcery-colors/srcery-vim"

  --Color Highlight show hex color
  use "norcalli/nvim-colorizer.lua"


  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

    -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- use "SirVer/ultisnips" -- For Sinppets
  -- use "natebosch/dartlang-snippets" -- Dart snippets

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  --- Flutter Development
  use "akinsho/flutter-tools.nvim" -- LSP for flutter
  use "glepnir/lspsaga.nvim" -- Required for flutter

  -- Treesitter     for -- Syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" -- Color braket for treesitter

    -- Git
  use "lewis6991/gitsigns.nvim"



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
