-- Enhanced increment/decrement plugin for Neovim
-- https://www.lazyvim.org/extras/editor/dial

return {
  "monaqa/dial.nvim",
  keys = {
    -- Use + and _ to increment and decrement respectively
    -- dial.nvim uses C-A and C-X keymappings by default
    -- So we proxy + and _ keystrokes to C-A and C-X respectively.
    { "+", "<CMD>normal <C-A><CR>", desc = "Increment", mode = { "n", "v" } },
    { "_", "<CMD>normal <C-X><CR>", desc = "Decrement", mode = { "n", "v" } },
    { "g+", "<CMD>normal g<C-A><CR>", desc = "Increment", mode = { "n", "v" } },
    { "g_", "<CMD>normal g<C-X><CR>", desc = "Decrement", mode = { "n", "v" } },
  },
}
