return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "ruby", "python", "yaml" },
  },
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
      -- config = function() require('settings.treesitter') end,
    },
  },
}
