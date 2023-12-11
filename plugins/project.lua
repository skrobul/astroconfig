return {
  {
    "ahmedkhalf/project.nvim",
    main = "project_nvim",
    event = "VeryLazy",
    opts = {
      ignore_lsp = { "lua_ls" },
      exclude_dirs = {},
      -- What scope to change the directory, valid options are
      -- * global (default)
      -- * tab
      -- * win
      scope_chdir = 'tab',
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "jay-babu/project.nvim" },
    opts = function() require("telescope").load_extension "projects" end,
  },
}
