return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Configure eslint for diagnostics and code actions
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint, -- This enables auto-fix for missing imports
      },
    })

    vim.api.nvim_set_keymap(
      'n',
      '<leader>ai', -- Replace with your preferred key combo
      '<cmd>lua vim.lsp.buf.code_action()<CR>',
      { noremap = true, silent = true }
    )
  end,
}
