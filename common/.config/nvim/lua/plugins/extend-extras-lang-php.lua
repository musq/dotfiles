-- https://www.lazyvim.org/extras/lang/php

return {
  -- Ensure PHP tools are installed
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "phpactor", "phpcs", "php-cs-fixer" } },
  },

  -- https://github.com/mfussenegger/nvim-lint#usage
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
    },
  },

  -- https://github.com/stevearc/conform.nvim#setup
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        php = { "php_cs_fixer" },
      },
    },
  },
}
