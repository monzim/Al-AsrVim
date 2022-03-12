local onedarkpro = require("onedarkpro")
onedarkpro.setup({
	-- Theme can be overwritten with 'onedark' or 'onelight' as a string
	theme = function()
		if vim.o.background == "dark" then
			return "onedark"
		else
			return "onelight"
		end
	end,

	colors = {
		onedark = {
			-- bg = "#0D1117",
			bg = "#282C34",
			-- bg = "#222831",
			-- bg = "#1B262C",
			-- bg = "#101011",
			-- bg = "#171C27",
			-- bg = "#1D1F2D",
			-- bg = "#202838",
			purple = "#BA68C8",
		},
	}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
	hlgroups = {}, -- Override default highlight groups

	-- Override default highlight groups for specific filetypes
	filetype_hlgroups = {
		yaml = { -- Use the filetype as per the `set filetype?` command
			TSField = { fg = "${red}" },
		},
		python = {
			TSConstructor = { fg = "${bg}", bg = "${red}" },
		},
	},

	plugins = { -- Override which plugins highlight groups are loaded
		native_lsp = true,
		polygot = true,
		treesitter = true,
		-- windline = false,
		-- NOTE: Other plugins have been omitted for brevity
	},

	styles = {
		strings = "bold", -- Style that is applied to strings
		comments = "italic", -- Style that is applied to comments
		keywords = "bold,italic", -- Style that is applied to keywords
		functions = "italic", -- Style that is applied to functions
		variables = "NONE", -- Style that is applied to variables
	},

	options = {
		bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = false, -- Use the themes opinionated underline styles?
		undercurl = true, -- Use the themes opinionated undercurl styles?
		cursorline = true, -- Use cursorline highlighting?
		transparency = false, -- Use a transparent background?
		terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
		window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
	},
})
onedarkpro.load()
