-- https://www.lazyvim.org/extras/lang/php

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "php", "php_only", "blade" },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      local include = { "phpstan", "phpactor", "phpantom_lsp" }
      local exclude = { "phpcs", "php-cs-fixer" }
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return not vim.tbl_contains(exclude, tool)
      end, opts.ensure_installed or {})
      vim.list_extend(opts.ensure_installed, include)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = { enabled = true },
        intelephense = { enabled = false },
        phpantom_lsp = {
          enabled = false,
          on_attach = function(client, bufnr)
            local group = vim.api.nvim_create_augroup("phpantom-refresh", { clear = true })

            local function refresh()
              if not vim.api.nvim_buf_is_valid(bufnr) then
                return
              end
              vim.lsp.diagnostic._refresh(bufnr)
              if client.supports_method("textDocument/inlayHint") then
                local line_count = vim.api.nvim_buf_line_count(bufnr)
                local params = vim.lsp.util.make_given_range_params(
                  { 1, 1 },
                  { line_count, 1 },
                  bufnr,
                  client.offset_encoding or "utf-16"
                )
                client.request("textDocument/inlayHint", params, nil, bufnr)
              end
            end

            vim.api.nvim_create_autocmd("CursorHold", {
              buffer = bufnr,
              group = group,
              callback = refresh,
            })
            vim.api.nvim_create_autocmd("TextChanged", {
              buffer = bufnr,
              group = group,
              callback = refresh,
            })
            vim.api.nvim_create_autocmd("BufWritePost", {
              buffer = bufnr,
              group = group,
              callback = refresh,
            })
          end,
        },
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
