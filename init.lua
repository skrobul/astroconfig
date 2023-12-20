return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",                     -- remote to use
    channel = "stable",                    -- "stable" or "nightly"
    version = "latest",                    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",                    -- branch name (NIGHTLY ONLY)
    commit = nil,                          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,                     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,                  -- skip prompts about breaking changes
    show_changelog = true,                 -- show the changelog after performing an update
    auto_quit = false,                     -- automatically quit the current session after a successful update
    remotes = {                            -- easily add new remotes to track
      ["skrobul"] = "skrobul/astroconfig", -- GitHub user/repo shortcut,
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      helm_ls = {
        filetypes = { "helm", "helm.yaml", "helm.tmpl"}
      },
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
          },
        schemaStore = {
          enable = true,
          -- url=
        }
      }
    }
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    local utils = require("user.helm.utils")
    vim.filetype.add({
      extension = {
        yaml = utils.yaml_filetype,
        yml = utils.yaml_filetype,
        tmpl = utils.tmpl_filetype,
        tpl = utils.tpl_filetype
      },
      filename = {
        ["Chart.yaml"] = "yaml",
        ["Chart.lock"] = "yaml",
      }
    })


    local events = { "BufNewFile", "BufRead" }

    local au_helm = vim.api.nvim_create_augroup("Helm", {})

    vim.api.nvim_create_autocmd(events, {
      pattern = "helm*",
      group = au_helm,
      command = "setlocal commentstring={{/*\\ %s\\ */}}",
    })

    local yaml_ft = require("user.ansible.autodetect").yaml_ft

    vim.filetype.add {
      extension = {
        yml = yaml_ft,
        yaml = yaml_ft,
      },
    }

    -- ZMK keymap formatting
    -- vim.api.nvim_create_user_command("ZMKFormatKeycodes", "EasyAlign * /&\\w\\+/ dll2", {})
  end,
}
