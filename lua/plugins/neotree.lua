return  {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",       
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>', {})
      require("neo-tree").setup({
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,      
                hide_gitignored = false,    
                hide_by_name = {},          
                hide_by_pattern = {},       
                always_show = {}
            }
        }
      })
    end
  }
}

