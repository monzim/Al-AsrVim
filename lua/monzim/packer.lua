-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    -- Telescope is a fuzzy finder over lists. You can search over
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Harpoon
    use("ThePrimeagen/harpoon")
    use({
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end,
    })
    use({
        "feline-nvim/feline.nvim",
        requires = {
            { "SmiteshP/nvim-gps" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = true,
            })
        end,
    })

    --- Utilities
    use("github/copilot.vim") -- Copilot

    -- use 'mfussenegger/nvim-dap' -- Debug
    -- use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" },
    --
    -- }
    -- --Tabline
    -- use("nvim-lua/lsp-status.nvim") --More information in statusline
    -- use({
    --     "noib3/nvim-cokeline",
    --     requires = "kyazdani42/nvim-web-devicons", -- If you want devicons
    -- }) --Best Tabline

    -- Theme and colors
    use("joshdick/onedark.vim")
    use("olimorris/onedarkpro.nvim")

    -- Undo Tree of Undo Manage
    use("mbbill/undotree")
    use("RRethy/vim-illuminate")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("tpope/vim-fugitive")

    -- Terminal
    use({
        "akinsho/toggleterm.nvim",
    })

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional
            -- { "jose-elias-alvarez/null-ls.nvim" }, -- My addition

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    })

    -- Dart and flutter
    use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })

    use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

    -- Comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })
    use("kyazdani42/nvim-web-devicons")
    use("lewis6991/gitsigns.nvim") -- Git Line
    -- use("p00f/nvim-ts-rainbow") -- Color braket for treesitter
    use({
        "mrjones2014/nvim-ts-rainbow",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    -- ...
                },
                -- ...
                rainbow = {
                    enable = true,
                    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = nil, -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                },
            })
        end,
    })

    -- use{
    --     'junegunn/fzf',
    --     requires ={
    --         "junegunn/fzf.vim"
    --     }
    -- }

    --
end)
