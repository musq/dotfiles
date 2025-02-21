-- https://www.lazyvim.org/extras/lang/python

return {
  -- Ensure Python tools are installed
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "black", "isort", "flake8", "mypy", "ruff" } },
  },

  -- https://github.com/mfussenegger/nvim-lint#usage
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- python = { "flake8", "mypy" },
        -- python = { "ruff", "mypy" },
        python = { "mypy" },
      },
    },
  },

  -- https://github.com/stevearc/conform.nvim#setup
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        -- python = { "isort", "black" },
        python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      },
    },
  },
}
