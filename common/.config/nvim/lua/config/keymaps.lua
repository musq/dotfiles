-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<TAB>", "<CMD>FzfLua buffers sort_mru=true sort_lastused=true<CR>", { desc = "Pick buffers" })
vim.keymap.set("n", "<C-n>i", "<C-i>", { noremap = true, desc = "Move forward in jumplist" })
