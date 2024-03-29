return {
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    commands = { "TSJToggle", "TSJSplit", "TSJJoin"},
    config = function()
      require('treesj').setup({
        use_default_keymaps = false
      })
    end,
  }
}
