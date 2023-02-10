local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<leader>Up", ":resize -2<CR>", opts)
keymap("n", "<leader>Down", ":resize +2<CR>", opts)
keymap("n", "<leader>Left", ":vertical resize -2<CR>", opts)
keymap("n", "<leader>Right", ":vertical resize +2<CR>", opts)

-- keymap("n", "<leader>Down", ":resize -2<CR>", opts)
-- keymap("n", "<leader>Up", ":resize +2<CR>", opts)
-- keymap("n", "<leader>Right", ":vertical resize -2<CR>", opts)
-- keymap("n", "<leader>Left", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)
keymap("n", "<leader>w", ":up<CR>", opts)
keymap("n", "<leader>g", ":lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)

keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":q!<CR>", opts)
keymap("n", "<leader>W", ":w<CR>", opts)
keymap("n", "<leader>WQ", ":wq<CR>", opts)


-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--IndentLine
keymap("n", "<leader>i", ":IndentLinesToggle<CR>", opts)

--Create New TAb
keymap("n", "<leader>n", ":tabnew<cr>", opts)
keymap("n", "<leader>c", ":tabclose<cr>", opts)

--For Split window
keymap("n", "<leader>v", ":vsplit<cr>", opts)
keymap("n", "<leader>h", ":split<cr>", opts)


-- nnoremap <leader>cr :w<CR>:!gcc % -o %< && ./%<CR>
keymap("n", "<leader>cr", ":w<CR>:!gcc % -o %< <CR>", opts)
-- write a keymap that will compile c code 
