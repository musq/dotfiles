-- Quickly view class and functions in a file in an outline window

return {
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
  },
}
