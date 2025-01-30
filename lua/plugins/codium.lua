return {
    'Exafunction/codeium.vim',
    config = function()
      -- Optional: Set any key mappings or configurations here
      vim.keymap.set("i", "<C-J>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-K>", function() return vim.fn end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-L>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
    end
}
