-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable relative line numbers
vim.opt.relativenumber = false

-- Ensure a new line at the end of file
-- ...

-- https://www.lazyvim.org/extras/lang/python
-- Use basedpyright as Python LSP server instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
