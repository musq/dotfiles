return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Extend the default config, instead of overwriting it
    vim.list_extend(opts.ensure_installed, {
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    })
  end,
}
