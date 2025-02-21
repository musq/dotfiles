-- Automatically expand width of the current window

return {
  "anuvyklack/windows.nvim",
  dependencies = { "anuvyklack/middleclass" },
  opts = {
    autowidth = {
      winwidth = 30,
    },
  },
}
