return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function () 
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  },
  {
    {
      "fdschmidt93/telescope-egrepify.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function ()
        require("telescope").setup({ "$YOUR_TELESCOPE_OPTS" })
        require("telescope").load_extension "egrepify" 

        vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope egrepify<CR>', {  })
      end
    } 
  }
}
