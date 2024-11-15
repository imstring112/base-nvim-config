return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',      -- LSP completion source
    'hrsh7th/cmp-buffer',        -- Buffer completion source
    'hrsh7th/cmp-path',          -- File path completion source
    'saadparwaiz1/cmp_luasnip',  -- Snippet completion source
    'L3MON4D3/LuaSnip',          -- Snippet engine
    'rafamadriz/friendly-snippets'
  },
  config = function ()
    require('nvim-treesitter').setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "php", "javascript", "typescript" },
      sync_install = false,
      auto_install = true,
      ignore_install = { },
      indent = {enable = true},
      highlight = {
        enable = true,
        disable = { "c", "rust" },
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
    })

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },    -- LSP source for language-aware completion
        { name = 'luasnip' },     -- Snippet source
        { name = 'buffer' },      -- Buffer source for text in open buffers
        { name = 'path' },        -- Path source for file paths
      }),
    })
  end
}
