-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Basic options
local opt = vim.opt

opt.number = true           -- show line numbers
opt.relativenumber = true   -- relative numbers
opt.expandtab = true        -- spaces instead of tabs
opt.shiftwidth = 2          -- indentation size
opt.tabstop = 2
opt.smartindent = true
opt.clipboard = "unnamedplus"  -- system clipboard

-- Add more basic options as you need
