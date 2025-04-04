-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<TAB>", "<CMD>FzfLua buffers sort_mru=true sort_lastused=true<CR>", { desc = "Pick buffers" })
vim.keymap.set("n", "<C-n>i", "<C-i>", { noremap = true, desc = "Move forward in jumplist" })

-- Toggle Window Diff
vim.keymap.set("n", "<leader>zd", function()
  -- Get the current window diff status
  local window_diff_status = vim.w.windowdiffstatus or "off"

  if window_diff_status == "off" then
    -- Enable diff mode in all windows
    vim.cmd("windo diffthis")
    vim.w.windowdiffstatus = "on"
  else
    -- Disable diff mode in all windows
    vim.cmd("windo diffoff")
    vim.w.windowdiffstatus = "off"
  end
end, { desc = "Toggle Window Diff" })
