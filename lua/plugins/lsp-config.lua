return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",            -- Completion
      "hrsh7th/cmp-nvim-lsp",        -- LSP source for nvim-cmp
      "jose-elias-alvarez/null-ls.nvim" -- For Prettier integration
    },
    config = function()
      local lspconfig = require("lspconfig")
      local null_ls = require("null-ls")

      lspconfig.tsserver.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })

      lspconfig.eslint.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          }),
          null_ls.builtins.diagnostics.eslint,  -- For real-time linting
        },
      })
    end,
  }
}
