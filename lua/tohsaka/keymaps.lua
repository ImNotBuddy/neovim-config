-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true } -- Default remap options

-- Netrw file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

-- Paste but don't overwrite the current register
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Delete but don't overwrite the current register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Save file, silently
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>silent w<cr><esc>", opts)

-- Indent line
vim.keymap.set("n", "<Tab>", ">>", opts)
vim.keymap.set("n", "<S-Tab>", "<<", opts)

-- Indent selection
vim.keymap.set("x", "<Tab>", ">gv", opts)
vim.keymap.set("x", "<S-Tab>", "<gv", opts)

-- Move between buffers with just <control> + direction
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", opts)
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", opts)
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", opts)
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", opts)

-- Resize window using <control> + arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!"<CR>')

-- Commenting
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", opts) -- Add comment below
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", opts) -- Add comment above

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qall<cr>", opts)

-- Open Lazy
vim.keymap.set("n", "<leader>l", "<cmd> Lazy <cr>", opts)
