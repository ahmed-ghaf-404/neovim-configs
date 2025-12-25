-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- jk to exit insert mode
map("i", "jk", "<Esc>", opts)

-- START MOVING LINES

-- Move lines up/down (Normal mode)
vim.keymap.set("n", "<A-J>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==", { silent = true })

-- Move selected lines up/down (Visual mode)
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true })

-- Move current line up/down (Insert mode)
vim.keymap.set("i", "<A-J>", "<Esc>:m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<A-K>", "<Esc>:m .-2<CR>==gi", { silent = true })

-- END MOVING LINES
