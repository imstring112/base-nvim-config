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
      "fdschmidt93/telescope-egrepify.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function ()
        require("telescope").setup({ "$YOUR_TELESCOPE_OPTS" })
        require("telescope").load_extension "egrepify" 

        vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope egrepify<CR>', {  })
      end
  },
  {
    'piersolenski/telescope-import.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      require("telescope").load_extension("import")
      require("telescope").setup({
        extensions = {
          import = {
            -- Imports can be added at a specified line whilst keeping the cursor in place
            insert_at_top = true,
            -- Optionally support additional languages or modify existing languages...
            custom_languages = {
              {
                -- The filetypes that ripgrep supports (find these via `rg --type-list`)
                extensions = { "js", "ts" },
                -- The Vim filetypes
                filetypes = { "vue" },
                -- Optionally set a line other than 1
                insert_at_line = 2, ---@type function|number,
                -- The regex pattern for the import statement
                regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
              },
            },
          },
        },
      })
    end
  }  
}
