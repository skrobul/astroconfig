-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>fp"] = { ":Telescope projects<cr>", desc = "Find project" },
    ["ga"] = { "<Plug>(EasyAlign)", desc = "Interactive EasyAlign" },
    ["]q"] = { "<cmd>cnext<cr>", desc="Quickfix next"},
    ["[q"] = { "<cmd>cprev<cr>", desc="Quickfix prev"},

    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>fw"] =  { require("telescope").extensions.live_grep_args.live_grep_args, desc="Live Grep" },

    -- smart-splits
    --
    -- move between splits
    ["<C-h>"] = { require("smart-splits").move_cursor_left, desc="Move to split left" },
    ["<C-j>"] = { require("smart-splits").move_cursor_down, desc="Move to split down" },
    ["<C-k>"] = { require("smart-splits").move_cursor_up, desc="Move to split up" },
    ["<C-l>"] = { require("smart-splits").move_cursor_right, desc="Move to right split" },
    -- resizing
    ["<A-h>"] = { require("smart-splits").resize_cursor_left, desc="resize to split left" },
    ["<A-j>"] = { require("smart-splits").resize_cursor_down, desc="resize to split down" },
    ["<A-k>"] = { require("smart-splits").resize_cursor_up, desc="resize to split up" },
    ["<A-l>"] = { require("smart-splits").resize_cursor_right, desc="resize to right split" },

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  x = {
    ["ga"] = "<Plug>(EasyAlign)", desc = "Interactive EasyAlign",
  }

}
