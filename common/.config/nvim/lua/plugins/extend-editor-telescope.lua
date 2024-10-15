-- Enable opening multiple files using multi selections
-- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1991532321
local select_one_or_multi = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require("telescope.actions").close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        if j.lnum ~= nil then
          -- Open file at the specified line number, if line number is provided
          vim.cmd(string.format("%s +%s %s", "edit", j.lnum, j.path))
        else
          -- Otherwise, open the file simply, without any other shenanigans
          vim.cmd(string.format("%s %s", "edit", j.path))
        end
        -- Center the current line to the middle of screen, if possible
        vim.cmd("normal zz")
      end
    end
  else
    require("telescope.actions").select_default(prompt_bufnr)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      -- Use top-down picker
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,

      -- Search within hidden files as well
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },

      mappings = {
        i = {
          -- Close Telescope window by pressing ESC even when in Insert mode
          ["<ESC>"] = require("telescope.actions").close,
          -- Enable opening multiple files from multi selections
          ["<CR>"] = select_one_or_multi,
        },
      },
    },
  },
}
