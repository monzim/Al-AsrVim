local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ",", "<gv", opts)
keymap("v", ".", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)
-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- My keymaps
-- nnoremap <leader>w :up<CR>  --Write only if something is chnanged
-- keymap("n", "<leader>w", ":up<CR>", opts)
keymap("n", "<leader>w", ":up<CR>", opts)
keymap("n", "<leader>g", ":lua vim.lsp.buf.formatting()<CR>", opts)

keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)

--Own-Key
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzv", opts)

-- keymap("i", ",", "<C-g>u", opts)
-- keymap("i", ".", "<C-g>u", opts)
-- keymap("i", "!", "<C-g>u", opts)
-- keymap("i", "?", "<C-g>u", opts)

--Create NEw TAb
keymap("n", "<leader>n", ":tabnew<cr>", opts)
keymap("n", "<leader>c", ":tabclose<cr>", opts)

--For Split window
keymap("n", "<leader>v", ":vsplit<cr>", opts)
keymap("n", "<leader>h", ":split<cr>", opts)

---Telescope
-- lua require'telescope.builtin'.find_files({layout_strategy='horizontal',resolve_width=0.3,layout_config={width=0.8,height=0.8,}})

-- lua require'telescope.builtin'.find_files({layout_strategy='horizontal',winblend = 10,show_line = false,results_title = false,preview_title = false,layout_config = {preview_width = 0.5,},})

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>", opts)
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files({layout_strategy='horizontal',winblend = 10,show_line = false,results_title = false,preview_title = false,layout_config = {preview_width = 0.5,},})<cr>",
	opts
)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>l", "<cmd>lua require('telescope').extensions.flutter.commands()<cr>", opts)
