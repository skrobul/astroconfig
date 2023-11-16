return {
  "nvim-telescope/telescope.nvim",
   dependencies = {
    {
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
    },
  },
  config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require("plugins.configs.telescope")(plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "live_grep_args"
    end,
}
