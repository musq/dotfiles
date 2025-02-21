-- Git integration for buffers
-- https://www.lazyvim.org/plugins/editor#gitsignsnvim
-- https://github.com/lewis6991/gitsigns.nvim#-keymaps
local gitsigns = require("gitsigns")

return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>hb", gitsigns.blame_line, desc = "Blame Line" },
    { "<leader>hB", gitsigns.blame, desc = "Blame Buffer" },

    { "<leader>hd", gitsigns.diffthis, desc = "Diff against index" },
    {
      "<leader>hD",
      function()
        gitsigns.diffthis("~")
      end,
      desc = "Diff against last commit",
    },

    { "<leader>hp", gitsigns.preview_hunk_inline, desc = "Preview Hunk Inline" },

    { "<leader>hr", gitsigns.reset_hunk, desc = "Reset Hunk" },
    {
      "<leader>hr",
      function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      desc = "Reset Hunk",
      mode = { "v" },
    },
    { "<leader>hR", gitsigns.reset_buffer, desc = "Reset Buffer" },

    { "<leader>hh", gitsigns.stage_hunk, desc = "Toggle Stage Hunk" },
    {
      "<leader>hh",
      function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      desc = "Toggle Stage Hunk",
      mode = { "v" },
    },
    { "<leader>hS", gitsigns.stage_buffer, desc = "Stage Buffer" },

    { "<leader>uB", gitsigns.toggle_current_line_blame, desc = "Toggle Current Line Blame" },
  },
}
