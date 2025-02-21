-- https://www.lazyvim.org/plugins/treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Extend the default config, instead of overwriting it
    vim.list_extend(opts.ensure_installed, {
      "bash",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "query",
      "regex",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    })
  end,
}
