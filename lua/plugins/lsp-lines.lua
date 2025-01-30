return {
    "Maan2003/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({ virtual_lines = true, virtual_text = false }) -- Enable virtual lines
  end,
}
