-- A collection of QoL plugins for Neovim
--
-- > Visualize indent guides and scopes based on treesitter or indent
-- > https://github.com/folke/snacks.nvim/blob/main/docs/indent.md

return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      indent = {
        char = "▏",
      },
      scope = {
        char = "▏",
      },
    },
  },
}
