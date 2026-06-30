-- https://www.lazyvim.org/extras/lang/php

require("lspconfig.configs")["phpantom_lsp"] = {
  default_config = {
    cmd = { "/opt/homebrew/bin/phpantom_lsp" },
    filetypes = { "php" },
    root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
    settings = {},
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "php", "php_only", "blade" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = { enabled = false },
        intelephense = { enabled = false },
        phpantom_lsp = { enabled = true },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- php = { "prettier", "rector", "pint" },
        php = { "prettier", "pint" },
        blade = { "prettier", "pint" },
      },
      formatters = {
        rector = {
          command = "vendor/bin/rector",
          args = { "process", "--no-ansi", "--no-diffs", "$FILENAME" },
          stdin = false,
          condition = function(self, ctx)
            local root = vim.fs.root(ctx.buf, { "composer.json", ".git" })
            if not root then
              return false
            end
            return vim.fn.filereadable(root .. "/vendor/bin/rector") == 1
          end,
        },
      },
    },
  },
}
